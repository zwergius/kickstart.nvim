local servers = {
  cssls = {},
  emmet_language_server = {},
  eslint = {},
  html = {},
  svelte = {},
  tailwindcss = {},
  ts_ls = {},
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason-tool-installer').setup {
  ensure_installed = vim.tbl_keys(servers),
}

for name, server in pairs(servers) do
  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
