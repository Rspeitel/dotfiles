return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        extensions = {
          bibtex = {
            -- Use context awareness
            depth = 2,
            context = true,
            -- Use non-contextual behavior if no context found
            -- This setting has no effect if context = false
            context_fallback = true,
          },
        }
      })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>?', builtin.oldfiles,  {})
      -- vim.keymap.set('n', '<leader>b', builtin.buffers,   {})
      vim.keymap.set('n', '<leader>t', builtin.git_files, {})
      vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
    end
  },

  { "nvim-telescope/telescope-bibtex.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim' },
    -- ft = ".tex",
    config = function()
      require('telescope').load_extension('bibtex')
    end
  },
}
