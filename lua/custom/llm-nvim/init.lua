local M = {}

-- Function to display "Hello, World!" using noice
function M.say_hello()
	local has_noice, noice = pcall(require, "noice")
	if has_noice then
		noice.notify("Hello, World!", "info", { title = "Greeting" })
	else
		vim.notify("Hello, World!", vim.log.levels.INFO, { title = "Greeting" })
	end
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>hw",
	':lua require("custom.llm-nvim").say_hello()<CR>',
	{ noremap = true, silent = true }
)

function M.send_request()
	local current_buff = vim.api.nvim_get_current_buf()
	local buffer_content = vim.api.nvim_buf_get_lines(current_buff, 0, -1, false)
	local cursor_position = vim.fn.getpos(".")
	local marker = "###CURSOR###"

	-- Insert the marker at the cursor position
	table.insert(buffer_content, cursor_position[2], marker)

	-- Add file name and extension to the buffer content
	local file_name = vim.fn.expand("%:t")
	local file_extension = vim.fn.expand("%:e")
	table.insert(buffer_content, 1, file_name)

	-- Concatenate the buffer content with proper escaping for JSON
	local escaped_content = {}
	for _, line in ipairs(buffer_content) do
		-- Escape double quotes and backslashes for JSON compatibility
		local escaped_line = line:gsub("\\", "\\\\"):gsub('"', '\\"')
		table.insert(escaped_content, escaped_line)
	end

	local data = string.format(
		'{"messages": [{"role":"system", "content":"your job is provide autocompletion for coding. you can only respond with the content that should autocomplete where ###CURSOR### is. This can be one to many characters. use the entire content to add context to the autocompletion. your response is going to be templated into the ###CURSOR### location, so do not add any extraneous characters, only the characters or words that complete the line and/or function."},{"role": "user", "content": "%s"}]}',
		table.concat(escaped_content, "\\n")
	)

	--make the directory if it doesn't exist
	vim.fn.system("mkdir -p /tmp/llm-nvim")

	-- Use double quotes around the payload and escape double quotes in JSON
	local curl_command = string.format(
		'curl -X POST -H "Content-Type: application/json" -d "%s" http://localhost:8000/v1/chat/completions -o /tmp/llm-nvim/response.json',
		data:gsub('"', '"') -- Escape double quotes in JSON
	)

	-- save curl command to a file for debugging
	local curl_command_file = io.open("/tmp/llm-nvim/curl_command.sh", "w")
	curl_command_file:write(curl_command)

	-- Execute the curl command
	vim.fn.system(curl_command)

	-- "Think" for a while
	vim.fn.system("sleep 5")

	-- Read the response
	local response = vim.fn.readfile("/tmp/llm-nvim/response.json")
	local response_content = vim.fn.json_decode(table.concat(response, "\n"))
	local completion = response_content["choices"][1]["message"]["content"]

	-- Open a new buffer with the completion in a vsplit
	local completion_buffer = vim.api.nvim_create_buf(false, true)

	-- Split the completion text into lines and add it to the buffer
	local lines = {}
	for line in completion:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	vim.api.nvim_buf_set_lines(completion_buffer, 0, -1, false, lines)
	vim.api.nvim_command("vsplit")
	vim.api.nvim_set_current_buf(completion_buffer)
end

function M.send_request_old()
	local current_buff = vim.api.nvim_get_current_buf()
	local buffer_content = vim.api.nvim_buf_get_lines(current_buff, 0, -1, false)
	local cursor_position = vim.fn.getpos(".")
	local marker = "###CURSOR###"

	-- Insert the marker at the cursor position
	table.insert(buffer_content, cursor_position[2], marker)

	-- Add file name and extension to the buffer content
	local file_name = vim.fn.expand("%:t")
	local file_extension = vim.fn.expand("%:e")
	table.insert(buffer_content, 1, file_name)

	-- Concatenate the buffer content with proper escaping for JSON
	local escaped_content = {}
	for _, line in ipairs(buffer_content) do
		-- Escape double quotes and backslashes for JSON compatibility
		local escaped_line = line:gsub("\\", "\\\\"):gsub('"', '\\"')
		table.insert(escaped_content, escaped_line)
	end

	local data = string.format(
		'{"messages": [{"role":"system", "content":"your job is provide autocompletion for coding. you can only respond with the content that should autocomplete where ###CURSOR### is. This can be one to many characters. use the entire content to add context to the autocompletion. your response is going to be templated into the ###CURSOR### location, so do not adsd any extraneous characters, only the chacaters or words that complete the line and/or function."},{"role": "user", "content": "%s"}]}',
		table.concat(escaped_content, "\\n")
	)

	-- Print data using Noice or Vim's notification
	local has_noice, noice = pcall(require, "noice")
	if has_noice then
		noice.notify(data, "info", { title = "Request" })
	else
		vim.notify(data, vim.log.levels.INFO, { title = "Request" })
	end
	vim.fn.system(
		string.format(
			"curl -X POST -H \"Content-Type: application/json\" -d '%s' http://localhost:8000/v1/chat/completions -o /tmp/llm-nvim/response.json",
			data
		)
	)

	-- "think" for a while
	vim.fn.system("sleep 5")

	-- Read the response
	local response = vim.fn.readfile("/tmp/response.json")
	local response_content = vim.fn.json_decode(response[1])
	--
	-- -- Remove the marker
	-- table.remove(buffer_content, cursor_position[2])
	--
	-- -- Insert the response
	-- vim.api.nvim_buf_set_lines(
	-- 	current_buff,
	-- 	cursor_position[2] - 1,
	-- 	cursor_position[2] - 1,
	-- 	false,
	-- 	response_content["messages"][1]["content"]
	-- )
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>cc",
	':lua require("custom.llm-nvim").send_request()<CR>',
	{ noremap = true, silent = true }
)

return M
