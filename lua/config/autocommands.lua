-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
local autocmd = vim.api.nvim_create_autocmd

autocmd('textyankpost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd({ 'BufReadPost' }, {
    desc = 'Open file at the last position it was opened',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})
