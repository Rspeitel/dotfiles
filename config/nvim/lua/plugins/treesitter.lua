return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'lua', 'javascript', 'vimdoc', 'vim', 'rust', 'python', 'ruby' },

    indent = { enable = true, disable = { 'python' } },
    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = { "markdown" },
    }
  }
}

