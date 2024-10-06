if vim.g.did_load_markdownft_plugin then
	return
end
vim.g.did_load_markdownft_plugin = true

require("render-markdown").setup({})
require("obsidian").setup({
	ui = { enable = false },
	workspaces = {
		{
			name = "personal",
			path = "~/personal",
		},
		{
			name = "no-vault",
			path = function()
				-- alternatively use the CWD:
				return assert(vim.fn.getcwd())
				-- return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
			end,
			overrides = {
				notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
				new_notes_location = "current_dir",
				templates = {
					folder = vim.NIL,
				},
				disable_frontmatter = true,
			},
		},
	},
})
