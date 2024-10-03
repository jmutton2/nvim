local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'f-person/git-blame.nvim'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'ThePrimeagen/harpoon'
	use "lukas-reineke/lsp-format.nvim"
	use "nvim-treesitter/nvim-treesitter-context"

	--	use { '~/personal/scribe' }
	use "jmutton2/scribe"

	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	}

	use {
		'tanvirtin/vgit.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use({
		"epwalsh/obsidian.nvim",
		tag = "*",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "personal",
						path = "~/vaults",
					},
				},
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
