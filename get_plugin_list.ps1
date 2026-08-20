param (
    [string]$OutputFile = "plugins_list.txt"
)

$env:LAZY_EXPORT_FILE = $OutputFile

nvim --headless -c "lua local f = io.open(vim.env.LAZY_EXPORT_FILE, 'w'); local c = 0; for _, p in ipairs(require('lazy').plugins()) do f:write(p.name .. '\n'); c = c + 1 end; f:close(); print('Exported ' .. c .. ' plugins to ' .. vim.env.LAZY_EXPORT_FILE)" -c "q"

Write-Host " "
Write-Host "Exported plugin list to $OutputFile" -ForegroundColor Green
