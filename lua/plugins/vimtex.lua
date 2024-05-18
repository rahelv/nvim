return {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
        vim.cmd [[
        let g:tex_flavor="latex"
        let g:vimtex_view_method="zathura"
        let g:vimtex_general_viewer="zathura"
        set conceallevel=1
        let g:tex_conceal="abdmg"
        ]]
    end,
}
