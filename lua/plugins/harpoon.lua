return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = (function()
        local keymaps = {
            { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
            { "<leader>hg", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
            { "<leader>hj", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
            { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" }
        }
        -- Add navigation keymaps for files 1-9
        for i = 1, 9 do
            table.insert(keymaps, {
                string.format("<leader>h%d", i),
                string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<cr>", i),
                desc = string.format("Navigate to Harpoon file %d", i)
            })
        end
        return keymaps
    end)()
}
