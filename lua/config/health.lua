---@diagnostic disable: undefined-global

local M = {}

-- ---------------------------------------------------------------------------
-- Dependency table (single source of truth)
-- ---------------------------------------------------------------------------
-- kind:     "executable" | "directory" | "file" | "special"
-- required: true → error if missing; false → warn if missing
-- version:  optional command table to get version string
-- version_fn: optional function returning version string (for non-standard tools)
-- advice:   install instructions shown on failure
-- latest:   optional table to check for updates
--           { source = "github", repo = "owner/repo" }
--           { source = "crates", crate = "crate-name" }
--           { source = "npm", package = "package-name" }
--           { source = "winget", id = "Publisher.Package" }

local is_win = vim.fn.has("win32") == 1

local home = vim.fn.expand("~")

--- Run a command and return the first line of stdout, or nil on failure.
local function get_version(cmd)
    local ok, result = pcall(vim.system, cmd, { timeout = 5000 })
    if not ok then
        return nil
    end
    local out = result:wait()
    if out.code ~= 0 or not out.stdout then
        return nil
    end
    local line = out.stdout:match("([^\r\n]+)")
    return line and vim.trim(line) or nil
end

local deps = {
    -- Section 1: Core Requirements
    core = {
        {
            name = "Neovim",
            kind = "special",
            required = true,
            min_version = { 0, 12, 0 },
        },
        {
            name = "git",
            check = "git",
            kind = "executable",
            required = true,
            version = { "git", "--version" },
            advice = "Install: https://git-scm.com/downloads",
            latest = { source = "winget", id = "Git.Git" },
        },
        {
            name = "ripgrep",
            check = "rg",
            kind = "executable",
            required = true,
            version = { "rg", "--version" },
            advice = "Install: winget install BurntSushi.ripgrep",
            latest = { source = "github", repo = "BurntSushi/ripgrep" },
        },
        {
            name = "PowerShell",
            kind = "special",
            required = true,
            version = { "pwsh", "--version" },
            advice = "Install: winget install Microsoft.PowerShell",
            latest = { source = "winget", id = "Microsoft.PowerShell" },
        },
        {
            name = "cmake",
            check = "cmake",
            kind = "executable",
            required = true,
            version = { "cmake", "--version" },
            advice = "Install: winget install Kitware.CMake",
            latest = { source = "winget", id = "Kitware.CMake" },
        },
        {
            name = "tree-sitter",
            check = "tree-sitter",
            kind = "executable",
            required = true,
            version = { "tree-sitter", "--version" },
            advice = "Install: cargo install --locked tree-sitter-cli",
            latest = { source = "crates", crate = "tree-sitter-cli" },
        },
    },

    -- Section 2: Package Managers (bootstrap helpers)
    managers = {
        {
            name = "cargo",
            check = "cargo",
            kind = "executable",
            required = false,
            version = { "cargo", "--version" },
            used_by = "taplo-cli, tree-sitter-cli install; Rust debug builds",
            advice = "Install Rust: https://rustup.rs/",
        },
        {
            name = "npm",
            check = "npm",
            kind = "executable",
            required = false,
            version = { "npm", "--version" },
            used_by = "jsonls, yamlls install",
            advice = "Install Node.js: https://nodejs.org/",
        },
        {
            name = "gh",
            check = "gh",
            kind = "executable",
            required = false,
            version = { "gh", "--version" },
            used_by = "codelldb, powershell_es download",
            advice = "Install: winget install GitHub.cli",
            latest = { source = "github", repo = "cli/cli" },
        },
    },

    -- Section 3: LSP Servers
    lsp = {
        {
            name = "clangd",
            check = "clangd",
            kind = "executable",
            required = true,
            version = { "clangd", "--version" },
            advice = "Install: winget install LLVM.clangd",
            latest = { source = "winget", id = "LLVM.clangd" },
        },
        {
            name = "jsonls",
            check = "vscode-json-language-server",
            kind = "executable",
            required = true,
            version_fn = function()
                local ok, result = pcall(vim.system,
                    { "npm", "list", "-g", "vscode-langservers-extracted" },
                    { timeout = 5000 }
                )
                if not ok then
                    return nil
                end
                local out = result:wait()
                if out.code ~= 0 or not out.stdout then
                    return nil
                end
                return out.stdout:match("@(%d+%.%d+%.%d+)")
            end,
            advice = "Install: npm install -g vscode-langservers-extracted",
            latest = { source = "npm", package = "vscode-langservers-extracted" },
        },
        {
            name = "lua_ls",
            check = "lua-language-server",
            kind = "executable",
            required = true,
            version = { "lua-language-server", "--version" },
            advice = "Install: winget install LuaLS.lua-language-server",
            latest = { source = "github", repo = "LuaLS/lua-language-server" },
        },
        {
            name = "marksman",
            check = "marksman",
            kind = "executable",
            required = true,
            version = { "marksman", "--version" },
            advice = "Install: winget install Artempyanykh.Marksman",
            latest = { source = "github", repo = "artempyanykh/marksman", date_based = true },
        },
        {
            name = "powershell_es",
            check = home .. "/.local/bin/PowerShellEditorServices",
            kind = "directory",
            required = true,
            version_fn = function()
                local psd1 = home .. "/.local/bin/PowerShellEditorServices"
                    .. "/PowerShellEditorServices/PowerShellEditorServices.psd1"
                local f = io.open(vim.fn.expand(psd1), "r")
                if not f then
                    return nil
                end
                local content = f:read("*a")
                f:close()
                return content:match("ModuleVersion%s*=%s*'([^']+)'")
            end,
            advice = table.concat({
                "Install: gh release download --repo PowerShell/PowerShellEditorServices",
                "         --pattern PowerShellEditorServices.zip",
                "Extract: Expand-Archive -Path .\\PowerShellEditorServices.zip",
                "         -DestinationPath ~/.local/bin/PowerShellEditorServices",
            }, "\n"),
            latest = { source = "github", repo = "PowerShell/PowerShellEditorServices" },
        },
        {
            name = "rust_analyzer",
            kind = "special",
            required = true,
            version_fn = function()
                local result = vim.system(
                    { "rustup", "which", "rust-analyzer" }, { timeout = 5000 }
                ):wait()
                if result.code ~= 0 or not result.stdout then
                    return nil
                end
                local path = vim.trim(result.stdout)
                if vim.uv.fs_stat(path) then
                    local ver = vim.system(
                        { path, "--version" }, { timeout = 5000 }
                    ):wait()
                    if ver.code == 0 and ver.stdout then
                        return vim.trim(ver.stdout:match("([^\r\n]+)") or "")
                    end
                end
                return nil
            end,
            advice = "Update: rustup update stable",
            latest = { source = "rustup" },
        },
        {
            name = "taplo",
            check = "taplo",
            kind = "executable",
            required = true,
            version = { "taplo", "--version" },
            advice = "Install: cargo install --features lsp --locked taplo-cli",
            latest = { source = "crates", crate = "taplo-cli" },
        },
        {
            name = "yamlls",
            check = "yaml-language-server",
            kind = "executable",
            required = true,
            version = { "yaml-language-server", "--version" },
            advice = "Install: npm install -g yaml-language-server",
            latest = { source = "npm", package = "yaml-language-server" },
        },
    },

    -- Section 4: Debug Adapter
    debug = {
        {
            name = "codelldb",
            check = home .. "/.local/bin/codelldb/extension/adapter/codelldb"
                .. (is_win and ".exe" or ""),
            kind = "file",
            required = true,
            version_fn = function()
                local pkg = home .. "/.local/bin/codelldb/extension/package.json"
                local f = io.open(vim.fn.expand(pkg), "r")
                if not f then
                    return nil
                end
                local content = f:read("*a")
                f:close()
                local ok, data = pcall(vim.json.decode, content)
                if not ok or not data then
                    return nil
                end
                return data.version
            end,
            advice = table.concat({
                "Install: gh release download --repo vadimcn/codelldb",
                '         --pattern "*win32-x64.vsix"',
                "Extract: Expand-Archive -Path .\\codelldb-win32-x64.vsix",
                "         -DestinationPath ~/.local/bin/codelldb",
            }, "\n"),
            latest = { source = "github", repo = "vadimcn/codelldb" },
        },
    },
}

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

