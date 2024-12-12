-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("options")


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },

  -- automatically check for plugin updates
  checker = { enabled = true },
})


local devicons = require("nvim-web-devicons")

-- Explicitly set the `.toml` icon with updated color and icon
devicons.set_icon {
  toml = {
    icon = "🅣", -- Stylized text search icon
    color = "#9c4221", -- Match color from the image
    cterm_color = "124", -- Terminal color from the image
    name = "Toml", -- Name for the icon
  },
  --fix the color
    ipynb = {
    icon = "🌐", -- Stylized text search icon
    color = "#FFA500", -- Match color from the image
    cterm = "124",
    name = "Ipynb", -- Name for the icon
  }
}

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--auto-session
--vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- correct colors for line numbers to match colorscheme and have proper contrast for visibility
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#a7a5a4" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#a7a5a4" })


-- Add these mappings for bufferline tab navigation
-- Go to specific buffer by number
vim.api.nvim_set_keymap('n', 'g1', ":lua require('bufferline').go_to_buffer(1, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g2', ":lua require('bufferline').go_to_buffer(2, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g3', ":lua require('bufferline').go_to_buffer(3, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g4', ":lua require('bufferline').go_to_buffer(4, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g5', ":lua require('bufferline').go_to_buffer(5, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g6', ":lua require('bufferline').go_to_buffer(6, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g7', ":lua require('bufferline').go_to_buffer(7, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g8', ":lua require('bufferline').go_to_buffer(8, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g9', ":lua require('bufferline').go_to_buffer(9, true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', ":lua require('bufferline').go_to_buffer(10, true)<CR>", { noremap = true, silent = true })

-- Close buffer with Shift + Ctrl + Q
--vim.api.nvim_set_keymap('n', '<C-Q>', ":lua require('bufdelete').bufdelete(0, true)<CR>", { noremap = true, silent = true })

-- Cycle through buffers
--vim.api.nvim_set_keymap('n', '<M-j>', ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<M-k>', ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Move buffer positions
--vim.api.nvim_set_keymap('n', '<M-J>', ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<M-K>', ":BufferLineMoveNext<CR>", { noremap = true, silent = true })

-- Toggle nvim-tree with <leader>e
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


vim.g.python3_host_prog = '~/.config/nvim/python3_venv/bin/python'


