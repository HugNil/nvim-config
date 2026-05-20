vim.opt.termguicolors = true

-- ============================================================================
-- PLUGINS
-- ============================================================================
vim.pack.add({
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://www.github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/EdenEast/nightfox.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/obsidian-nvim/obsidian.nvim",
})

--[[
local function set_transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end
--]]

vim.cmd.colorscheme("dayfox")
--set_transparent()

local function apply_soft_highlights()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	local bg = normal.bg or 0x101318
	local r = math.floor(bg / 0x10000) % 0x100
	local g = math.floor(bg / 0x100) % 0x100
	local b = bg % 0x100
	local is_dark = (r * 0.299 + g * 0.587 + b * 0.114) < 128

	local highlights = is_dark
			and {
				CursorLine = { bg = "#2a2f38" },
				CursorLineNr = { fg = "#f4a261", bg = "#2a2f38", bold = true },
				Visual = { bg = "#34495e" },
				Search = { fg = "#f4eadc", bg = "#5b4a2f" },
				IncSearch = { fg = "#101318", bg = "#f4a261" },
				CurSearch = { fg = "#101318", bg = "#f4a261" },
				MatchParen = { fg = "#f4eadc", bg = "#34495e", bold = true },
				NvimTreeCursorLine = { bg = "#2a2f38" },
				NvimTreeCursorLineNr = { fg = "#f4a261", bg = "#2a2f38", bold = true },
				NvimTreeIndentMarker = { fg = "#556070" },
			}
		or {
			CursorLine = { bg = "#ebe4dc" },
			CursorLineNr = { fg = "#b5693a", bg = "#ebe4dc", bold = true },
			Visual = { bg = "#d8e7f3" },
			Search = { fg = "#3d2b20", bg = "#f1d28a" },
			IncSearch = { fg = "#fff8f2", bg = "#b5693a" },
			CurSearch = { fg = "#fff8f2", bg = "#b5693a" },
			MatchParen = { fg = "#3d2b20", bg = "#d8e7f3", bold = true },
			NvimTreeCursorLine = { bg = "#ebe4dc" },
			NvimTreeCursorLineNr = { fg = "#b5693a", bg = "#ebe4dc", bold = true },
			NvimTreeIndentMarker = { fg = "#b8ada3" },
		}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

apply_soft_highlights()

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 2
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
vim.opt.autoread = true
vim.opt.autowrite = true

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "inclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.diffopt:append("linematch:60")
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- ============================================================================
-- STATUSLINE
-- ============================================================================

local cached_branch = ""
local last_check = 0

local function git_branch()
	local now = vim.loop.now()

	if now - last_check > 5000 then
		local handle = io.popen("git branch --show-current 2>nul")

		if handle then
			cached_branch = handle:read("*a"):gsub("%s+$", "")
			handle:close()
		else
			cached_branch = ""
		end

		last_check = now
	end

	if cached_branch ~= "" then
		return " 󰊢 " .. cached_branch .. " "
	end

	return ""
end

local function file_type()
	local ft = vim.bo.filetype

	if ft == "" then
		return " 󰈔 no ft "
	end

	return " 󰈔 " .. ft .. " "
end

local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))

	if size < 0 then
		return ""
	end

	if size < 1024 then
		return " 󰈙 " .. size .. "B "
	elseif size < 1024 * 1024 then
		return string.format(" 󰈙 %.1fK ", size / 1024)
	end

	return string.format(" 󰈙 %.1fM ", size / 1024 / 1024)
end

local function mode_icon()
	local mode = vim.fn.mode()

	local modes = {
		n = " 󰋜 NORMAL ",
		i = " 󰏫 INSERT ",
		v = " 󰈈 VISUAL ",
		V = " 󰈈 V-LINE ",
		["\22"] = " 󰈈 V-BLOCK ",
		c = " 󰞷 COMMAND ",
		R = " 󰛔 REPLACE ",
		r = " 󰛔 REPLACE ",
		t = " 󰆍 TERMINAL ",
	}

	return modes[mode] or (" 󰋜 " .. mode .. " ")
end

local function diagnostics()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

	local result = ""

	if errors > 0 then
		result = result .. "  " .. errors
	end
	if warnings > 0 then
		result = result .. "  " .. warnings
	end
	if hints > 0 then
		result = result .. " 󰌵 " .. hints
	end
	if info > 0 then
		result = result .. "  " .. info
	end

	if result == "" then
		return " ✓ "
	end

	return result .. " "
end

