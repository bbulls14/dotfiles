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

-- Explicitly set the '.toml', '.ipynb', '.qmd' icons with updated color and icon
devicons.set_icon {
  toml = {
    icon = "🅣", -- Stylized text search icon
    color = "#9c4221", -- Match color from the image
    cterm_color = "124", -- Terminal color from the image
    name = "Toml", -- Name for the icon
  },
  --fix the color
    ipynb = {
    icon = "🗠", -- Stylized text search icon
    color = "#FFA500", -- Match color from the image
    cterm = "124",
    name = "Ipynb", -- Name for the icon
  },
    qmd = {
    icon = "🦦",
    name = "qmd",
  },
}

-- correct colors for line numbers to match colorscheme and have proper contrast for visibility
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#a7a5a4" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#a7a5a4" })






