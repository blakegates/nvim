return {
  config = function()
    local state = { floating = { buf = -1, win = -1 } }

    -- Create the floating window
    local function create_floating_window(opts)
      opts = opts or {}
      local width = opts.width or math.floor(vim.o.columns * 0.8)
      local height = opts.height or math.floor(vim.o.lines * 0.8)
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)

      local buf = vim.api.nvim_buf_is_valid(state.floating.buf) and state.floating.buf or
      vim.api.nvim_create_buf(false, true)

      local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
      }

      local win = vim.api.nvim_open_win(buf, true, win_config)
      return { buf = buf, win = win }
    end

    -- Toggle the terminal
    local function toggle_terminal()
      if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window()
        if vim.bo[state.floating.buf].buftype ~= 'terminal' then
          vim.cmd 'terminal' -- Open terminal
        end
        vim.defer_fn(function()
          if vim.b.terminal_job_id then
            vim.fn.chansend(vim.b.terminal_job_id, 'fish\n') -- Send fish command - also loads fastfetch
          end
        end, 50)
        vim.cmd 'startinsert' -- Automatically enter insert mode
      else
        vim.api.nvim_win_hide(state.floating.win)
      end
    end

    -- Set key mappings and commands
    vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Escape terminal mode' })
    vim.api.nvim_create_user_command('Floaterminal', toggle_terminal, {})
  end,
}
