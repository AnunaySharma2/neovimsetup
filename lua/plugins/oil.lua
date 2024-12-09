return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
