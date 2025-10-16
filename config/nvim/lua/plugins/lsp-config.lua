return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			-- local lsp = vim.lsp.config
			local servers = {
				solargraph = { capabilities = capabilities },
				html = { capabilities = capabilities },
				lua_ls = { capabilities = capabilities },
				yamlls = {},
				robotframework_ls = {
					cmd = {
						"/home/shawn/.local/share/nvim/mason/packages/robotframework-lsp/venv/bin/robotframework_ls",
					},
				},
				perlnavigator = {},
				bashls = {},
				pylsp = {},
				bicep = {
					cmd = { "/home/shawn/.local/bin/bicep-lsp" },
				},
				jsonls = { capabilities = capabilities },
				powershell_es = { capabilities = capabilities },
			}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
		end,
	},
}
