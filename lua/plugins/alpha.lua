return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      '                                                                   ',
      '      ████ ██████           █████      ██                    ',
      '     ███████████             █████                            ',
      '     █████████ ███████████████████ ███   ███████████  ',
      '    █████████  ███    █████████████ █████ ██████████████  ',
      '   █████████ ██████████ █████████ █████ █████ ████ █████  ',
      ' ███████████ ███    ███ █████████ █████ █████ ████ █████ ',
      '██████  █████████████████████ ████ █████ █████ ████ ██████',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('Ldr s f', '  > Find file'),
      dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('Ldr s h', '  > Search Help'),
      dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]
  end,
}
