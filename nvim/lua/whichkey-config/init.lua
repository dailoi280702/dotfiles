local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.setup({
	plugins = {
		mark = false,
		registers = false,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false,
		},
	},
})

local mappings = {
	q = { ":LspInfo<cr>", "Lsp show" },
	f = {
		name = "Telescope",
		f = { ":Telescope find_files<cr>", "Telesope Find Files" },
		B = { ":Telescope file_browser<cr>", "Telesope Browse Files" },
		b = { ":Telescope buffers<cr>", "Telesope Browse Files" },
	},
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
	},
	p = { ":PackerSync<cr>", "PackerSync" },
	m = {
		name = "Livedown",
		p = { ":LivedownPreview<cr>", "Preview Markdown" },
		k = { ":LivedownKill<cr>", "Kill Livedown" },
		t = { ":LivedownToggle<cr>", "Toggle Livedown" },
	},
	w = { ":w<cr>", "Save" },
	h = {
		name = "Jumping",
		a = { ":HopWord<cr>", "words" },
		s = { ":HopLine<cr>", "lines" },
		d = { ":HopWordMW<cr>", "all words" },
		f = { ":HopLineMW<cr>", "all lines" },
		j = { ":HopChar1<cr>", "char 1" },
		k = { ":HopChar1MW<cr>", "all char 1" },
	},
}
local opts = { prefix = "<leader>" }

whichkey.register(mappings, opts)
