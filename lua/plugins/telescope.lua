     return{
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require("telescope.builtin")

-- Define the search directory (change this path as needed)
        local search_dir = vim.fn.expand('%:p:h')

  vim.keymap.set('n', '<C-p>', function()
    builtin.find_files({
      cwd = search_dir
    })
  end, {})
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({
    cwd = vim.fn.expand('%:p:h')
  })
end, {})
end
  }