local function file_format()
	return " " .. vim.bo.fileformat .. " "
end

local function file_encoding()
	local enc = vim.bo.fileencoding

	if enc == "" then
		enc = vim.o.encoding
	end

	return " " .. enc .. " "
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.diagnostics_status = diagnostics
_G.file_format = file_format
_G.file_encoding = file_encoding

vim.cmd([[
	highlight StatusLineMode gui=bold cterm=bold
	highlight StatusLineSep gui=bold cterm=bold
]])

local function setup_dynamic_statusline()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "DiagnosticChanged" }, {
		callback = function()
			vim.opt_local.statusline = table.concat({
				"%#StatusLineMode#",
				"%{v:lua.mode_icon()}",
				"%#StatusLine#",
				" %f %h%m%r ",
				"%{v:lua.git_branch()}",
				"",
				"%{v:lua.file_type()}",
				"",
				"%{v:lua.file_size()}",
				"",
				"%{v:lua.file_encoding()}",
				"",
				"%{v:lua.file_format()}",
				"",
				"%{v:lua.diagnostics_status()}",
				"%=",
				" 󰩭 %l:%c ",
				" %p%% ",
			})
		end,
	})

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		callback = function()
			vim.opt_local.statusline = "  %f %h%m%r %= %l:%c  %p%% "
		end,
	})
end

setup_dynamic_statusline()

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

local function jump_to_function(backwards)
	local filetype = vim.bo.filetype
	local patterns = {
		python = { [[^\s*\%(async\s\+\)\?def\s\+]] },
		lua = { [[^\s*\%(local\s\+\)\?function\s\+]], [[^\s*\k\+\s*=\s*function\s*(]] },
		javascript = {
			[[^\s*\%(export\s\+\)\?\%(async\s\+\)\?function\s\+]],
			[[^\s*\%(export\s\+\)\?\%(const\|let\|var\)\s\+\k\+\s*=.*=>]],
		},
		javascriptreact = {
			[[^\s*\%(export\s\+\)\?\%(async\s\+\)\?function\s\+]],
			[[^\s*\%(export\s\+\)\?\%(const\|let\|var\)\s\+\k\+\s*=.*=>]],
		},
		typescript = {
			[[^\s*\%(export\s\+\)\?\%(async\s\+\)\?function\s\+]],
			[[^\s*\%(export\s\+\)\?\%(const\|let\|var\)\s\+\k\+\s*=.*=>]],
		},
		typescriptreact = {
			[[^\s*\%(export\s\+\)\?\%(async\s\+\)\?function\s\+]],
			[[^\s*\%(export\s\+\)\?\%(const\|let\|var\)\s\+\k\+\s*=.*=>]],
		},
	}

	local search_patterns = patterns[filetype] or {
		[[^\s*\%(async\s\+\)\?def\s\+]],
		[[^\s*\%(local\s\+\)\?function\s\+]],
		[[^\s*\%(export\s\+\)\?\%(async\s\+\)\?function\s\+]],
	}
	local flags = backwards and "bnW" or "nW"
	local current_line = vim.fn.line(".")
	local best_line

	for _, pattern in ipairs(search_patterns) do
		local pos = vim.fn.searchpos(pattern, flags)
		local line = pos[1]
		if line > 0 and line ~= current_line then
			if not best_line or (backwards and line > best_line) or (not backwards and line < best_line) then
				best_line = line
			end
		end
	end

	if best_line then
		vim.api.nvim_win_set_cursor(0, { best_line, 0 })
		vim.cmd("normal! zz")
	end
end

vim.keymap.set("n", "]m", function()
	jump_to_function(false)
end, { desc = "Next function" })

vim.keymap.set("n", "[m", function()
	jump_to_function(true)
end, { desc = "Previous function" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
	desc = "Exit terminal mode",
})

-- ============================================================================
-- AUTOCMDS
-- ============================================================================
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	group = augroup,
	callback = apply_soft_highlights,
})

vim.opt.splitright = true

local function clamp(value, min, max)
	return math.max(min, math.min(max, value))
end

