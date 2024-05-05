-- highlight, edit and navigate code
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { 'vim', 'c', 'cpp', 'lua', 'python' },
        auto_install = true,
        highlight = {
            enable = true,
            disable = { 'latex' },
            -- additional_vim_regex_highlighting = { 'markdown'}, -- enable if there is weird stuff happening with indentation
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
-- TODO:
-- [[
-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- ]]
