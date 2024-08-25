return {
  { "elkowar/yuck.vim" },
  { "ellisonleao/gruvbox.nvim" },

  {
    'nvim-lualine/lualine.nvim',
    -- Icons on files
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      icons_enabled = true,
      theme = 'gruvbox',
      section_seperators = '',
    }
  }
}
