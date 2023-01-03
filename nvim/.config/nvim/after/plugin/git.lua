require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts, desc)
      opts = opts or {}
      opts.buffer = bufnr
      if desc then
          opts.desc = desc
      end
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    local builtin = require('telescope.builtin')
    -- Actions
    map({'n', 'v'}, '<leader>gha', ':Gitsigns stage_hunk<CR>',{}, 'Stage Hunk')
    map({'n', 'v'}, '<leader>ghr', ':Gitsigns reset_hunk<CR>',{}, 'Reset Hunk')
    map('n', '<leader>ghp', gs.preview_hunk,{}, 'Preview Hunk')
    map({'o', 'x'}, 'ghs', ':<C-U>Gitsigns select_hunk<CR>', {})

    map('n', '<leader>ga', gs.stage_buffer,{}, 'Stage')
    map('n', '<leader>gA', gs.undo_stage_hunk,{}, 'Undo Stage')
    map('n', '<leader>gR', gs.reset_buffer,{}, 'Reset Buffer')
    map('n', '<leader>gb', function() gs.blame_line{full=true} end,{}, 'Blame')
    map('n', '<leader>gB', gs.toggle_current_line_blame,{}, 'Blame Line')
    map('n', '<leader>gd', gs.diffthis,{}, 'Diff This')
    map('n', '<leader>gD', function() gs.diffthis('~') end,{}, 'Diff')
    map('n', '<leader>gT', gs.toggle_deleted,{}, 'Toggle Deleted')

    map('n', '<leader>gC', builtin.git_commits, {desc="Commits"})
    map('n', '<leader>gc', builtin.git_bcommits, {desc="Buffer Commits"})
    map('n', '<leader>gb', builtin.git_branches, {desc="Branches"})
    map('n', '<leader>gs', builtin.git_status, {desc="Status"})
    map('n', '<leader>gS', builtin.git_stash, {desc="Stash"})
    -- Text object
  end
}
