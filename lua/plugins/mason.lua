return
  {
    {
      "rcarriga/nvim-dap-ui",
      event = 'VeryLazy',
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized['dapui_config'] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
          dapui.open()
        end
      end
    },
    {
      'jay-babu/mason-nvim-dap.nvim',
      event = 'VeryLazy',
      dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
      },
      opts = {
        handlers = {},
        ensure_installed = {
          "codelldb"
        }
      }
    },
    {
      "mfussenegger/nvim-dap",
      event = 'VeryLazy',
      config = function()
        --require("core.utils").load_mappings({})
      end
    },
    {
      "williamboman/mason.nvim",
      event = 'VeryLazy',
      config = function()
	require("mason").setup({
	  ui = {
	    icons = {
	      package_installed = "✓",
	      package_pending = "➜",
	      package_uninstalled = "✗"
	    }
	  }
	})
      end,
      opts = {
	ensure_installed = {
	  "clangd",
	  "clang-format",
	  "codelldb",
	  "asm_lsp",
	  "marksman",
	  "jedi-language-server"
	}
      }
    },
    {
      'williamboman/mason-lspconfig.nvim',
      event = 'VeryLazy',
      dependecies = {
	"neovim/nvim-lspconfig"
      },
      config = function()
	require("mason-lspconfig").setup()
      end
    }
  }

