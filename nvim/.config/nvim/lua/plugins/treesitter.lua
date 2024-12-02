return {
	-- github.com/nvim-treesitter/nvim-treesitter
	{
		"git@github.com:nvim-treesitter/nvim-treesitter.git",
		run = "TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- Sets jumps in the jumplist for better navigation
						goto_next_start = {
							["]m"] = "@function.outer",
							["gj"] = "@function.outer",
							["]]"] = "@class.outer",
							["]b"] = "@block.outer",
							["]a"] = "@parameter.inner",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["gJ"] = "@function.outer",
							["]["] = "@class.outer",
							["]B"] = "@block.outer",
							["]A"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["gk"] = "@function.outer",
							["[["] = "@class.outer",
							["[b"] = "@block.outer",
							["[a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["gK"] = "@function.outer",
							["[]"] = "@class.outer",
							["[B"] = "@block.outer",
							["[A"] = "@parameter.inner",
						},
					},
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to text objects
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["a/"] = "@comment.outer",
							["i/"] = "@comment.outer", -- No inner for comments
							["aa"] = "@parameter.outer", -- Argument
							["ia"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
	
	{
	"nvim-treesitter/nvim-treesitter-textobjects",
	}
	
}
