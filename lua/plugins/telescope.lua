-- return {
--   {
--     'nvim-telescope/telescope.nvim', tag = '0.1.8',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       local builtin = require("telescope.builtin")
--
--       -- Helper function to resolve valid `cwd`
--       local function get_cwd()
--         local path = vim.fn.expand('%:p:h')
--         if path == "" or vim.fn.isdirectory(path) == 0 then
--           return vim.fn.getcwd()
--         end
--         return path
--       end
--
--       -- Keymap for finding files
--       vim.keymap.set('n', '<C-p>', function()
--         local search_dir = get_cwd()
--         builtin.find_files({
--           cwd = search_dir,
--           find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*", "--glob", "!node_modules/**", "--glob", "!obj/**", "--glob", "!bin/**" }
--         })
--       end, {})
--
--       -- Keymap for live grep
--       vim.keymap.set('n', '<leader>fg', function()
--         local search_dir = get_cwd()
--         builtin.live_grep({
--           cwd = search_dir,
--           additional_args = function()
--             return { "--glob", "!node_modules/**", "--glob", "!obj/**", "--glob", "!bin/**" }
--           end
--         })
--       end, {})
--     end
--   },
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--     config = function()
--       require("telescope").setup({
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown()
--           }
--         }
--       })
--       require("telescope").load_extension("ui-select")
--     end
--   }
-- }
--

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")

      -- Define the search directory (change this path as needed)
      local search_dir = vim.fn.expand('%:p:h')
      -- print("search directory : ", search_dir)
      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({
          cwd = search_dir,
          find_command = { "rg", "--files", "--iglob", "!.git", "--hidden", "--glob", "!node_modules/**", "--glob", "!obj/**", "--glob", "!bin/**" }
        })
      end, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep({
          cwd = vim.fn.expand('%:p:h'),
          additional_args = function()
            return { "--glob", "!node_modules/**", "--glob", "!obj/**", "--glob", "!bin/**" }
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
