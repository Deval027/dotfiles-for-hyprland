-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true


vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
require("lazy").setup({
	-- Add plugins here 
	
{
  'RRethy/vim-hexokinase',
  build = 'make hexokinase',
  config = function()
    vim.g.Hexokinase_highlighters = { 'virtual' }
  end
},
	

{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
},
{--file finder
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  config = function()
    require('telescope').setup{}
  end,
},
--file explore
{
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup()
  end,
},
--theme
{
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd[[colorscheme tokyonight]]
  end,
},

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup()
  end,
},

{--dashboard
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
       require('dashboard').setup {
  theme = 'hyper', -- or 'doom'
  config = {
    -- Disable the dynamic week header
    week_header = {
      enable = false,
    },

    -- Set a static header (ASCII art or text)
    header = {
      "",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
      "                 ",
      ""
    },

    -- (Optional) Shortcuts
    shortcut = {
      { desc = ' Find File', action = 'Telescope find_files', key = 'f' },
      { desc = ' File Explorer', action = 'NvimTreeToggle', key = 'e' },
    }
  }
}
  end,
}

})

