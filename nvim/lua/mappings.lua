local wk = require("which-key")

wk.setup({
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
	icons = { breadcrumb = "»", separator = "->", group = "+" },
	layout = { align = "center", spacing = 3, height = { min = 1, max = 6 } },
})

local mappings = {
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files hidden=true<cr>", "Telesope Find Files" },
		a = { "<cmd>Telescope file_browser hidden=true<cr>", "Telesope Browse Files" },
		j = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Telesope Buffers" },
		k = { "<cmd>Telescope live_grep<cr>", "Telesope Live Grep" },
		d = { "<cmd>Telescope diagnostics<cr>", "Telesope Diagnostics" },
	},
	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
		k = { vim.lsp.buf.signature_help, "Signature Help" },
		w = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
		W = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
		d = { "<cmd>Telescope lsp_definitions<cr>", "Go To Definition" },
		D = { "<cmd>Telecsope lsp_declarations<cr>", "Go To Declaration" },
		r = { "<cmd>Telecsope lsp_references<cr>", "Go To References" },
		I = { "<cmd>Telecsope lsp_implementations<cr>", "Go To References" },
		t = { "<cmd>Telecsope lsp_type_definitions<cr>", "Go To References" },
		K = { vim.lsp.buf.hover, "Hover Commands" },
		R = { vim.lsp.buf.rename, "Rename" },
		a = { vim.lsp.buf.code_action, "Code Action" },
		e = { vim.diagnostic.open_float, "Show Line Diagnostics" },
		n = { vim.diagnostic.goto_next, "Go To Next Diagnostic" },
		N = { vim.diagnostic.goto_pre, "Go To Previous Diagnostic" },
	},
	m = {
		name = "Livedown",
		p = { "<cmd>LivedownPreview<cr>", "Preview Markdown" },
		k = { "<cmd>LivedownKill<cr>", "Kill Livedown" },
		t = { "<cmd>LivedownToggle<cr>", "Toggle Livedown" },
	},
	s = { ":wa<cr>", "Save" },
	j = {
		name = "Jumping",
		j = { "<cmd>HopWord<cr>", "words" },
		l = { "<cmd>HopLine<cr>", "lines" },
		a = { "<cmd>HopWordMW<cr>", "all words" },
		L = { "<cmd>HopLineMW<cr>", "all lines" },
		c = { "<cmd>HopChar1<cr>", "char 1" },
		C = { "<cmd>HopChar1MW<cr>", "all char 1" },
	},
	-- s = { "vi{:sort<cr>", "Sort" },
	z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
	b = { name = "Buffers" },
}

local opts = { prefix = "<leader>" }

wk.register(mappings, opts)
