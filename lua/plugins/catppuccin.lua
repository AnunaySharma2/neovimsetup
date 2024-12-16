return {
    'Shatur/neovim-ayu',
    config = function()
        require('ayu').setup({
            mirage = false,  -- Set to `true` for the mirage variant instead of dark.
            terminal = true, -- Keep terminal colors in sync.
        })
        require('ayu').colorscheme() -- Apply the colorscheme
    end
}
