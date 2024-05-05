return {
    'theprimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
            '<leader>h',
            function()
                require('harpoon.mark').add_file()
            end,
            desc = 'Add current file to harpoon list',
        },
        {
            '<leader>H',
            function()
                require('harpoon.ui').toggle_quick_menu()
            end,
            desc = 'Show the harpoon file list',
        },
        {
            '<leader><Tab>',
            function()
                require('harpoon.ui').nav_next()
            end,
            desc = 'Jump to the next harpoon file',
        },
        {
            '<leader><S-Tab>',
            function()
                require('harpoon.ui').nav_prev()
            end,
            desc = 'Jump to the previous harpoon file',
        },
    },
}
