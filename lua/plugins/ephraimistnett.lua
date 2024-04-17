-- file for all my colorschemes 
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,  --dont lazy load
        priority = 1000, -- load first
        init = function()
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    }, 
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, 
}
