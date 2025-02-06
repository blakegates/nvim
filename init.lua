-- [[ load leader key ]]
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ load nerd font ]]
vim.g.have_nerd_font = true

-- [[ load options ]]
require 'options'

-- [[ load keymaps ]]
require 'keymaps'

-- [[ load lazy.nvim plugin manager ]]
require 'lazy-bootstrap'

-- [[ load installed plugins through lazy.nvim ]]
require 'lazy-plugins'

-- [[ load custom plugins ]]
require('kickstart.plugins.floaterminal').config()

-- See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