local function calculate_layout_widths()
	local columns = vim.o.columns
	local tree_width = clamp(math.floor(columns * 0.16), 24, 36)
	local terminal_width = clamp(math.floor(columns * 0.28), 32, 64)
	local min_code_width = 60

	if columns < 120 then
		tree_width = clamp(math.floor(columns * 0.18), 22, 30)
		terminal_width = clamp(math.floor(columns * 0.25), 28, 42)
	end

	if columns < 90 then
		tree_width = clamp(math.floor(columns * 0.20), 20, 26)
		terminal_width = clamp(math.floor(columns * 0.22), 24, 34)
	end

	local overflow = tree_width + terminal_width + min_code_width - columns
	if overflow > 0 then
		local terminal_reduction = math.min(overflow, terminal_width - 24)
		terminal_width = terminal_width - terminal_reduction
		overflow = overflow - terminal_reduction
	end

	if overflow > 0 then
		local tree_reduction = math.min(overflow, tree_width - 20)
		tree_width = tree_width - tree_reduction
	end

	return {
		tree = tree_width,
		terminal = terminal_width,
	}
end

local function is_floating_win(win)
	return vim.api.nvim_win_get_config(win).relative ~= ""
end

local function is_tree_win(win)
	local buf = vim.api.nvim_win_get_buf(win)
	return vim.bo[buf].filetype == "NvimTree"
end

local function is_terminal_win(win)
	local buf = vim.api.nvim_win_get_buf(win)
	return vim.bo[buf].buftype == "terminal"
end

local function find_code_win()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if not is_floating_win(win) and not is_tree_win(win) and not is_terminal_win(win) then
			return win
		end
	end
end

local function resize_startup_layout()
	local widths = calculate_layout_widths()
	local code_wins = {}

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if not is_floating_win(win) and not is_tree_win(win) and not is_terminal_win(win) then
			table.insert(code_wins, win)
		end
	end

	local code_width = math.max(20, math.floor((vim.o.columns - widths.tree - widths.terminal) / math.max(#code_wins, 1)))

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if not is_floating_win(win) then
			if is_tree_win(win) then
				pcall(vim.api.nvim_win_set_width, win, widths.tree)
				vim.wo[win].winfixwidth = true
			elseif is_terminal_win(win) then
				pcall(vim.api.nvim_win_set_width, win, widths.terminal)
				vim.wo[win].winfixwidth = true
			else
				pcall(vim.api.nvim_win_set_width, win, code_width)
				vim.wo[win].winfixwidth = false
			end
		end
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()

			if vim.fn.argc() == 0 then
				vim.cmd("enew")
			end
			vim.wo.colorcolumn = "140"

			-- spara kodfönstret så filer från trädet öppnas här senare
			local main_win = vim.api.nvim_get_current_win()

			-- öppna tree
			require("nvim-tree.api").tree.open()

			-- tillbaka till kodfönstret
			vim.api.nvim_set_current_win(main_win)

			-- skapa en smal terminal längst till höger om kodfönstret
			vim.cmd("botright " .. calculate_layout_widths().terminal .. "vnew")
			vim.cmd("terminal")
			vim.cmd("setlocal winfixwidth")

			-- tillbaka till kodfönstret
			vim.api.nvim_set_current_win(main_win)
			resize_startup_layout()

		end)
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinClosed", "VimResized" }, {
	group = augroup,
	callback = function()
		vim.schedule(resize_startup_layout)
	end,
})

-- Autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = augroup,
	callback = function()
		local file = vim.fn.expand("%:p")
		if vim.bo.buftype == "" and vim.bo.modified and file ~= "" then
			local dir = vim.fn.fnamemodify(file, ":h")
			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p")
			end

			vim.cmd("silent write")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.py",
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.css",
		"*.scss",
		"*.html",
		"*.sh",
		"*.bash",
		"*.zsh",
	},
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end

		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)
		local row = last_pos[1]

		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================
local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)
			if lang and pcall(vim.treesitter.language.add, lang) then
				pcall(vim.treesitter.start, args.buf, lang)
			end
		end,
	})
end

setup_treesitter()

local function setup_obsidian()
	require("obsidian").setup({
		legacy_commands = false,

		workspaces = {
			{
				name = "Notes",
				path = "C:/Users/02hug/Notes",
			},
		},

		picker = {
			name = "fzf-lua",
		},

		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
		},

		notes_subdir = "notes",

		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
		},

		new_notes_location = "notes_subdir",
		link_style = "wiki",

		ui = {
			enable = true,
		},
	})

	vim.keymap.set("n", "<leader>nn", function()
		vim.cmd("Obsidian workspace Notes")
		vim.defer_fn(function()
			vim.cmd("Obsidian new")
		end, 300)
	end, { desc = "New note" })

	vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<CR>", { desc = "Find note" })
	vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian search<CR>", { desc = "Search notes" })
	vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian today<CR>", { desc = "Today's daily note" })
	vim.keymap.set("n", "<leader>nw", "<cmd>Obsidian workspace<CR>", { desc = "Switch workspace" })
	vim.keymap.set("n", "<leader>nb", "<cmd>Obsidian backlinks<CR>", { desc = "Show backlinks" })
	vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian links<CR>", { desc = "Show links" })
	vim.keymap.set("n", "<leader>no", "<cmd>Obsidian open<CR>", { desc = "Open in Obsidian app" })
