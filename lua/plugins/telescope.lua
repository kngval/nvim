return{
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")

      -- Define the search directory (change this path as needed)
      local search_dir = vim.fn.expand('%:p:h')

      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({
          cwd = search_dir,
          find_command = { "rg", "--files", "--iglob", "!.git", "--hidden", "--glob", "!node_modules/**" } 
        })
      end, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep({
            cwd = vim.fn.expand('%:p:h'),
            additional_args = function()
            return { "--glob", "!node_modules/**" }
          end
        })
      end, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()

          }
        }

      })
      require("telescope").load_extension("ui-select")
    end
  }
}