--- Extract a semver-like version (X.Y.Z) from a string.
local function extract_version(text)
    if not text then
        return nil
    end
    return text:match("(%d+%.%d+%.%d+)")
end

--- Fetch a URL via curl and return the body, or nil on failure.
local function fetch_url(url, headers)
    local args = { "curl", "-sL", "--max-time", "5" }
    if headers then
        for k, v in pairs(headers) do
            table.insert(args, "-H")
            table.insert(args, k .. ": " .. v)
        end
    end
    table.insert(args, url)
    local ok, result = pcall(vim.system, args, { timeout = 10000 })
    if not ok then
        return nil
    end
    local out = result:wait()
    if out.code ~= 0 or not out.stdout then
        return nil
    end
    return out.stdout
end

--- Fetch the latest version for a dependency from its upstream source.
local function fetch_latest(dep)
    if not dep.latest then
        return nil
    end
    local src = dep.latest

    if src.source == "github" then
        local body = fetch_url(
            "https://api.github.com/repos/" .. src.repo .. "/releases/latest",
            { Accept = "application/vnd.github.v3+json" }
        )
        if not body then
            return nil
        end
        local ok, data = pcall(vim.json.decode, body)
        if not ok or not data or not data.tag_name then
            return nil
        end
        if src.date_based then
            return data.tag_name
        end
        return extract_version(data.tag_name)
    end

    if src.source == "crates" then
        local body = fetch_url(
            "https://crates.io/api/v1/crates/" .. src.crate,
            { ["User-Agent"] = "nvim-config-healthcheck" }
        )
        if not body then
            return nil
        end
        local ok, data = pcall(vim.json.decode, body)
        if not ok or not data or not data.crate then
            return nil
        end
        return data.crate.max_version
    end

    if src.source == "npm" then
        local body = fetch_url(
            "https://registry.npmjs.org/" .. src.package .. "/latest"
        )
        if not body then
            return nil
        end
        local ok, data = pcall(vim.json.decode, body)
        if not ok or not data or not data.version then
            return nil
        end
        return data.version
    end

    if src.source == "winget" then
        local ok, result = pcall(vim.system,
            { "winget", "search", "--id", src.id, "--exact" },
            { timeout = 15000 }
        )
        if not ok then
            return nil
        end
        local out = result:wait()
        if out.code ~= 0 or not out.stdout then
            return nil
        end
        -- Parse column-aligned output: find "Version" column in header,
        -- then extract the version from the data line at that offset.
        local header, data_line
        for line in out.stdout:gmatch("[^\r\n]+") do
            if line:match("^%-%-") then
                -- Next non-empty line is the data
                data_line = nil
            elseif header and not data_line then
                data_line = line
            end
            if line:match("^Name") and line:match("Version") then
                header = line
            end
        end
        if not header or not data_line then
            return nil
        end
        local ver_start = header:find("Version")
        if not ver_start then
            return nil
        end
        local ver_field = data_line:sub(ver_start)
        return extract_version(ver_field)
    end

    if src.source == "rustup" then
        local ok, result = pcall(vim.system,
            { "rustup", "check" }, { timeout = 15000 }
        )
        if not ok then
            return nil
        end
        local out = result:wait()
        if out.code ~= 0 or not out.stdout then
            return nil
        end
        -- Look for the stable toolchain line:
        -- "stable-... - Update available: 1.94.1 -> 1.95.0"
        -- "stable-... - up to date: 1.94.1 (...)"
        for line in out.stdout:gmatch("[^\r\n]+") do
            if line:match("^stable") then
                local new_ver = line:match("Update available.*->%s*(%d+%.%d+%.%d+)")
                if new_ver then
                    return new_ver
                end
                local cur_ver = line:match("up to date.*(%d+%.%d+%.%d+)")
                if cur_ver then
                    return cur_ver
                end
            end
        end
        return nil
    end

    return nil
