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

-- Open Tree-sitter (nvim-tree) in current dir when no args
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- LSP config ---
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"pyright",
		"clangd"
	}
})

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
