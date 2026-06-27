local name = 'markdown-preview.nvim'

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.spec.name == name and (event.data.kind == 'install' or event.data.kind == 'update') then
      local root = event.data.path
      local package = vim.json.decode(table.concat(vim.fn.readfile(vim.fs.joinpath(root, 'package.json')), '\n'))
      local app = vim.fs.joinpath(root, 'app')
      local command

      if vim.fn.has 'win32' == 1 then
        command = { 'cmd.exe', '/C', vim.fs.joinpath(app, 'install.cmd'), 'v' .. package.version }
      else
        command = { vim.fs.joinpath(app, 'install.sh'), 'v' .. package.version }
      end

      vim.system(command, { cwd = app, text = true }, function(result)
        vim.schedule(function()
          if result.code == 0 then
            vim.notify(name .. ' build completed')
          else
            vim.notify(('Failed to build %s:\n%s'):format(name, result.stderr or result.stdout), vim.log.levels.ERROR)
          end
        end)
      end)
    end
  end,
})

vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }
vim.cmd.packadd(name)
