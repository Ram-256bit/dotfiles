require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "open LazyGit" })

-- Tmux and vim navigator
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")
map("n", "<leader>ca", "<cmd>CompetiTest add_testcase<cr>")
map("n", "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>")

-- ref: https://www.reddit.com/r/neovim/comments/xfcf26/comment/iolvibh
-- map("n", "<leader>r", ":w | sp | term gcc % -o %< && %< <cr>", { desc = "Run C program"})
-- map("n", "<leader>r", ":w | sp | term javac %  %< && %< <cr> i", { desc = "Run Java program"})
-- map("n", "<leader>r", ":w | vsp | term rustc % -lm -o %< && ./%< <cr> i")
map("n", "<leader>r", ":w | vsp | term cargo run<cr> i")
-- map("n", "<leader>a", ":q <cr>")
map("i", "kj", "<Esc>")
-- map("n", "kj", "<Esc>")
-- map("v", "kj", "<Esc>")
-- map("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
map("n", "<leader>u", vim.cmd.UndotreeToggle)
-- map("n", "<leader>fm", ":LspStart <cr> :w <cr> :LspStop<cr>")

-- ---@type MappingsTable
-- local M = {}
--
-- M.general = {
-- 	n = {
-- 		[";"] = { ":", "enter command mode", opts = { nowait = true } },
--
-- 		--  format with conform
-- 		["<leader>fm"] = {
-- 			function()
-- 				require("conform").format()
-- 			end,
-- 			"formatting",
-- 		},
-- 		["<leader>gg"] = { ":LazyGit<CR>", "open LazyGit" },
-- 		-- ["<leader>ca"] = {":CompetiTest add_testcase","Add Competitest test case"},
-- 		-- ["<leader>ce"] = {":CompetiTest edit_testcase"}
-- 	},
-- v = {
-- 		[">"] = { ">gv", "indent" },
-- 	},
-- }
--
-- -- more keybinds!
--
-- return M
