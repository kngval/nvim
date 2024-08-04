return {
  
    "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true
    })
    vim.cmd.colorscheme "catppuccin"
  end
  

  --[["folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- can be 'night', 'storm', 'day'
      transparent = true, -- Enable transparency
    })

    vim.cmd("colorscheme tokyonight")
  end,
  ]]
}
