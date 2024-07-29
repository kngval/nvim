return {
  {  
  "williamboman/mason.nvim",
      config = function()

      require("mason").setup()
    end

  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "csharp_ls",
          "clangd",
          "cssls",
          "tsserver",
          "pylsp",
          "tailwindcss"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.csharp_ls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.cssls.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.pylsp.setup({})
    lspconfig.tailwindcss.setup({})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
    vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action,{})
    end
  }
}

