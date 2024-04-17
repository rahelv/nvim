-- mark git changes/additions etc. in files
return {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile"}, -- BufReadPre: starting to edit an existing file, BufNewFile: starting to edit a non-existent file 
    config = true,
}
