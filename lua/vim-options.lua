vim.wo.number = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
-- Example for init.lua
vim.opt.termguicolors = true
vim.g.VM_maps = {
    ["Find Under"] = "<C-m>",  -- Remap multi-cursor selection to Ctrl + m
    ["Find Subword Under"] = "<C-m>",  -- Remap subword selection
}
