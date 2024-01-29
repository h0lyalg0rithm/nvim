return 
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 150
    end,
    opts = {},
    config = function ()
      local wk = require("which-key")
      wk.register({
	t = { "<cmd>ToggleTerm<cr>", "Open Terminal" },
	f = {
	  name = "file", -- optional group name
	  t = { "<cmd>Neotree toggle<cr>", "NeoTree Toggle" },
	  f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
	  g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
	  h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
	  n = { "New File" }, -- just a label. don't create any mapping
	  e = "Edit File", -- same as above
	  ["1"] = "which_key_ignore",  -- special label to hide it in the popup
	},
	m = { function() require('treesj').toggle() end, "Toggle block" },
	j = { "<cmd>Telescope jumplist<cr>", "Jump list"},
	d = {
	 b = { "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line" },
	 r = { "<cmd>DapContinue<cr>", "Start or Continue the debugger" }
	},
	b = { "<cmd>set nu!<cr>", "Toggle line number" }
      }, { prefix = "<leader>" })
      wk.register({
	["<leader>gd"] = { vim.lsp.buf.definition, "Goto Definition" },
	["<leader>gD"] = { vim.lsp.buf.declaration, "Goto Decalaration" },
      })
    end,
  }
