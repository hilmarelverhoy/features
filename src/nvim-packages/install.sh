#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

touch "/home/vscode/.config/nvim/packages.lua"
clone() {
    git clone "https://github.com/$1/$2" "/home/vscode/.local/share/nvim/site/pack/$2"
    echo 'vim.cmd("packadd $2")'
}

clone 'nvim-lua' 'plenary.nvim'
clone 'nvim-telescope' 'telescope.nvim'
clone 'nvim-lua' 'plenary.nvim'
clone 'nvim-treesitter' 'nvim-treesitter'
clone 'EdenEast' 'nightfox.nvim'
clone 'nvim-neotest' 'nvim-nio'
clone 'Issafalcon' 'neotest-dotnet'
clone 'antoinemadec' 'FixCursorHold.nvim'
clone 'hrsh7th' 'cmp-buffer'
clone 'hrsh7th' 'cmp-path'
clone 'saadparwaiz1' 'cmp_luasnip'
clone 'hrsh7th' 'cmp-nvim-lsp'
clone 'hrsh7th' 'cmp-nvim-lua'
clone 'L3MON4D3' 'LuaSnip'
clone 'rafamadriz' 'friendly-snippets'

clone 'ThePrimeagen' 'vim-be-good'
clone 'mracos' 'mermaid.vim'
clone 'wbthomason' 'packer.nvim'
clone 'seblj' 'roslyn.nvim'
clone 'nvim-telescope' 'telescope.nvim'
clone 'nvim-telescope' 'telescope-project.nvim'
clone 'sindrets' 'diffview.nvim'
clone 'nvim-telescope' 'telescope-file-browser.nvim'
clone 'nvim-treesitter' 'nvim-treesitter-refactor'
clone 'nvim-treesitter' 'nvim-treesitter-textobjects'
clone 'RRethy' 'nvim-treesitter-textsubjects'
clone 'danymat' 'neogen'
clone 'tpope' 'vim-dispatch'
clone 'tpope' 'vim-fugitive'
clone 'tpope' 'vim-commentary'
clone 'tpope' 'vim-abolish'
clone 'tpope' 'vim-repeat'
clone 'tpope' 'vim-surround'
clone 'farmergreg' 'vim-lastplace'
clone 'tmadsen' 'vim-compiler-plugin-for-dotnet'
clone 'nvim-tree' 'nvim-web-devicons'
clone 'williamboman' 'mason.nvim'
clone 'williamboman' 'mason-lspconfig.nvim'
clone 'neovim' 'nvim-lspconfig'
clone 'hrsh7th' 'nvim-cmp'
clone 'andymass' 'vim-matchup'
clone 'EdenEast' 'nightfox.nvim'

#cp configuration to .config
echo "Done!"
