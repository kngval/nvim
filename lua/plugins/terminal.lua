return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- opts = {
  --   size = 20,
  --   open_mapping = [[<C-t>]],
  --   direction = "horizontal",
  --   shell = "/usr/bin/zsh",
  -- },
  config = function()
    local toggleterm = require("toggleterm")

    -- Set up toggleterm
    toggleterm.setup({
      size = 20,
      open_mapping = [[<C-t>]],
      direction = "float",
      shell = "/usr/bin/zsh",
      float_opts = {
        border = "rounded"
      }
    })

    -- Key mappings for toggling in normal mode
    vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })

    -- Key mappings for exiting terminal mode
    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      -- Pressing 'jk' in terminal mode to exit to normal mode
      vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      -- Pressing '<C-t>' in terminal mode to toggle the terminal
      vim.api.nvim_buf_set_keymap(0, "t", "<C-t>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    end

    -- Apply the terminal key mappings when terminal opens
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- Create a global table to store terminal instances
    _G.terminal_instances = {}

    -- Function to open a horizontal terminal
    function _G.open_horizontal_terminal()
      local term = require("toggleterm.terminal").Terminal:new({
        direction = "horizontal",
      })
      term:toggle()
      table.insert(_G.terminal_instances, term)
    end

    -- Function to open a vertical terminal with specified width
    function _G.open_vertical_terminal()
      local term = require("toggleterm.terminal").Terminal:new({
        direction = "vertical",
      })
      term:toggle()
      table.insert(_G.terminal_instances, term)
    end

    -- Function to open a floating terminal
    function _G.open_floating_terminal()
      local term = require("toggleterm.terminal").Terminal:new({
        direction = "float",
        float_opts = {
          border = "rounded", -- Optional: specify border style
        },
      })
      term:toggle()
    end

    -- Key mapping to open a horizontal terminal
    vim.api.nvim_set_keymap('n', '<leader>th', ':lua open_horizontal_terminal()<CR>', { noremap = true, silent = true })

    -- Key mapping to open a vertical terminal
    vim.api.nvim_set_keymap('n', '<leader>tv', ':lua open_vertical_terminal()<CR>', { noremap = true, silent = true })

    -- Key mapping to open a floating terminal
    vim.api.nvim_set_keymap('n', '<leader>tf', ':lua open_floating_terminal()<CR>', { noremap = true, silent = true })

    -- Function to close the current terminal
    function _G.close_current_terminal()
      for i, term in ipairs(_G.terminal_instances) do
        if term:is_open() then
          term:close()
          table.remove(_G.terminal_instances, i)
          break
        end
      end
    end

    -- Function to close all terminals
    function _G.close_all_terminals()
      for i, term in ipairs(_G.terminal_instances) do
        term:close()
      end
      _G.terminal_instances = {}
    end

    -- Key mapping to close the current terminal
    vim.api.nvim_set_keymap('n', '<leader>tc', ':lua close_current_terminal()<CR>', { noremap = true, silent = true })

    -- Key mapping to close all terminals
    vim.api.nvim_set_keymap('n', '<leader>ta', ':lua close_all_terminals()<CR>', { noremap = true, silent = true })
  end,
}
