return {
	-- Comment.nvim plugin for easy commenting
	-- github.com/numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- LSP signature plugin (function signatures when typing)
	-- github.com/ray-x/lsp_signature.nvim
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- Automatic indentation detection
	-- github.com/NMAC427/guess-indent.nvim
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup()
		end,
	},

	-- Auto pair brackets and quotes
	-- github.com/windwp/nvim-autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- github.com/Pocco81/auto-save.nvim
	{
		"pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup()
		end,
	},

}