end
local function extract_date(text)
    if not text then
        return nil
    end
    return text:match("(%d%d%d%d%-%d%d%-%d%d)")
end

--- Compare installed version string against latest and report.
--- Returns a result table for deferred reporting, or nil if no check needed.
local function check_update(dep, installed_ver_str)
    if not dep.latest then
        return nil
    end
    local date_based = dep.latest.date_based
    if date_based then
        local installed = extract_date(installed_ver_str)
        if not installed then
            return nil
        end
        return { dep = dep, installed = installed, date_based = true }
    else
        local installed = extract_version(installed_ver_str)
        if not installed then
            return nil
        end
        return { dep = dep, installed = installed }
    end
end

--- Run all deferred update checks and report results.
local function report_updates(pending)
    if #pending == 0 then
        return
    end

    vim.health.start("Update checks")

    if vim.fn.executable("curl") ~= 1 then
        vim.health.warn("curl not found in PATH — skipping remote update checks")
        return
    end

    for _, item in ipairs(pending) do
        local dep = item.dep
        local installed = item.installed
        local latest = fetch_latest(dep)
        if not latest then
            vim.health.info(dep.name .. ": could not fetch latest version")
        elseif item.date_based then
            -- Date-based comparison (YYYY-MM-DD strings sort lexicographically)
            if installed < latest then
                vim.health.warn(
                    dep.name .. ": update available " .. installed .. " → " .. latest,
                    dep.advice
                )
            else
                vim.health.ok(dep.name .. ": up to date (" .. installed .. ")")
            end
        else
            local iv = vim.version.parse(installed, { strict = false })
            local lv = vim.version.parse(latest, { strict = false })
            if iv and lv then
                if vim.version.lt(iv, lv) then
                    vim.health.warn(
                        dep.name .. ": update available " .. installed .. " → " .. latest,
                        dep.advice
                    )
                else
                    vim.health.ok(dep.name .. ": up to date (" .. installed .. ")")
                end
            else
                vim.health.info(dep.name .. ": could not parse versions (installed="
                    .. installed .. ", latest=" .. latest .. ")")
            end
        end
    end
