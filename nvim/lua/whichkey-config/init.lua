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
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files hidden=true<cr>", "Telesope Find Files" },
		a = { "<cmd>Telescope file_browser hidden=true<cr>", "Telesope Browse Files" },
		j = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Telesope Buffers" },
		k = { "<cmd>Telescope live_grep<cr>", "Telesope Live Grep" },
	},
	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
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
	p = { "<cmd>PackerSync<cr>", "PackerSync" },
	m = {
		name = "Livedown",
		p = { "<cmd>LivedownPreview<cr>", "Preview Markdown" },
		k = { "<cmd>LivedownKill<cr>", "Kill Livedown" },
		t = { "<cmd>LivedownToggle<cr>", "Toggle Livedown" },
	},
	w = { "<cmd>wa<cr>", "Save" },
	h = {
		name = "Jumping",
		a = { "<cmd>HopWord<cr>", "words" },
		s = { "<cmd>HopLine<cr>", "lines" },
		d = { "<cmd>HopWordMW<cr>", "all words" },
		f = { "<cmd>HopLineMW<cr>", "all lines" },
		j = { "<cmd>HopChar1<cr>", "char 1" },
		k = { "<cmd>HopChar1MW<cr>", "all char 1" },
	},
	s = { "vi{:sort<cr>", "sort" },
}
local opts = { prefix = "<leader>" }

whichkey.register(mappings, opts)
