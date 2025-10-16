return {
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		opts = { -- you can just pass {}, defaults below
			-- Disable automatic rendering on buffer render
			events = {
				render_buffer = {},
				clear_buffer = { "BufLeave" },
			},
			keys = {
				{
					"K", -- or any key you prefer
					function()
						require("diagram").show_diagram_hover()
					end,
					mode = "n",
					ft = { "markdown", "norg" }, -- Only in these filetypes
					desc = "Show diagram in new tab",
				},
			},
			renderer_options = {
				mermaid = {
					background = "transparent", -- nil | "transparent" | "white" | "#hex"
					theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
					scale = 2, -- nil | 1 (default) | 2  | 3 | ...
					width = nil, -- nil | 800 | 400 | ...
					height = nil, -- nil | 600 | 300 | ...
				},
				plantuml = {
					charset = nil,
				},
				d2 = {
					theme_id = nil,
					dark_theme_id = nil,
					scale = nil,
					layout = nil,
					sketch = nil,
				},
				gnuplot = {
					size = nil, -- nil | "800,600" | ...
					font = nil, -- nil | "Arial,12" | ...
					theme = nil, -- nil | "light" | "dark" | custom theme string
				},
			},
		},
		config = function()
			require("diagram").setup({})
		end,
	},
}
