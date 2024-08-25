return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"olimorris/neotest-rspec",
    --"nvim-neotest/neotest-jest",
  },
  keys  = {
    { "<leader>x", "" , desc = "+testing", mode = "n"},
    { "<leader>xwf", function() require("neotest").watch.watch(vim.fn.expand("%")) end , desc = "", mode = "n"},
    { "<leader>xwu", function() require("neotest").watch.watch() end , desc = "", mode = "n"},
    { "<leader>xf", function() require("neotest").run.run(vim.fn.expand("%")) end , desc = "", mode = "n"},
    { "<leader>xu", function() require("neotest").run.run() end , desc = "", mode = "n"},
    { "<leader>xt", function() require("neotest").summary.toggle() end , desc = "", mode = "n"},
    { "<leader>xo", function() require("neotest").output.open({ enter = true }) end , desc = "", mode = "n"},
  },
  config = function()
    require("neotest").setup({
      adapters = {
        -- Rspec Config
        -- require("neotest-rspec")
        --        dap_adapter = "lldb",I
        -- Rust Config
        require('rustaceanvim.neotest')
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
