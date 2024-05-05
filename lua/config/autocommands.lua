-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
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

-- vimtex
vim.g.tex_compiles_successfully = false
vim.g.term_pdf_vierer_open = false
vim.api.nvim_create_augroup('CustomTex', {})
autocmd('User', {
    group = 'CustomTex',
    pattern = 'VimtexEventCompileSuccess',
    callback = function()
        vim.g.tex_compiles_successfully = true

        -- a hacky way to reload the pdf in the terminal
        -- when it has changed
        if vim.g.term_pdf_vierer_open and vim.g.tex_compiles_successfully then
            local command = 'termpdf.py ' .. vim.api.nvim_call_function('expand', { '%:r' }) .. '.pdf' .. "'\r'"
            local kitty = 'kitty @ send-text --match title:termpdf '
            vim.fn.system(kitty .. command)
        end
    end,
})

autocmd('User', {
    group = 'CustomTex',
    pattern = 'VimtexEventCompileFailed',
    callback = function()
        vim.g.tex_compiles_successfully = false
    end,
})

autocmd('User', {
    group = 'CustomTex',
    pattern = 'VimtexEventQuit',
    callback = function()
        vim.fn.system 'kitty @ close-window --match title:termpdf'
    end,
})
