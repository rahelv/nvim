return {
    "nvim-treesitter/nvim-treesitter", 
    build = ':TSUpdate', 
    opts = {
        ensure_installed = { "vim", "c", "lua", "python"}, 
        auto_install = true, 
        highlight = {
            enable = true, 
            -- additional_vim_regex_highlighting = { 'markdown'}, -- enable if there is weird stuff happening with indentation 
        },
        indent = { enable = true }, 
    }, 
    config = function(_ , opts) 
        require('nvim-treesitter.configs').setup(opts)
    end,
}
