local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
	return
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = 20,
	open_mapping = [[<c-`>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	persist_mode = true,
})
