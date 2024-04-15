return {
    "folke/tokyonight.nvim",
    lazy = false,  --dont lazy load
    priority = 1000, -- load first
    init = function()
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
