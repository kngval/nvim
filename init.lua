vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

}
local opts = {}
require("lazy").setup(plugins,opts)

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

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed={"lua","javascript"},
  highlight = { enable = true},
  indent = { enable = true}
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
