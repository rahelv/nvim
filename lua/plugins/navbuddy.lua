return {
    'SmiteshP/nvim-navbuddy',
    lazy = true,
    dependencies = {
        {
            'SmiteshP/nvim-navic',
            dependencies = 'neovim/nvim-lspconfig',
            opts = {},
            config = function(_, opts)
                require('nvim-navic').setup(opts)
            end,
        },
        'MunifTanjim/nui.nvim',
    },
    opts = { lsp = { auto_attach = true } },
}
