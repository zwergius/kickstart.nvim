-- Line & relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- no line wrap
vim.o.wrap = false

-- Indents
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Infinite undo
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.o.undofile = true

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Scroll buffer
vim.o.scrolloff = 8

-- Filetype overrides
vim.filetype.add {
  extension = {
    pcss = 'postcss',
    postcss = 'css',
  },
}

-- Fold method
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- Spellchecking
vim.o.spelllang = 'en_gb'
vim.o.spell = true

-- Autocommand create folder(s) for new file
vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath 'config', 'vim', 'auto-mkdir.vim'))
