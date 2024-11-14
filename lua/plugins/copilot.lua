return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = { "InsertEnter", "LspAttach" },
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<C-<cr>>",
				decline = "<C-<bs>>",
				next = "<C-<tab>>",
				prev = "<C-<s-tab>>",
			},
		},
  		panel = { enabled = false },
	},
}
