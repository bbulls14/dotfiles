return {
	--github.com/nvim-tree/nvim-web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			--empty table, icons configured in init.lua
			require("nvim-web-devicons").setup({
				-- Globally enable default icons (set to false to disable)
				  --override_by_filename = {
				  
				    --[".toml"] = {
					--    icon = "🅣", -- Stylized text search icon
					--    color = "#9c4221", -- Match color from the image
					--    cterm_color = "124", -- Terminal color from the image
					--    name = "Toml", -- Name for the icon
					--  },
					  --fix the color
				    --[".ipynb"] = {
					--    icon = "🌐", -- Stylized text search icon
					--    color = "#FFA500", -- Match color from the image
					--    cterm = "124",
					--    name = "Ipynb", -- Name for the icon
					--  },

				  --},
				  --default = true,
			})
		end,
	},



}
