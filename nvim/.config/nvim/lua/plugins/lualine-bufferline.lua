return {

	--github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons", -- Optional dependency for icons
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "none", -- Set "buffer_id" or "both" for different tab numbers
					close_command = "bdelete! %d", -- Command to delete a buffer
					right_mouse_command = "bdelete! %d", -- Right-click buffer delete
					left_mouse_command = "buffer %d", -- Click to go to buffer
					middle_mouse_command = nil, -- Disable middle-click
				},
			})
		end,
	},

	--github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional icons
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true, -- Enable icons
					theme = "auto", -- Automatically select a theme based on your colorscheme
					component_separators = { left = "", right = "" }, -- Adjust separators
					section_separators = { left = "", right = "" }, -- Customize section separators
					disabled_filetypes = {}, -- Filetypes where Lualine will be disabled
				},
				sections = {
					lualine_a = { "mode" }, -- Displays current mode (e.g., NORMAL, INSERT)
					lualine_b = {"filename" }, -- Git branch
					lualine_c = {"branch" }, -- File name in the middle
					lualine_x = { }, -- File encoding and type
					lualine_y = { "progress" }, -- Progress in the file (e.g., line number/percentage)
					lualine_z = { "location" }, -- Current cursor position
				},
				inactive_sections = { -- Sections for inactive windows
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {}, -- Leave this empty if you're using bufferline
				extensions = { "nvim-tree" }, -- Optional extensions (e.g., for nvim-tree)
			})
		end,
	},

}
