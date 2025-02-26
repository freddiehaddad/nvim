local M = {}

---@diagnostic disable-next-line: unused-local
function M.highlight(palette, opts)
    return {
        LazyButton = { link = "NormalFloat" },
        -- LazyButtonActive        Visual
        -- LazyComment             Comment
        -- LazyCommit              @variable.builtin       commit ref
        -- LazyCommitIssue         Number
        -- LazyCommitScope         Italic                  conventional commit scope
        -- LazyCommitType          Title                   conventional commit type
        -- LazyDimmed              Conceal                 property
        -- LazyDir                 @markup.link            directory
        -- LazyH1                  IncSearch               home button
        -- LazyH2                  Bold                    titles
        -- LazyLocal               Constant
        -- LazyNoCond              DiagnosticWarn          unloaded icon for a plugin where cond() was false
        -- LazyNormal              NormalFloat
        -- LazyProgressDone        Constant                progress bar done
        -- LazyProgressTodo        LineNr                  progress bar todo
        -- LazyProp                Conceal                 property
        -- LazyReasonCmd           Operator
        -- LazyReasonEvent         Constant
        -- LazyReasonFt            Character
        -- LazyReasonImport        Identifier
        -- LazyReasonKeys          Statement
        -- LazyReasonPlugin        Special
        -- LazyReasonRequire       @variable.parameter
        -- LazyReasonRuntime       @macro
        -- LazyReasonSource        Character
        -- LazyReasonStart         @variable.member
        -- LazySpecial = { fg = palette.white },
        -- LazyTaskError           ErrorMsg                task errors
        -- LazyTaskOutput          MsgArea                 task output
        -- LazyUrl                 @markup.link            url
        -- LazyValue               @string                 value of a property
    }
end

return M
