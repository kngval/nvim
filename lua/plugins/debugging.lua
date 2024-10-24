return {
  -- nvim-dap plugin
  'mfussenegger/nvim-dap',

  -- nvim-dap-ui plugin with dependencies
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- Ensure dependencies are correctly set
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dapui
      dapui.setup()
      -- CoreCLR Adapter configuration
      dap.adapters.coreclr = {
        type = 'executable',
        command = '/usr/bin/netcoredbg',
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            -- Prompt the user to manually enter the path to the DLL
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
          end,
        },
      }
      -- Node.js Adapter configuration
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { '/path/to/vscode-node-debug2/out/src/nodeDebug.js' }
      }

      -- Debugger configurations for Node.js (JS, TS)
      dap.configurations.javascript = {
        {
          name = "Launch Node.js",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          name = "Attach to process",
          type = "node2",
          request = "attach",
          processId = require 'dap.utils'.pick_process,
          cwd = vim.fn.getcwd(),
        },
      }

      dap.configurations.typescript = dap.configurations.javascript -- Use the same as JavaScript

      -- Chrome Adapter configuration (for React and browser-based debugging)
      dap.adapters.chrome = {
        type = "executable",
        command = "node",
        args = { "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" },
      }

      -- Debugger configurations for Chrome (JSX, TSX)
      dap.configurations.javascriptreact = {
        {
          name = "Launch Chrome",
          type = "chrome",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          runtimeExecutable = "/usr/bin/google-chrome-stable", -- Adjust for your system
          runtimeArgs = { "--remote-debugging-port=9222" },
          webRoot = "${workspaceFolder}",
        },
      }

      dap.configurations.typescriptreact = dap.configurations.javascriptreact -- Same for TypeScript React


      -- REPL configuration for DAP
      dap.configurations.dap_repl = {
        {
          name = "DAP REPL",
          type = "coreclr",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll for REPL: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
          end,
        }
      }

      -- Open DAP UI on debug start
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Close DAP UI on debug stop
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Key mappings for DAP
      vim.keymap.set('n', '<F5>', function() dap.continue() end)
      vim.keymap.set('n', '<F10>', function() dap.step_over() end)
      vim.keymap.set('n', '<F11>', function() dap.step_into() end)
      vim.keymap.set('n', '<F12>', function() dap.step_out() end)
      vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
      vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end) -- Open REPL
      vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

      -- Key mapping to hover (ensure hover is defined)
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        local widgets = require('dap.ui.widgets')
        if widgets and widgets.hover then
          widgets.hover()
        end
      end)

      -- Key mapping to close the debugger (terminate session and close UI)
      vim.keymap.set('n', '<Leader>dc', function()
        dap.terminate()
        dapui.close() -- Optional: Close DAP UI after terminating
      end, { noremap = true, silent = true })
    end,
  }
}
