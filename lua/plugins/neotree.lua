return {
  -- "nvim-neo-tree/neo-tree.nvim",
  -- branch = "v3.x",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --   "MunifTanjim/nui.nvim",
  --   {
  --     's1n7ax/nvim-window-picker',
  --     version = '2.*',
  --     config = function()
  --       require 'window-picker'.setup({
  --         filter_rules = {
  --           include_current_win = false,
  --           autoselect_one = true,
  --           bo = {
  --             filetype = { 'neo-tree', "neo-tree-popup", "notify" },
  --             buftype = { 'terminal', "quickfix" },
  --           },
  --         },
  --       })
  --     end,
  --   },
  -- },
  -- config = function()
  --   local neotree_toggle = function()
  --     -- Open Neo-tree if it's closed
  --     require("neo-tree.command").execute({
  --       action = "focus",
  --       source = "filesystem",
  --       reveal = true,
  --       position = "float",
  --       cwd = vim.fn.getcwd(),   -- Set the current working directory as the root
  --     })
  --   end
  --   vim.keymap.set("n", "<C-n>", neotree_toggle, { desc = "Toggle Neotree in Current Directory" })
  --   vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  --   vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  --   vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  --   vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
  --
  --   require("neo-tree").setup({
  --     close_if_last_window = false,
  --     enable_git_status = true,
  --     enable_diagnostics = true,
  --     open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
  --     sort_case_insensitive = false,
  --     default_component_configs = {
  --       container = { enable_character_fade = true },
  --       indent = {
  --         indent_size = 2,
  --         padding = 1,
  --         with_markers = true,
  --         indent_marker = "│",
  --         last_indent_marker = "└",
  --         highlight = "NeoTreeIndentMarker",
  --         with_expanders = nil,
  --         expander_collapsed = "",
  --         expander_expanded = "",
  --         expander_highlight = "NeoTreeExpander",
  --       },
  --       icon = {
  --         folder_closed = "",
  --         folder_open = "",
  --         folder_empty = "󰜌",
  --         provider = function(icon, node, state)
  --           if node.type == "file" or node.type == "terminal" then
  --             local success, web_devicons = pcall(require, "nvim-web-devicons")
  --             local name = node.type == "terminal" and "terminal" or node.name
  --             if success then
  --               local devicon, hl = web_devicons.get_icon(name)
  --               icon.text = devicon or icon.text
  --               icon.highlight = hl or icon.highlight
  --             end
  --           end
  --         end,
  --         default = "*",
  --         highlight = "NeoTreeFileIcon",
  --       },
  --       modified = { symbol = "[+]", highlight = "NeoTreeModified" },
  --       name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
  --       git_status = {
  --         symbols = {
  --           added = "",
  --           modified = "",
  --           deleted = "✖",
  --           renamed = "󰁕",
  --           untracked = "",
  --           ignored = "",
  --           unstaged = "󰄱",
  --           staged = "",
  --           conflict = "",
  --         },
  --       },
  --     },
  --     window = {
  --       position = "float",
  --       width = 30,
  --       border = "rounded",
  --       mappings = {
  --         ["<space>"] = { "toggle_node", nowait = false },
  --         ["<cr>"] = "open",
  --         ["<esc>"] = "cancel",
  --         ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
  --         ["l"] = "focus_preview",
  --         ["S"] = "open_split",
  --         ["s"] = "open_vsplit",
  --         ["t"] = "open_tabnew",
  --         ["w"] = "open_with_window_picker",
  --         ["C"] = "close_node",
  --         ["z"] = "close_all_nodes",
  --         ["a"] = { "add", config = { show_path = "none" } },
  --         ["A"] = "add_directory",
  --         ["d"] = "delete",
  --         ["r"] = "rename",
  --         ["y"] = "copy_to_clipboard",
  --         ["x"] = "cut_to_clipboard",
  --         ["p"] = "paste_from_clipboard",
  --         ["c"] = "copy",
  --         ["m"] = "move",
  --         ["q"] = "close_window",
  --         ["R"] = "refresh",
  --         ["?"] = "show_help",
  --         ["<"] = "prev_source",
  --         [">"] = "next_source",
  --         ["i"] = "show_file_details",
  --       },
  --     },
  --     filesystem = {
  --       filtered_items = {
  --         visible = true,
  --         hide_dotfiles = false,
  --         hide_gitignored = false,
  --         hide_hidden = false,
  --       },
  --       follow_current_file = { enabled = false },
  --       group_empty_dirs = false,
  --       hijack_netrw_behavior = "open_default",
  --       use_libuv_file_watcher = false,
  --     },
  --     source_selector = {
  --       winbar = false,
  --       statusline = false
  --     },
  --
  --
  --     popup_border_style = "rounded",
  --   })
  -- end
}