end

--- Resolve the installed version string for a dependency.
local function resolve_version(dep)
    if dep.version_fn then
        return dep.version_fn()
    end
    if dep.version then
        return get_version(dep.version)
    end
    return nil
end

--- Check a single dependency and report via vim.health.
--- Returns a pending update check table if applicable, or nil.
local function check_dep(dep)
    -- Special checks
    if dep.kind == "special" then
        if dep.name == "Neovim" then
            local v = vim.version()
            local min = dep.min_version
            if v.major > min[1]
                or (v.major == min[1] and v.minor > min[2])
                or (v.major == min[1] and v.minor == min[2] and v.patch >= min[3]) then
                vim.health.ok(("Neovim %s"):format(tostring(v)))
            else
                vim.health.error(
                    ("Neovim %s (need >= %d.%d.%d)"):format(tostring(v), min[1], min[2], min[3])
                )
            end
            return
        end

        if dep.name == "PowerShell" then
            local shell = vim.o.shell
            if shell:find("pwsh") then
                local ver = resolve_version(dep)
                if ver then
                    vim.health.ok(("pwsh (%s)"):format(ver))
                else
                    vim.health.ok("pwsh (configured as shell)")
                end
                return check_update(dep, ver)
            else
                if dep.required then
                    vim.health.error("pwsh is not the configured shell: " .. shell, dep.advice)
                else
                    vim.health.warn("pwsh is not the configured shell: " .. shell, dep.advice)
                end
            end
            return
        end

        if dep.name == "rust_analyzer" then
            local ver = resolve_version(dep)
            if ver then
                vim.health.ok(("rust_analyzer (%s)"):format(ver))
                return check_update(dep, ver)
            else
                if dep.required then
                    vim.health.error("rust-analyzer not found via rustup", dep.advice)
                else
                    vim.health.warn("rust-analyzer not found via rustup", dep.advice)
                end
            end
            return
        end
    end

    -- Executable check
    if dep.kind == "executable" then
        if vim.fn.executable(dep.check) == 1 then
            local ver = resolve_version(dep)
            local msg = dep.name
            if ver then
                msg = msg .. " (" .. ver .. ")"
            end
            if dep.used_by then
                msg = msg .. " — needed by: " .. dep.used_by
            end
            vim.health.ok(msg)
            return check_update(dep, ver)
        else
            local msg = dep.name .. ": `" .. dep.check .. "` not found in PATH"
            if dep.used_by then
                msg = msg .. " (needed by: " .. dep.used_by .. ")"
            end
            if dep.required then
                vim.health.error(msg, dep.advice)
            else
                vim.health.warn(msg, dep.advice)
            end
        end
        return
    end

    -- Directory check
    if dep.kind == "directory" then
        local path = vim.fn.expand(dep.check)
        if vim.fn.isdirectory(path) == 1 then
            local ver = resolve_version(dep)
            local msg = dep.name .. " (" .. path .. ")"
            if ver then
                msg = dep.name .. " (" .. ver .. ") — " .. path
            end
            vim.health.ok(msg)
            return check_update(dep, ver)
        else
            local msg = dep.name .. ": directory not found at " .. path
            if dep.required then
                vim.health.error(msg, dep.advice)
            else
                vim.health.warn(msg, dep.advice)
            end
        end
        return
    end

    -- File check (for specific binary files like codelldb)
    if dep.kind == "file" then
        local path = vim.fn.expand(dep.check)
        if vim.uv.fs_stat(path) then
            local ver = resolve_version(dep)
            local msg = dep.name .. " (" .. path .. ")"
            if ver then
                msg = dep.name .. " (" .. ver .. ") — " .. path
            end
            vim.health.ok(msg)
            return check_update(dep, ver)
        else
            local msg = dep.name .. ": file not found at " .. path
            if dep.required then
                vim.health.error(msg, dep.advice)
            else
                vim.health.warn(msg, dep.advice)
            end
        end
        return
    end
