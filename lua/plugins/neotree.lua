-- filetree navigation
return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        'iamcco/markdown-preview.nvim',
        '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle file explorer (root dir)' },
        { '<leader>E', '<cmd>Neotree reveal<CR>', desc = 'Toggle file explorer (cwd)' },
    },
    opts = {
        window = {
            mappings = {
                ['o'] = 'system_open',
            },
        },
        commands = {
            system_open = function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
            end,
        },
    },
}
