return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'folke/neodev.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local lsp_zero = require 'lsp-zero'

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                lsp_zero.default_keymaps { buffer = bufnr } --TODO: define custom rn keybinding (code-action f4 -> ca & rename f2 -> rn)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'See available code actions' })
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Stupid Rename' })
            end)

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
            require('mason').setup {}
            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup {}
                    end,
                },
            }
            -- configure lua ls
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
            -- setup for c
            require('lspconfig').clangd.setup {
                on_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                cmd = {
                    'clangd',
                    '--offset-encoding=utf-16',
                },
            }
            require('lspconfig').texlab.setup {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }
        end,
    },
}
