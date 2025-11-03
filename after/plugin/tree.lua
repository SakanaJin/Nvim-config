require('nvim-tree').setup({
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            }
        }
    }
})
local treeapi = require('nvim-tree.api')
vim.keymap.set("n", "<leader>e", treeapi.tree.toggle, {})
vim.keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>")
