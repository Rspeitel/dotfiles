return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"olimorris/neotest-rspec",
    -- "rouge8/neotest-rust",
    --"nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        -- Rspec Config
        -- require("neotest-rspec")
        --        dap_adapter = "lldb",I
        -- Rust Config
        -- require("neotest-rust") {
        --   args = { "--no-capture" },
        --   dap_adapter = "lldb",
        -- }
        -- JEST config
        -- require('neotest-jest')({
        -- jestCommand = "npm test --",
        -- jestConfigFile = "custom.jest.config.ts",
        -- env = { CI = true },
        -- cwd = function(path)
        --   return vim.fn.getcwd()
        -- end,
      },
    })
  end
}
