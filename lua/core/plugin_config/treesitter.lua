require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "ruby", "vim", "vimdoc", "yaml", "go" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
