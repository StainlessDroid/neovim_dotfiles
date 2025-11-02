-------------------
-- NEOVIM CONFIG --
-- BY: @mapascua --
-------------------

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- LEGACY vim config & plugins --
vim.cmd("set mouse=a")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("let g:user42='mapascua'")
vim.cmd("let g:mail42='mapascua@student.42malaga.com'")

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		if vim.fn.argc() == 0 or (vim.fn.argc() > 0 and vim.fn.isdirectory(data.file) == 1) then
			return
		end
    	require("nvim-tree.api").tree.open()
    	require("nvim-tree.api").tree.focus()
    	if vim.fn.argc() > 0 then
			vim.cmd("wincmd p") -- return to file window
		end
	end,
})
-- Close when nvim-tree is the only thing left
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(data)
	if vim.fn.isdirectory(data.file) ~= 1 then
		if (vim.fn.winnr('$') == 1 and vim.bo.filetype == 'NvimTree') then
				vim.cmd('quit')
			end
		end
	end,
})

-- LSP config --
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.cmd("set completeopt+=noselect")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
