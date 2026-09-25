return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Define the markdown_oxide configuration
			vim.lsp.config("markdown_oxide", {
				opts = { noremap = true },
				settings = {
					-- Example: obsidian-like workspace settings
					workspace = {
						didChangeWatchedFiles = { dynamicRegistration = true },
					},
				},
			})

			-- Enable the configuration for its filetypes
			vim.lsp.enable("markdown_oxide")
		end,
	},
}
