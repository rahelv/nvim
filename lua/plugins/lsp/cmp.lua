return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        -- dependencies = {
        --
        -- },
        config = function()
            -- Configure autocompletion settings 
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- TODO: find out what this does 
    }
}
