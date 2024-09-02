return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true, 
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",       -- Add TSX parser for JSX and TSX files
        "c_sharp",
        "css",
        "html",
        "java",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
    
    local ts_utils = require('nvim-treesitter.ts_utils')

    local function show_tag_info()
      local buf = vim.api.nvim_get_current_buf()
      local node = ts_utils.get_node_at_cursor()

      local function get_tag_info(node)
        if node then
          local node_type = node:type()

          if node_type == 'jsx_tag_name' or node_type == 'tag_name' then
            local start_row, start_col, end_row, end_col = node:range()
            local tag_text = vim.api.nvim_buf_get_text(buf, start_row, start_col, end_row, end_col, {})

            local tag = tag_text[1]
            local closing_tag = string.format('</%s>', tag)
            vim.api.nvim_echo({{tag .. " " .. closing_tag, "Normal"}}, false, {})
            return
          end

          -- Recursively check child nodes
          for child in node:iter_children() do
            get_tag_info(child)
          end
        end
      end

      get_tag_info(node)
    end

    -- Key mapping for the function
    vim.api.nvim_set_keymap('n', '<leader>st', ':lua show_tag_info()<CR>', { noremap = true, silent = true })
  end
}
