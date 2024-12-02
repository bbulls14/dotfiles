return {


	--github.com/nvim-tree/nvim-tree.lua
	{
		"git@github.com:nvim-tree/nvim-tree.lua.git",
		requires = {
			"nvim-tree/nvim-web-devicons", -- Optional for file icons
		},
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_netrw = true,
				-- Set key mappings directly under 'on_attach' instead of 'view.mappings'
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					-- Define key mappings for nvim-tree
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- Key mappings for nvim-tree
					vim.keymap.set("n", "l", api.node.open.edit, opts("Edit"))
					vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Edit"))
					vim.keymap.set("n", "o", api.node.open.edit, opts("Edit"))
					vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Node"))
					vim.keymap.set("n", "v", api.node.open.vertical, opts("Vertical Split"))


				end,

				view = {
					width = 20,
				        adaptive_size = true,
					side = "left"
				},
				renderer = {
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							folder = {
								arrow_open = "<",
								arrow_closed = ">",
							},
						},
					},
				},
			})


		end,
	},



}
