return {
	-- Comment.nvim plugin for easy commenting
	-- github.com/numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	
	-- disable hungry features for files larger than 2MB
	{ 'LunarVim/bigfile.nvim' },
	
	  { -- generate docstrings
	    'danymat/neogen',
	    cmd = { 'Neogen' },
	    dependencies = 'nvim-treesitter/nvim-treesitter',
	    config = true,
	  },
	
	{ -- format things as tables
    	'godlygeek/tabular',
  	},


	-- Automatic indentation detection
	-- github.com/NMAC427/guess-indent.nvim
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup()
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
