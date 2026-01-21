-- ~/.config/nvim/init.lua

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

do
	local home_local_bin = vim.fn.expand("~/.local/bin")
	if
		home_local_bin ~= ""
		and not string.find(":" .. (vim.env.PATH or "") .. ":", ":" .. home_local_bin .. ":", 1, true)
	then
		vim.env.PATH = (vim.env.PATH or "") .. ":" .. home_local_bin
	end
end

require("core.lazy")
require("core.options")
require("core.keymaps")
require("core.autocmds")
