local conform = require 'conform'

local prettier = { 'prettierd', 'prettier', stop_after_first = true }

local web_filetypes = {
  css = true,
  html = true,
  javascriptreact = true,
  json = true,
  jsonc = true,
  less = true,
  markdown = true,
  postcss = true,
  scss = true,
  svelte = true,
  typescriptreact = true,
  yaml = true,
}

for filetype in pairs(web_filetypes) do
  conform.formatters_by_ft[filetype] = prettier
end

-- Svelte formatting needs project-local prettier-plugin-svelte, which project-local
-- prettier resolves more reliably than the global prettierd daemon.
conform.formatters_by_ft.svelte = { 'prettier' }

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Format web files on save',
  group = vim.api.nvim_create_augroup('zwergius-format-on-save', { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].buftype ~= '' or not web_filetypes[vim.bo[args.buf].filetype] then return end
    conform.format { bufnr = args.buf, timeout_ms = 2000, lsp_format = 'fallback' }
  end,
})
