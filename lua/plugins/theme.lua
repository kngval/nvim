return {
'dasupradyumna/midnight.nvim',
  lazy = false,
  priority = 1000,
  config = function ()
    require('midnight').setup {
    HighlightGroup = {
        fg = ForegroundColor, -- :h guifg
        bg = BackgroundColor, -- :h guibg
        sp = SpecialColor, -- :h guisp
        style = RenderStyle, -- :h attr-list
        -- OR
        link = TargetHiglightGroup, -- :h :hi-link (link to "TargetHiglightGroup")
        -- OR
        clear = true -- :h :hi-clear (clear "HighlightGroup"; `false` ignores this option)
    },
}
    vim.cmd("colorscheme midnight")
  end

  -- lua/plugins/rose-pine.lua
-- 	"rose-pine/neovim", 
-- 	name = "rose-pine",
-- 	config = function()
--
-- 		require("rose-pine").setup({
--     variant = "main", -- auto, main, moon, or dawn
--     dark_variant = "main", -- main, moon, or dawn
--     dim_inactive_windows = true,
--     extend_background_behind_borders = true,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = false,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--     },
--
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })
--
-- vim.cmd("colorscheme rose-pine")
--   end
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")	end

        -- "sainnhe/gruvbox-material",
        -- lazy = false,
        -- priority = 1000,
        -- config = function ()
        --  vim.cmd("colorscheme gruvbox-material") 
        -- end

  -- "folke/tokyonight.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- opts = {},
  -- config = function ()
  --  vim.cmd[[colorscheme tokyonight-night]] 
  -- end
  
  
  -- "catppuccin/nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  -- 	require("catppuccin").setup({
  -- 		flavour = "mocha", -- latte, frappe, macchiato, mocha
  -- 		background = { -- :h background
  -- 			light = "latte",
  -- 			dark = "mocha",
  -- 		},
  --      transparent_background = false,
  -- 		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  -- 		term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  -- 		dim_inactive = {
  -- 			enabled = false, -- dims the background color of inactive window
  -- 			shade = "dark", percentage = 0.15, -- percentage of the shade to apply to the inactive window
  -- 		},
  -- 		no_italic = false, -- Force no italic
  -- 		no_bold = false, -- Force no bold
  -- 		no_underline = false, -- Force no underline
  -- 		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  -- 			comments = { "italic" }, -- Change the style of comments
  -- 			conditionals = { "italic" },
  -- 			loops = {"italic"},
  -- 			functions = {"italic"},
  -- 			keywords = {"italic"},
  -- 			strings = {},
  -- 			variables = {},
  -- 			numbers = {},
  -- 			booleans = {},
  -- 			properties = {},
  -- 			types = {},
  -- 			operators = {},
  -- 			-- miscs = {}, -- Uncomment to turn off hard-coded styles
  -- 		},
  -- 		color_overrides = {},
  -- 		custom_highlights = {},
  -- 		default_integrations = true,
  -- 		integrations = {
  -- 			cmp = true,
  -- 			gitsigns = true,
  -- 			nvimtree = true,
  -- 			treesitter = true,
  -- 			notify = false,
  -- 			mini = {
  -- 				enabled = true,
  -- 				indentscope_color = "",
  -- 			},
  -- 			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  -- 		},
  -- 	})
  -- 	vim.cmd.colorscheme("catppuccin")
  -- end,

  --   "shaunsingh/nord.nvim",
  --   config = function()
  --   vim.cmd.colorscheme("nord")
  -- end

--   "rebelot/kanagawa.nvim",
--    config = function()
--       -- Default options:
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = true,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")
--       vim.cmd([[
--   highlight clear LineNr
--   highlight clear CursorLineNr
-- ]])
--
--   end

  -- "oxfist/night-owl.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     require("night-owl").setup({
  --     bold = true,
  --     italics = true,
  --     underline = true,
  --     undercurl = true,
  --     transparent_background = false,
  --     })
  --     vim.cmd.colorscheme("night-owl")
  --   end,
}
