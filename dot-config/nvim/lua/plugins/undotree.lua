return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        vim.g.undo_directory = "~/.local/share/nvim/undo"
    end
}
