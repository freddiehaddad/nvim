$data_path = Join-Path $env:LOCALAPPDATA nvim-data
Remove-Item -Recurse -Force -Path @("$data_path",".\nvim-pack-lock.json") -ErrorAction SilentlyContinue
