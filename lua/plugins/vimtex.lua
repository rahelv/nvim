function VimtexPDFToggle()
    -- TODO: vim.api.nvim_command 'VimtexCompile'

    if vim.g.term_pdf_vierer_open then
        vim.fn.system 'kitty @ close-window --match title:termpdf'
        vim.g.term_pdf_vierer_open = false
    elseif vim.g.tex_compiles_successfully then
        vim.fn.system 'kitty @ launch --location=hsplit --cwd=current --title=termpdf'

        local command = 'termpdf.py ' .. vim.api.nvim_call_function('expand', { '%:r' }) .. '.pdf' .. "'\r'"
        local kitty = 'kitty @ send-text --match title:termpdf '
        vim.fn.system(kitty .. command)
        vim.g.term_pdf_vierer_open = true
    end
end

return {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here
        vim.g.tex_flavor = 'latex'
        vim.g.tex_conceal = 'abdmgs'
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-lualatex' }
        vim.g.vimtex_view_enabled = 0
        vim.g.vimtex_view_automatic = 0
        vim.g.vimtex_indent_on_ampersands = 0
    end,
    keys = {
        { '<leader>q', ':lua VimtexPDFToggle()<cr>', desc = 'Toggle vimtex PDF viewer' },
    },
}
