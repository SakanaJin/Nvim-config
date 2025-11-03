-- This file can be locaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup {}
        end
    }
    use('ray-x/lsp_signature.nvim')
    use('nvim-lualine/lualine.nvim')
--    use {
--        'goolord/alpha-nvim',
--        config = function()
--            require('alpha').setup(require('alpha.themes.startify').config)
--        end
--    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup {}
        end
    }
	use({
		'rebelot/kanagawa.nvim',
		as = 'kanagawa',
		config = function()
			vim.cmd('colorscheme kanagawa')
		end
	})
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                         , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
    use(
        {
            'goolord/alpha-nvim',
            config = function() 
                local alpha = require('alpha')
                local dashboard = require('alpha.themes.dashboard')
                local icons = require('nvim-web-devicons')
                local colors = require('kanagawa.colors').setup()

                --local function pick_color()
                --    local colors = {"String", "Identifier", "Keyword", "Number"}
                --    return colors[math.random(#colors)]
                --end
                
                local logo = {
                    "                                     ██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████                                     ",
                    "                          ███▓▓▓▓▓▓▓▓▓▓▓▓██████████████████▓▓▓▓▓▓▓▓▓▓▓▓███                          ",
                    "                   ██▓▓▓▓▓▓▓▓████████████▒███▒▒██▒██▒▒▒▒█▒▒████████████▓▓▓▓▓▓▓██                    ",
                    "                 █▓▓▓▓██████▒▒▒█▒▒▒▒▒█▒▒▒▓███▒▒██▒█▒███▒▒▒▓██▒█▒▒██▒█▒▒███████▓▓▓▓█                 ",
                    "                 █▓▓███████▒███▓▒███▒▒█▒▒████▒▒██▒█▒███▒▒▒▓██▒█▒█▒█▒█▒███▒███████▓█                 ",
                    "                 █▓▓███████▒▒███▒███▒█▒▒█▒███▒▒██▒█▒▒▒▒▒█▒▒██▒█▒██▒▒█▒███▒▒██████▓█                 ",
                    "                 █▓▓███████▒█████▒▒▒███████████████████████████████▒█▒▒██▒██▒▒█▒█▓█                 ",
                    "                 █▓▓███████████████▓▒▒▒▒▒████████████████████████████████████▒█▒█▓█                 ",
                    "                 █▓▓███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████████████████████████████▒▒▒▒█▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒█▒▒▒▒███████████████████████████▒██▒█▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████████████▓████▓██▒█▓█                 ",
                    "                 █▓▓█▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████▒▒▒▒▒████▓██████▓█                 ",
                    "                 █▓▓█▒▒████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████▒▒▒▒▒██████████▒▒██▓█                 ",
                    "                 █▓▓█▒▒▒███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒█████████████████▓█                 ",
                    "                 █▓▓█▒▒▓  ███████████▒▒▒▒▒▒▒▒▒▒▒██▒▒███▒▒▒█▒▒▒███████████████████▓█                 ",
                    "                 █▓▓█▒▒▒█    █████████▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▓█▒▒░███████████ ████▒█▒█▓█                 ",
                    "                 █▓▓█▒▒▒▒█   ░██████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████████  ██████▒█▓█                 ",
                    "                 █▓▓█▒▒▒▒▓    █ █░ ███ █▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░██████ █     ███▒▒▒▒▓▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒█    █   ░█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████     ██████▒█▓▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒▒█░░   █▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒ ░   ████████▒▓▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒█░▓██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████▒█▒▓▓█                 ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████▓▓                  ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒████▒███▒▓▓                  ",
                    "                 █▓▓█▒▒▒▒█▒▒▒▒█   █▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████▒▓███▓▓                  ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒▒█   ▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒█ ███▒▒▒▒█▓▓                  ",
                    "                 █▓▓█▒▒▒▒▒▒▒▒▒▒█   ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒█▒▒▒▒▒█  ▓███▒███▓▓▓                  ",
                    "                  ▓▓█ █▒▒▒▒█▒▒░█   ▒█████████▒▒██▒▒▒█▒▒▒▒▒█████▒▒▒▒▒   █████▒▒▒█▓▓                  ",
                    "                  ▓▓█  ░██▒█▒▒▒ ██▒▒▒████   ████▒▒▒▒▒▒███ █ ███▒▒▒▒▒▓ ░█████▒▒▒█▓▓                  ",
                    "                  ▓▓█      █▒▒▒  ░█▒▒▒▒██████████▒▒▒▒████████▒▒▒████  ███████▒██▓▓                  ",
                    "                  ▓▓▓█  ░████▒▒▒█  ██▒▒▒▒▒▒▒▒█▒█▒▒▒▒▒█▓▒▒▒▒▒▒▒▒▒▒▒█  ███████████▓█                  ",
                    "                  █▓▓██░██████▒▒▒▒░░ ██▒▒▒▒▒▒▒▒█▒▒▒▒▒█▒▒▒▒▒▒▒▒█    ████████████▓▓                   ",
                    "                   █▓▓████████▒▒▒▒█░     ▓▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒█   ░     ██████████▓▓█                   ",
                    "                    ▓▓▓████████▒▒▒▒▒▒▒█    ▒▒▒▒▒▒▒▒▒▒▒▒▒░     ▒█ ████████████▓▓█                    ",
                    "                    █▓▓▓██████████▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒█   ░█████████████████▓▓█                     ",
                    "████████████▓▓▓▓▓▓▓▓▓▓▓▓▓███████████▒▒▒▒▒▒▓▓  ▒▒▒▒▒▒▒▒   ██████████████████▓▓█                      ",
                    "█▓██████████████████████████████████████▓▓▓▓   █▒▒▒▒▒    █████████████████▓▓█                       ",
                    " █▓▓█░   █░                             ▓▓▓▓   █▒▒▒▒▒█   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█                        ",
                    "   ▓▓▓██▒  ░          ░    ░ ░          ▓▓▓▓  ▒███████░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█                        ",
                    "     █▓▓▓▓██████████████████████████████▓▓▓▓▓  ███████  ██████████████████▓█                        ",
                    "         ███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▒▒▒▓▓░█░   █    ██████████████▓▓▓▓▓█                         ",
                    "                              ▓▓▓███████▒▒▓▓▒▒▒▒▒▓█████████████████▓▓█                              ",
                    "                               █▓▓▓███████▒▒▒▒▒▒▒▒███████████████▓▓▓                                ",
                    "                                 █▓▓▓█████▓▒▒▒▒▒▒▒▒████████████▓▓▓█                                 ",
                    "                                   █▓▓▓███▓▒▒▒▒▒▒▒▒██████████▓▓▓█                                   ",
                    "                                      █▓▓▓██▒▒▒▒▒▒▓███████▓▓▓█                                      ",
                    "                                         █▓▓▓███▒▒█████▓▓▓██                                        ",
                    "                                            █▓▓▓▓▓█▓▓▓▓█                                            ",
                    "                                                ██▓██                                               ", 
                    "                                                                                                    ",                                                                                   
                    "                 ███████╗ ██████╗ ██╗  ██╗██╗  ██╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗               ",
                    "                 ██╔════╝██╔═══██╗╚██╗██╔╝██║  ██║██╔═══██╗██║   ██║████╗  ██║██╔══██╗              ",
                    "                 █████╗  ██║   ██║ ╚███╔╝ ███████║██║   ██║██║   ██║██╔██╗ ██║██║  ██║              ", 
                    "                 ██╔══╝  ██║   ██║ ██╔██╗ ██╔══██║██║   ██║██║   ██║██║╚██╗██║██║  ██║              ",
                    "                 ██║     ╚██████╔╝██╔╝ ██╗██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝              ",
                    "                 ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝               "
                }
                
                dashboard.section.header.val = logo
                --dashboard.section.header.opts.hl = pick_color()
                dashboard.section.header.opts.hi = "DashboardHeader"
                vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.waveAqua1, bold = true })

                local icons = {
                    file = "",
                    filesearch = "",
                    bookmark = "",
                    exit = "󰅗",
                    new = ""
                }

                dashboard.section.buttons.val = {
                    dashboard.button("e", icons.new.. " [New File]", ":enew<CR>"),
                    dashboard.button("<leader>t", icons.file.. " [File Tree]"),
                    dashboard.button("<leader>pf", icons.filesearch.. " [Find File]"),
                    dashboard.button("<C-e>", icons.bookmark.. " [Bookmarks]"),
                    dashboard.button("q", icons.exit.. " [Quit]", ":qa<CR>")
                }
                
                alpha.setup(dashboard.opts)

                vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
            end
        }
    )

end)