end

setup_obsidian()

require("nvim-web-devicons").setup({
	default = true,
})

require("nvim-tree").setup({
	view = {
		width = function()
			return calculate_layout_widths().tree
		end,
		preserve_window_proportions = true,
	},
	filters = {
		dotfiles = false,
	},
	filesystem_watchers = {
		ignore_dirs = function(path)
			path = path:gsub("\\", "/"):lower()
			return path:find("/.codex/tmp/", 1, true)
				or path:find("/node_modules/", 1, true)
				or path:find("/target/", 1, true)
				or path:find("/vendor/", 1, true)
				or path:find("/build/", 1, true)
		end,
	},
	renderer = {
		group_empty = true,

		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = true,
					color = true,
				},
			},
		},
	},
	actions = {
		open_file = {
			resize_window = false,
			window_picker = {
				enable = true,
				picker = function()
					local code_win = find_code_win()
					if code_win and vim.api.nvim_win_is_valid(code_win) then
						return code_win
					end

					vim.cmd("rightbelow vnew")
					code_win = vim.api.nvim_get_current_win()
					vim.wo[code_win].colorcolumn = "140"
					resize_startup_layout()
					return code_win
				end,
				exclude = {
					buftype = { "terminal", "help", "nofile" },
					filetype = { "NvimTree", "notify", "qf" },
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

vim.api.nvim_create_autocmd("WinEnter", {
	group = augroup,
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.wo.number = true
			vim.wo.relativenumber = true
		end
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	group = augroup,
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.wo.number = false
			vim.wo.relativenumber = false
		end
	end,
})

vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow -g !.git"

require("fzf-lua").setup({
	defaults = {
		file_icons = "devicons",
		color_icons = true,
	},
	files = {
		cmd = "rg --files --hidden --follow -g !.git",
	},
})

local project_search_roots = vim.g.project_search_roots or {
	"~/Programmering",
	"~/source",
	"~/Documents",
	"~/Desktop",
}

local ignored_project_dirs = {
	[".cache"] = true,
	[".git"] = true,
	[".gradle"] = true,
	[".idea"] = true,
	[".venv"] = true,
	[".vscode"] = true,
	["node_modules"] = true,
	["target"] = true,
	["vendor"] = true,
}

local function normalize_dir(path)
	return vim.fs.normalize(vim.fn.fnamemodify(vim.fn.expand(path), ":p")):gsub("[/\\]$", "")
end

local function shorten_dir(path)
	local home = normalize_dir("~")
	if vim.startswith(path, home) then
		return "~" .. path:sub(#home + 1)
	end

	return path
end

local function find_git_projects()
	local uv = vim.uv or vim.loop
	local projects = {}
	local seen = {}
	local max_depth = 4

	local function add_project(path)
		path = normalize_dir(path)
		if not seen[path] then
			seen[path] = true
			table.insert(projects, path)
		end
	end

	local function scan(path, depth)
		if depth > max_depth or vim.fn.isdirectory(path) == 0 then
			return
		end

		local handle = uv.fs_scandir(path)
		if not handle then
			return
		end

		local dirs = {}
		while true do
			local name, kind = uv.fs_scandir_next(handle)
			if not name then
				break
			end

			if name == ".git" then
				add_project(path)
				return
			end

			if kind == "directory" and not ignored_project_dirs[name] then
				table.insert(dirs, path .. "/" .. name)
			end
		end

		for _, dir in ipairs(dirs) do
			scan(dir, depth + 1)
		end
	end

	for _, root in ipairs(project_search_roots) do
		scan(normalize_dir(root), 0)
	end

	table.sort(projects, function(a, b)
		local name_a = vim.fn.fnamemodify(a, ":t"):lower()
		local name_b = vim.fn.fnamemodify(b, ":t"):lower()
		if name_a == name_b then
			return a < b
		end

		return name_a < name_b
	end)

	return projects
end

local function switch_project(project_dir)
	vim.cmd("cd " .. vim.fn.fnameescape(project_dir))
	cached_branch = ""
	last_check = 0

	local ok, tree = pcall(require, "nvim-tree.api")
	if ok then
		tree.tree.change_root(project_dir)
		tree.tree.open()
	end

	local code_win = find_code_win()
	if code_win and vim.api.nvim_win_is_valid(code_win) then
		vim.api.nvim_set_current_win(code_win)
	end

	resize_startup_layout()
	vim.notify("Project: " .. shorten_dir(project_dir), vim.log.levels.INFO)

	require("fzf-lua").files({ cwd = project_dir })
end

local function pick_project()
	local projects = find_git_projects()
	if vim.tbl_isempty(projects) then
		vim.notify("No Git projects found. Edit project_search_roots in init.lua if your projects live elsewhere.", vim.log.levels.WARN)
		return
	end

	local project_by_entry = {}
	local entries = {}
	for _, project in ipairs(projects) do
		local entry = string.format("%s\t%s", vim.fn.fnamemodify(project, ":t"), shorten_dir(project))
		project_by_entry[entry] = project
		table.insert(entries, entry)
	end

	require("fzf-lua").fzf_exec(entries, {
		prompt = "Projects> ",
		actions = {
			["default"] = function(selected)
				local project_dir = project_by_entry[selected[1]]
				if project_dir then
					switch_project(project_dir)
				end
			end,
		},
	})
end

vim.api.nvim_create_user_command("Projects", pick_project, {
	desc = "Pick a project and switch Neovim to it",
})

vim.keymap.set("n", "<leader>fp", pick_project, { desc = "FZF Projects" })

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })

vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })

vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })

vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({})

require("gitsigns").setup({
	signs = {
		add = { text = "\u{2590}" },
		change = { text = "\u{2590}" },
		delete = { text = "\u{2590}" },
		topdelete = { text = "\u{25e6}" },
		changedelete = { text = "\u{25cf}" },
		untracked = { text = "\u{25cb}" },
	},
	signcolumn = true,
	current_line_blame = false,
})

require("mason").setup({})

vim.keymap.set("n", "]h", function()
	require("gitsigns").nav_hunk("next")
end, { desc = "Next git hunk" })

vim.keymap.set("n", "[h", function()
	require("gitsigns").nav_hunk("prev")
end, { desc = "Previous git hunk" })

vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })

vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })

vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })

vim.keymap.set("n", "<leader>hB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })

vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

-- ============================================================================
-- LSP, LINTING, FORMATTING & COMPLETION
-- ============================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>gd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "<leader>gS", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)

	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, opts)

	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<leader>fd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)

	vim.keymap.set("n", "<leader>fr", function()
		require("fzf-lua").lsp_references()
	end, opts)

	vim.keymap.set("n", "<leader>ft", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)

	vim.keymap.set("n", "<leader>fs", function()
		require("fzf-lua").lsp_document_symbols()
	end, opts)

	vim.keymap.set("n", "<leader>fw", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, opts)

	vim.keymap.set("n", "<leader>fi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})

			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,
	callback = lsp_on_attach,
})

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })

vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})

do
	local stylua = require("efmls-configs.formatters.stylua")

	-- local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	local prettier = require("efmls-configs.formatters.prettier")
	-- local eslint_d = require("efmls-configs.linters.eslint_d")

	-- local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	vim.lsp.config("efm", {
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				css = { prettier },
				html = { prettier },
				javascript = { prettier },
				javascriptreact = { prettier },
				lua = { stylua },
				markdown = { prettier },
				python = { black },
				sh = { shfmt },
				typescript = { prettier },
				typescriptreact = { prettier },
				vue = { prettier },
				svelte = { prettier },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"efm",
})

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================
vim.api.nvim_create_autocmd("TermClose", {
	group = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

local terminal_state = {
	buf = nil,
	win = nil,
	is_open = false,
}

local function FloatingTerminal()
	if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[terminal_state.buf].bufhidden = "hide"
	end

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.wo[terminal_state.win].winblend = 0
	vim.wo[terminal_state.win].winhighlight = "Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)

	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL") or os.getenv("COMSPEC") or "powershell")
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")

	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = terminal_state.buf,
		callback = function()
			if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
				vim.api.nvim_win_close(terminal_state.win, false)
				terminal_state.is_open = false
			end
		end,
		once = true,
	})
end

vim.keymap.set("n", "<leader>t", FloatingTerminal, {
	noremap = true,
	silent = true,
	desc = "Toggle floating terminal",
})

vim.keymap.set("t", "<Esc>", function()
	if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end, {
	noremap = true,
	silent = true,
	desc = "Close floating terminal",
})
