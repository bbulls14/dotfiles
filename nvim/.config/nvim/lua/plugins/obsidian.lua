return {

	{
  		"epwalsh/obsidian.nvim",
  		requires = {
  		    	"nvim-lua/plenary.nvim",
    			"hrsh7th/nvim-cmp",
    			"nvim-telescope/telescope.nvim",
    			"nvim-treesitte",
    		},
    		config = function()
    			require("obsidian").setup({	
  				version = "*",  -- recommended, use latest release instead of latest commit
  				lazy = true,
  				ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  
				 
				    workspaces = {
				      {
					name = "BullsWIP",
					path = "~/Documents/BullsWIP",
				      },
				    },
				    notes_subdir = "inbox",
				    new_notes_location = "notes_subdir",
				    

				    completion = {
				      -- set to False to disable completion
				      nvim_cmp = true,
				      -- trigger completion at 2 chars
				      min_chars = 2,
				    },

				    mappings = {
				      ["gf"] = {
					action = function()
					  return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },

				      },

				      --toggle check-boxes
				      ["<leader>ch"] = {
					action = function ()
					  return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				      },
				      -- Smart action depending on context, either follow link
				      ["<cr>"] = {
					action = function()
					  return require("obsidian").util.smart_section()
					end,
					opts = { buffer = true, expr = true },
				      }
				    },

    -- see below for full list of options 👇
  			
  			})
  		end,
  		
		}
	}
