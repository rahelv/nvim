-- fuzzy finder (files, lsp, etc)
return {
    'nvim-telescope/telescope.nvim', 
    dependencies = {
        'nvim-lua/plenary.nvim',
    }, 
    config = true, 
    keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keybinding" },
		{ "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
	},
}
