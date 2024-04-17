return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            -- TODO: cmp-buffer / cmp-path, lspkind ? 
        },
        config = true,
    },
}
