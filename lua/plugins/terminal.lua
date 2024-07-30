return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<C-t>]],
    direction = "horizontal",
    shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
  },
  config = function()
    local toggleterm = require("toggleterm")

    -- Set up toggleterm
    toggleterm.setup({
      size = 20,
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
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

    -- Function to open a horizontal terminal
    function _G.open_horizontal_terminal()
      local term = require("toggleterm.terminal").Terminal:new({
        direction = "horizontal",
      })
      term:toggle()
    end

    -- Function to open a vertical terminal with specified width
    function _G.open_vertical_terminal()
      local term = require("toggleterm.terminal").Terminal:new({
        direction = "vertical",
      })
      term:toggle()
    end

    -- Key mapping to open a horizontal terminal
    vim.api.nvim_set_keymap('n', '<leader>th', ':lua open_horizontal_terminal()<CR>', { noremap = true, silent = true })

    -- Key mapping to open a vertical terminal
    vim.api.nvim_set_keymap('n', '<leader>tv', ':lua open_vertical_terminal()<CR>', { noremap = true, silent = true })

    -- Function to close the current terminal
    function _G.close_current_terminal()
      local term = require("toggleterm.terminal").Terminal:get(0)
      if term then
        term:close()
      end
    end

    -- Function to close all terminals (using a list of open terminals)
    function _G.close_all_terminals()
      local term_list = require("toggleterm.terminal").get_all() or {}
      for _, term in ipairs(term_list) do
        term:close()
      end
    end

    -- Key mapping to close the current terminal
    vim.api.nvim_set_keymap('n', '<leader>tc', ':lua close_current_terminal()<CR>', { noremap = true, silent = true })

    -- Key mapping to close all terminals
    vim.api.nvim_set_keymap('n', '<leader>ta', ':lua close_all_terminals()<CR>', { noremap = true, silent = true })
  end,
}
