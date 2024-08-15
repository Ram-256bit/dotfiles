local overrides = require("configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig")
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
		lazy = false,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		-- keys = {
		-- 	{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		-- 	{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		-- 	{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		-- 	{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		-- 	{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		-- },
		-- lazy = false,
	},
	{
		"github/copilot.vim",
		-- config = function()
		-- 	require("copilot").setup()
		-- end,
		cmd = {
			"Copilot",
		},

		-- lazy = false,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"mbbill/undotree",
    lazy = false,
	},

	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	---@type Flash.Config
	-- 	opts = {},
	--  -- stylua: ignore
	--    keys = {
	--      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	--      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	--      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	--      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	--      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	--    },
	-- },

	-- {
	-- 	"okuuva/auto-save.nvim",
	-- 	cmd = "ASToggle", -- optional for lazy loading on command
	-- 	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	-- 	opts = {
	-- 		-- your config goes here
	-- 		-- or just leave it empty :)
	-- 	},
	-- },

	-- {
	-- 	"alexghergh/nvim-tmux-navigation",
	-- 	config = function()
	-- 		require("nvim-tmux-navigation").setup({
	-- 			disable_when_zoomed = true, -- defaults to false
	-- 			keybindings = {
	-- 				left = "<C-h>",
	-- 				down = "<C-j>",
	-- 				up = "<C-k>",
	-- 				right = "<C-l>",
	-- 				last_active = "<C-\\>",
	-- 				-- next = "<C-Space>",
	-- 			},
	-- 		})
	-- 	end,
	--    lazy = false,
	-- },
	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	cmd = {
	-- 		"TmuxNavigateLeft",
	-- 		"TmuxNavigateDown",
	-- 		"TmuxNavigateUp",
	-- 		"TmuxNavigateRight",
	-- 		"TmuxNavigatePrevious",
	-- 	},
	-- 	keys = {
	-- 		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
	-- 		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
	-- 		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
	-- 		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
	-- 		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	-- 	},
	--    lazy = false,
	-- },
	-- {
	-- 	"aserowy/tmux.nvim",
	-- 	config = function()
	-- 		return require("tmux").setup()
	-- 	end,
	--    lazy = false,
	-- },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
