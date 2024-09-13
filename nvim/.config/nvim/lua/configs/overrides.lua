local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"terraform",
		"python",
		"java",
		"hyprlang",
		-- "yaml",
	},
	indent = {
		enable = true,
		-- disable = {
		-- 	-- "python"
		-- },
	},
	-- highlight = {
	-- 	-- enable = true, -- false will disable the whole extension
	-- 	-- disable = { "yaml"}, -- list of language that will be disabled
	-- },
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		--my custom stuff
		"jdtls", -- for java
		"bash-language-server", -- for "bashls",
		"terraform-ls", -- for "terraformls",
		"yaml-language-server", -- for "yamlls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}
M.telescope = {
	file_ignore_patterns = {
		"node_modules/.*",
		"yarn.lock",
		"package-lock.json",
		"lazy-lock.json",
		"init.sql",
		"target/.*",
		".git/.*",
	},
}

return M
