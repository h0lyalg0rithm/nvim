--vim.g.coq_settings = { auto_start = true, xdg = true }

return
  {
    {
      "folke/neodev.nvim",
      opts = {},
      dependencies = {
	'hrsh7th/nvim-cmp'
      },
      enabled = false,
      config = function()
	require('neodev').setup({})
      end
    },
    {
      'neovim/nvim-lspconfig',
      event = 'VeryLazy',
      config = function()
	local lspconfig = require('lspconfig')
	lspconfig.lua_ls.setup({})
	lspconfig.marksman.setup({})
	lspconfig.asm_lsp.setup({})
	vim.api.nvim_create_autocmd('LspAttach', {
	  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	  callback = function(ev)
	    -- Enable completion triggered by <c-x><c-o>
	    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	    -- Buffer local mappings.
	    -- See `:help vim.lsp.*` for documentation on any of the below functions
	    local opts = { buffer = ev.buf }
	    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	    vim.keymap.set('i', '<Tab>', vim.lsp.buf.signature_help, opts)
	    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	    vim.keymap.set('n', '<space>wl', function()
	      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	      end, opts)
	    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
	    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	    vim.keymap.set('n', '<space>f', function()
	      vim.lsp.buf.format { async = true }
	      end, opts)
	  end,
	})

	--vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
	--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	--vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
	--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	--vim.opt.foldmethod = "expr"
	--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      end
    },
    {
      'ms-jpq/coq_nvim',
      branch = 'coq',
      dependencies  = {
	{
	  "ms-jpq/coq.artifacts",
	  branch = "artifacts",
	},
      },
      config =  function()
	local lspconfig = require('lspconfig')
	local coq = require('coq')
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.foldingRange = {
	  dynamicRegistration = false,
	  lineFoldingOnly = true
	}
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local opts = { capabilities = capabilities }
	lspconfig.clangd.setup(coq.lsp_ensure_capabilities(opts));
	vim.cmd("LspStart")
        vim.cmd("COQnow -s")
      end
    }
  }
