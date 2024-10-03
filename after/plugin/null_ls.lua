local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end
					})
				end,
			})
		end
	end,
})

require("lsp-format").setup {}

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client, bufnr)
end

require("lspconfig").gopls.setup { on_attach = on_attach }
require("lspconfig").eslint.setup { on_attach = on_attach }
require("lspconfig").svelte.setup { on_attach = on_attach }
require("lspconfig").ruby_lsp.setup { on_attach = on_attach }
require("lspconfig").rust_analyzer.setup { on_attach = on_attach }
