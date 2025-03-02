local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.fileformats = "unix"
vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true, silent = true })
-- vim.g.clipboard = {
--   name = "clip.exe",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = "powershell.exe -NoProfile -Command [Console]::Out.Write($(Get-Clipboard -Raw))",
--     ["*"] = "powershell.exe -NoProfile -Command [Console]::Out.Write($(Get-Clipboard -Raw))",
--   },
--   cache_enabled = 0,
-- }

-- Function to remove all ^M characters (carriage returns)
-- Function to remove carriage returns (^M) from the current buffer
local function remove_carriage_returns()
  vim.api.nvim_exec([[
    %s/\r//g
  ]], false)
end

-- Map ,m to call the function
vim.keymap.set('n', ',m', remove_carriage_returns, { desc = "Remove all ^M (carriage returns)" })



vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local opts = {}
vim.opt.termguicolors = true
require("vim-options")
require("lazy").setup("plugins")
