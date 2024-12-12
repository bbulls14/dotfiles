return {
	--github.com/nvim-tree/nvim-web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				-- Globally enable default icons (set to false to disable)
				  override_by_filename = {
				    [".toml"] = {
				      icon = "", -- "T in a box" icon
				      color = "#9c4221",
				      cterm_color = "124", -- Hex color matching the red
				      name = "Toml" -- Name for the icon
				    },
				  },
				  default = true,
			})
		end,
	},



}
