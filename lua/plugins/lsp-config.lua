return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          --   "csharp_ls",
          "omnisharp",
          "clangd",
          "cssls",
          "ts_ls",
          "pylsp",
          "tailwindcss",
        },
      })

    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- LSP configurations
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.omnisharp.setup({
        cmd = { "/usr/local/bin/omnisharp/OmniSharp" },
        capabilities = capabilities,
        --	root_dir = lspconfig.util.root_pattern(".csproj", ".sln"),
      })
      --[[lspconfig.csharp_ls.setup({
        capabilities = capabilities,
      })--]]
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        init_options = {
          configurationSection = { "html", "css", "javascript","javascriptreact","typescript","typescriptreact"},
          embeddedLanguages = { css = true, javascript = true},
        },
      })

      -- Key mappings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- Key mappings for diagnostics
      vim.api.nvim_set_keymap(
        "n",
        "<leader>e",
        '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "[d",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "]d",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>q",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        { noremap = true, silent = true }
      )
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>h",
        "<cmd>lua vim.lsp.buf.hover()<CR>",
        { noremap = true, silent = true }
      )

      -- Configure diagnostics
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true, -- Disable inline virtual text
            signs = true, -- Enable signs in the sign column
            update_in_insert = false,
            underline = true,
            severity_sort = true,
          })
    end,
  },
}
