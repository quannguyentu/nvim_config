#!/usr/bin/env bash
# Export lazy.nvim plugin list to a file
# Usage: ./get_plugin_list.sh [output_file]

set -euo pipefail

OUTPUT_FILE="${1:-plugins_list.txt}"

export LAZY_EXPORT_FILE="$OUTPUT_FILE"

nvim --headless -c "lua local f = io.open(vim.env.LAZY_EXPORT_FILE, 'w'); local c = 0; for _, p in ipairs(require('lazy').plugins()) do f:write(p.name .. '\n'); c = c + 1 end; f:close(); print('Exported ' .. c .. ' plugins to ' .. vim.env.LAZY_EXPORT_FILE)" -c "q"

echo
echo "Exported plugin list to $OUTPUT_FILE"