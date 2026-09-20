-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.guifont = "JetBrainsMono Nerd Font:h13"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true -- Save undo history
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wrap = false -- Disable line wrap

-- make tab spacing 4 chars
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.neovide_refresh_rate = 60

vim.g.neovide_refresh_rate_idle = 5 -- Spart Akku, wenn du nichts tust
vim.g.neovide_vsync = false -- Testweise VSync deaktivieren

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    signs = true,
    underline = true,
})

if vim.g.neovide then
    vim.api.nvim_set_current_dir("C:\\Users\\digij")
end

-- Zooming in and out for Terminal Neovim via OSC escape codes
local function change_terminal_font_size(delta)
    local sign = delta > 0 and "+" or ""
    -- Send OSC 50 escape sequence to adjust font points
    io.stdout:write(string.format("\x1b]50;#%s%d\x07", sign, delta))
end

local function reset_terminal_font_size()
    -- Reset to base font size
    io.stdout:write("\x1b]50;#0\x07")
end

vim.keymap.set("n", "<C-9>", function()
    change_terminal_font_size(1)
end, { desc = "Terminal Font Size +1" })

vim.keymap.set("n", "<C-->", function()
    change_terminal_font_size(-1)
end, { desc = "Terminal Font Size -1" })

vim.keymap.set("n", "<C-0>", function()
    reset_terminal_font_size()
end, { desc = "Terminal Font Size Reset" })
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", {})
        vim.api.nvim_set_hl(0, "@lsp.type.keyword.java", {})
    end,
})

-- Attemt to make two coloschemes that dissables the blurr on toggle
-- Windows doens't allow that
vim.g.neovide_window_blurred = true

local setTransparent = function()
    if vim.g.neovide_opacity == 0.0 then
        vim.g.neovide_window_blurred = true
        vim.g.neovide_opacity = 0.8
        vim.cmd.colorscheme("rose-pine")
    else
        vim.g.neovide_opacity = 0.1
        vim.g.neovide_window_blurred = false
        vim.cmd.colorscheme("zaibatsu")
    end
    vim.cmd("redraw!")
end

if vim.g.neovide then
    vim.g.neovide_opacity = 0.8
    vim.keymap.set("n", "<F12>", function()
        setTransparent()
    end)
end

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50

-- vim.g.neovide_cursor_vfx_mode = "pixiedust" -- options: "railgun", "torpedo", "pixiedust", "sonicboom"

-- languages
vim.opt.spell = false
vim.opt.spelllang = { "en", "de", "fr" }
