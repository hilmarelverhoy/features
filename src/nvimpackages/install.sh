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
    git clone --depth 1 --"https://github.com/$1/$2" "/home/vscode/.local/share/nvim/site/pack/devcontainer/$3/$2"
    echo "vim.cmd('packadd $2')" >> /home/vscode/.config/nvim/lua/hilmare/packer.lua
}

clone 'EdenEast' 'nightfox.nvim' 'opt'
clone 'Issafalcon' 'neotest-dotnet' 'opt'
clone 'L3MON4D3' 'LuaSnip' 'opt'
clone 'antoinemadec' 'FixCursorHold.nvim' 'opt'
clone 'hrsh7th' 'cmp-buffer' 'opt'
clone 'hrsh7th' 'cmp-nvim-lsp' 'opt'
clone 'hrsh7th' 'cmp-nvim-lua' 'opt'
clone 'hrsh7th' 'cmp-path' 'opt'
clone 'nvim-lua' 'plenary.nvim' 'opt'
clone 'nvim-neotest' 'nvim-nio' 'opt'
clone 'nvim-telescope' 'telescope.nvim' 'opt'
clone 'nvim-treesitter' 'nvim-treesitter' 'opt'
clone 'rafamadriz' 'friendly-snippets' 'opt'
clone 'saadparwaiz1' 'cmp_luasnip' 'opt'

clone 'RRethy' 'nvim-treesitter-textsubjects' 'opt'
clone 'ThePrimeagen' 'vim-be-good' 'opt'
clone 'andymass' 'vim-matchup' 'opt'
clone 'danymat' 'neogen' 'opt'
clone 'farmergreg' 'vim-lastplace' 'opt'
clone 'hrsh7th' 'nvim-cmp' 'opt'
clone 'mracos' 'mermaid.vim' 'opt'
clone 'neovim' 'nvim-lspconfig' 'opt'
clone 'nvim-telescope' 'telescope-file-browser.nvim' 'opt'
clone 'nvim-telescope' 'telescope-project.nvim' 'opt'
clone 'nvim-tree' 'nvim-web-devicons' 'opt'
clone 'nvim-treesitter' 'nvim-treesitter-refactor' 'opt'
clone 'nvim-treesitter' 'nvim-treesitter-textobjects' 'opt'
clone 'seblj' 'roslyn.nvim' 'start'
clone 'sindrets' 'diffview.nvim' 'opt'
clone 'tmadsen' 'vim-compiler-plugin-for-dotnet' 'opt'
clone 'tpope' 'vim-abolish' 'opt'
clone 'tpope' 'vim-commentary' 'opt'
clone 'tpope' 'vim-dispatch' 'opt'
clone 'tpope' 'vim-fugitive' 'opt'
clone 'tpope' 'vim-repeat' 'opt'
clone 'tpope' 'vim-surround' 'opt'
clone 'williamboman' 'mason-lspconfig.nvim' 'opt'
clone 'williamboman' 'mason.nvim' 'opt'
clone 'Idelossa' 'gh.nvim' 'opt'

chown -R vscode /home/vscode/.local
chown -R vscode /home/vscode/.config

#cp configuration to .config
echo "Done!"
