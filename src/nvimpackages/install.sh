#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

mkdir -p /home/vscode/.config/

git clone -b devcontainer https://github.com/hilmarelverhoy/nvim /home/vscode/.config/nvim

mkdir -p /home/vscode/.local/share/nvim/site/pack/
mkdir -p /home/vscode/.local/state

clone() {
    git clone "https://github.com/$1/$2" "/home/vscode/.local/share/nvim/site/pack/$2"
    echo "vim.cmd('packadd $2')" >> /home/vscode/.config/nvim/lua/hilmare/packer.lua
}

clone 'EdenEast' 'nightfox.nvim'
clone 'Issafalcon' 'neotest-dotnet'
clone 'L3MON4D3' 'LuaSnip'
clone 'antoinemadec' 'FixCursorHold.nvim'
clone 'hilmarelverhoy' 'nvim.git'
clone 'hrsh7th' 'cmp-buffer'
clone 'hrsh7th' 'cmp-nvim-lsp'
clone 'hrsh7th' 'cmp-nvim-lua'
clone 'hrsh7th' 'cmp-path'
clone 'nvim-lua' 'plenary.nvim'
clone 'nvim-neotest' 'nvim-nio'
clone 'nvim-telescope' 'telescope.nvim'
clone 'nvim-treesitter' 'nvim-treesitter'
clone 'rafamadriz' 'friendly-snippets'
clone 'saadparwaiz1' 'cmp_luasnip'

clone 'RRethy' 'nvim-treesitter-textsubjects'
clone 'ThePrimeagen' 'vim-be-good'
clone 'andymass' 'vim-matchup'
clone 'danymat' 'neogen'
clone 'farmergreg' 'vim-lastplace'
clone 'hrsh7th' 'nvim-cmp'
clone 'mracos' 'mermaid.vim'
clone 'neovim' 'nvim-lspconfig'
clone 'nvim-telescope' 'telescope-file-browser.nvim'
clone 'nvim-telescope' 'telescope-project.nvim'
clone 'nvim-tree' 'nvim-web-devicons'
clone 'nvim-treesitter' 'nvim-treesitter-refactor'
clone 'nvim-treesitter' 'nvim-treesitter-textobjects'
clone 'seblj' 'roslyn.nvim'
clone 'sindrets' 'diffview.nvim'
clone 'tmadsen' 'vim-compiler-plugin-for-dotnet'
clone 'tpope' 'vim-abolish'
clone 'tpope' 'vim-commentary'
clone 'tpope' 'vim-dispatch'
clone 'tpope' 'vim-fugitive'
clone 'tpope' 'vim-repeat'
clone 'tpope' 'vim-surround'
clone 'wbthomason' 'packer.nvim'
clone 'williamboman' 'mason-lspconfig.nvim'
clone 'williamboman' 'mason.nvim'

chown -R vscode /home/vscode/.local
chown -R vscode /home/vscode/.config

#cp configuration to .config
echo "Done!"`
