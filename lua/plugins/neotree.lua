return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set("n", "<C-n>", function()
      require("neo-tree.command").execute({
        action = "focus",
        source = "filesystem",
        reveal = true,
        position = "left",
        cwd = vim.fn.getcwd(), -- Set the current working directory as the root
      })
    end, { desc = "Open Neotree in Current Directory" })
    require("neo-tree").setup({
      sources = { "filesystem", "git_status" },
      window = {
        position = "left",
        width = 30,

        mappings = {
          ["R"] = "rename",
        },
      },
      filesystem = {
        follow_current_file = true,
        cwd = vim.fn.getcwd(), -- Set the current working directory as the root
      },
      git_status = {
        window = {
          position = "float",
          width = 30,
        },
      },
    })
  end,
}
