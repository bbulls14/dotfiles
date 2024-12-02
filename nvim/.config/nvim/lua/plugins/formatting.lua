return {
	-- Comment.nvim plugin for easy commenting
	-- github.com/numToStr/Comment.nvim
	{
		"git@github.com:numToStr/Comment.nvim.git",
		config = function()
			require("Comment").setup()
		end,
	},

	-- LSP signature plugin (function signatures when typing)
	-- github.com/ray-x/lsp_signature.nvim
	{
		"git@github.com:ray-x/lsp_signature.nvim.git",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- Automatic indentation detection
	-- github.com/NMAC427/guess-indent.nvim
	{
		"git@github.com:NMAC427/guess-indent.nvim.git",
		config = function()
			require("guess-indent").setup()
		end,
	},

	-- Auto pair brackets and quotes
	-- github.com/windwp/nvim-autopairs
	{
		"git@github.com:windwp/nvim-autopairs.git",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- github.com/Pocco81/auto-save.nvim
	{
		"git@github.com:pocco81/auto-save.nvim.git",
		config = function()
			require("auto-save").setup()
		end,
	},

}
