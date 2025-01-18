return {

	{
		"williamboman/mason.nvim",
		lazy = false,

		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},


		-- github.com/neovim/nvim-lspconfig
	{
	  "neovim/nvim-lspconfig",
	  lazy = false,
	  config = function()
	    local capabilities = require("cmp_nvim_lsp").default_capabilities()
	    local lspconfig = require("lspconfig")

	    -- Create a table to store LSP server configurations
	    local servers = {
	      -- Python with Ruff and Pyright
	      {
		name = "ruff",
		config = {
		  init_options = {
		    settings = {
		      -- Ruff language server settings
		      vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
		      callback = function(args)
		        local client = vim.lsp.get_client_by_id(args.data.client_id)
		        if client == nil then
		          return
		        end
		        if client.name == 'ruff' then
		          -- Disable hover in favor of Pyright
		          client.server_capabilities.hoverProvider = false
		        end
		      end,
		      desc = 'LSP: Disable hover capability from Ruff',
		    },
		  },
		},
	      },
	      {
		name = "pyright",
		config = {
		  settings = {
		    pyright = {
		      -- Pyright language server settings
		      -- Using Ruff's import organizer
		      disableOrganizeImports = true,
		    },
		    python = {
		      analysis = {
		        -- Ignore all files for analysis to exclusively use Ruff for linting
		        ignore = { "*" },
		      },
		    },
		  },
		},
	      },
	      {
		name = "lua_ls",
		config = {
		  settings = {},
		},
	      },
	    }

	    -- Set up each LSP server
	    for _, server in ipairs(servers) do
	      lspconfig[server.name].setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
		  -- Set up keybindings
		  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
		  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
		  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
		end,
		config = server.config,
	      })
	    end
	  end,
	},

	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	}
}
