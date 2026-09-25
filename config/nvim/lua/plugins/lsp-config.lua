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
			ensure_installed = {
				"ansiblels",
				"bashls",
				"bicep",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"powershell_es",
				"pylsp",
				"ts_ls",
				"yamlls",
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {}),
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" }),
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto references" }),
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" }),
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" }),
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in loclist" }),

		opts = {
			servers = {
				robotframework_ls = {
					settings = {
						robot = {
							pythonpath = "/home/shawn/work/ito/ito-syn-robot-framework/.venv/bin/python",
						},
					},
				},
			},
		},
	},
}
