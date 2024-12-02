return {
	-- Nordic colorscheme plugin
	-- github.com/AlexvZyl/nordic.nvim
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				transparent = {
					bg = true,
					float = true,
				},
				reduced_blue = true,
				italic_comments = true,
			})
			require("nordic").load()
		end,
	},
}
