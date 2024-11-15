return {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	cmd = "Copilot",
	event = { "InsertEnter", "LspAttach" },
	enabled = true,
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
		},
  		panel = { enabled = false },
	},
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			event = { "InsertEnter", "LspAttach" },
			config = function(_, opts)
				local function on_att(on_attach)
					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local buffer = args.buf
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							on_attach(client, buffer)
						end,
					})
				end
				local copilot_cmp = require("copilot_cmp")
				copilot_cmp.setup(opts)
				-- attach cmp source whenever copilot attaches
				on_att(function(client)
					if client.name == "copilot" then
						copilot_cmp._on_insert_enter({})
					end
				end)
			end,
		},
	},

}