end

-- ---------------------------------------------------------------------------
-- check() entrypoint
-- ---------------------------------------------------------------------------

M.check = function()
    local pending_updates = {}

    local function collect(result)
        if result then
            table.insert(pending_updates, result)
        end
    end

    -- Section 1: Core Requirements
    vim.health.start("Core requirements")
    for _, dep in ipairs(deps.core) do
        collect(check_dep(dep))
    end

    -- Section 2: Package Managers
    vim.health.start("Package managers (bootstrap tools)")
    for _, dep in ipairs(deps.managers) do
        collect(check_dep(dep))
    end

    -- Section 3: LSP Servers
    vim.health.start("LSP servers")
    for _, dep in ipairs(deps.lsp) do
        collect(check_dep(dep))
    end

    -- Section 4: Debug Adapter
    vim.health.start("Debug adapter")
    for _, dep in ipairs(deps.debug) do
        collect(check_dep(dep))
    end

    -- Section 5: Plugins (vim.pack)
    vim.health.start("Plugins (vim.pack)")
    local ok, plugins = pcall(vim.pack.get)
    if not ok or not plugins then
        vim.health.warn("Could not query vim.pack status")
        return
    end

    local stale = {}
    for _, plug in ipairs(plugins) do
        if plug.active then
            vim.health.ok(plug.spec.name)
        else
            vim.health.warn(plug.spec.name .. " (not active — consider removing with vim.pack.del)")
            table.insert(stale, plug.spec.name)
        end
    end

    if #stale > 0 then
        vim.health.info(
            'Remove stale plugins: :lua vim.pack.del({ "'
            .. table.concat(stale, '", "')
            .. '" })'
        )
    end

    -- Lockfile info
    local lockfile = vim.fn.stdpath("config") .. "/nvim-pack-lock.json"
    if vim.uv.fs_stat(lockfile) then
        vim.health.ok("Lockfile: " .. lockfile)
    else
        vim.health.warn("Lockfile not found at " .. lockfile)
    end

    vim.health.info("Update plugins: <leader>pu or :lua vim.pack.update()")

    -- Section 6: Remote update checks (deferred to avoid blocking local checks)
    report_updates(pending_updates)
end

return M
