--[[
  Neovim Configuration
  Author: Dustin Martin <dm@dustinmartin.net>
  Based on kickstart.nvim
--]]

-- [[ Leader Key ]]

-- Sets the leader key to comma. Leader is a prefix key used to create custom shortcuts
-- (e.g., ,w to save). Default is backslash (\).
-- :h mapleader — https://neovim.io/doc/user/map.html#mapleader
vim.g.mapleader = ','

-- Local leader is used for filetype-specific mappings. Also set to comma here.
-- :h maplocalleader — https://neovim.io/doc/user/map.html#maplocalleader
vim.g.maplocalleader = ','

-- Custom flag used by plugins (mini.statusline, lazy.nvim UI) to decide whether
-- to render Nerd Font icons or fallback to unicode/emoji.
vim.g.have_nerd_font = true

-- [[ Options ]]

-- Show absolute line numbers in the gutter.
-- :h number — https://neovim.io/doc/user/options.html#'number'
vim.opt.number = true

-- Show relative line numbers (distance from cursor). Combined with `number`,
-- the current line shows the absolute number while other lines show relative distance.
-- Makes it easy to jump N lines with 5j, 12k, etc.
-- :h relativenumber — https://neovim.io/doc/user/options.html#'relativenumber'
vim.opt.relativenumber = true

-- Enable mouse support in all modes (normal, insert, visual, command).
-- Allows clicking to position cursor, scrolling, selecting text, resizing splits, etc.
-- :h mouse — https://neovim.io/doc/user/options.html#'mouse'
vim.opt.mouse = 'a'

-- Don't show the mode indicator (-- INSERT --, -- VISUAL --, etc.) in the command line,
-- since mini.statusline already shows it in the statusbar.
-- :h showmode — https://neovim.io/doc/user/options.html#'showmode'
vim.opt.showmode = false

-- Use the system clipboard for all yank/delete/put operations. Anything you
-- yank in Neovim can be pasted in other apps and vice versa.
-- :h clipboard — https://neovim.io/doc/user/options.html#'clipboard'
vim.opt.clipboard = 'unnamedplus'

-- Preserve indentation when wrapping long lines. Wrapped continuations are
-- visually indented to match the beginning of the line.
-- :h breakindent — https://neovim.io/doc/user/options.html#'breakindent'
vim.opt.breakindent = true

-- Persist undo history to disk so you can undo changes even after closing
-- and reopening a file. Stored in ~/.local/state/nvim/undo/.
-- :h undofile — https://neovim.io/doc/user/options.html#'undofile'
vim.opt.undofile = true

-- Make search patterns case-insensitive by default.
-- :h ignorecase — https://neovim.io/doc/user/options.html#'ignorecase'
vim.opt.ignorecase = true

-- Override ignorecase when the search pattern contains uppercase characters.
-- Searching "foo" matches "Foo", but searching "Foo" only matches "Foo".
-- :h smartcase — https://neovim.io/doc/user/options.html#'smartcase'
vim.opt.smartcase = true

-- Adjusts case of completion matches to match what you've typed so far.
-- E.g., typing "get" can complete to "getUser" preserving your casing style.
-- :h infercase — https://neovim.io/doc/user/options.html#'infercase'
vim.opt.infercase = true

-- Always show the sign column (gutter to the left of line numbers). Prevents
-- the editor from shifting text left/right when signs (git, diagnostics) appear/disappear.
-- :h signcolumn — https://neovim.io/doc/user/options.html#'signcolumn'
vim.opt.signcolumn = 'yes'

-- Time in ms before CursorHold event fires and swap file is written. Lower value (default
-- is 4000) means faster UI updates for things like LSP hover highlights and gitsigns.
-- :h updatetime — https://neovim.io/doc/user/options.html#'updatetime'
vim.opt.updatetime = 300

-- Time in ms to wait for a mapped key sequence to complete. E.g., if you have mappings
-- for ,w and ,wq, Neovim waits this long after pressing ,w to see if q follows.
-- Default is 1000. Lower = snappier single-key leader combos.
-- :h timeoutlen — https://neovim.io/doc/user/options.html#'timeoutlen'
vim.opt.timeoutlen = 500

-- Open new vertical splits to the right of the current window (default is left).
-- :h splitright — https://neovim.io/doc/user/options.html#'splitright'
vim.opt.splitright = true

-- Open new horizontal splits below the current window (default is above).
-- :h splitbelow — https://neovim.io/doc/user/options.html#'splitbelow'
vim.opt.splitbelow = true

-- Show live preview of :substitute and similar commands as you type, without
-- opening a split window. Changes are shown inline in the buffer.
-- :h inccommand — https://neovim.io/doc/user/options.html#'inccommand'
vim.opt.inccommand = 'nosplit'

-- Highlight the entire line where the cursor is. Makes it easier to find the cursor.
-- :h cursorline — https://neovim.io/doc/user/options.html#'cursorline'
vim.opt.cursorline = true

-- Keep at least 1 line visible above/below the cursor when scrolling vertically.
-- Prevents the cursor from touching the very top/bottom edge of the screen.
-- :h scrolloff — https://neovim.io/doc/user/options.html#'scrolloff'
vim.opt.scrolloff = 1

-- Keep at least 10 columns visible to the left/right of the cursor when scrolling
-- horizontally (only matters when wrap is off).
-- :h sidescrolloff — https://neovim.io/doc/user/options.html#'sidescrolloff'
vim.opt.sidescrolloff = 10

-- Disable line wrapping. Long lines extend off-screen and require horizontal scrolling.
-- :h wrap — https://neovim.io/doc/user/options.html#'wrap'
vim.opt.wrap = false

-- When wrap IS enabled (e.g., via the ,r toggle), break lines at word boundaries
-- instead of in the middle of words.
-- :h linebreak — https://neovim.io/doc/user/options.html#'linebreak'
vim.opt.linebreak = true

-- String shown at the start of wrapped continuation lines (when wrap is on).
-- :h showbreak — https://neovim.io/doc/user/options.html#'showbreak'
vim.opt.showbreak = ' ↪ '

-- Highlight all matches of the last search pattern. Use ,e or Esc to clear.
-- :h hlsearch — https://neovim.io/doc/user/options.html#'hlsearch'
vim.opt.hlsearch = true

-- Make :substitute replace all matches on a line by default (as if /g flag
-- were always set). Adding /g then toggles it back to first-match-only.
-- :h gdefault — https://neovim.io/doc/user/options.html#'gdefault'
vim.opt.gdefault = true

-- Allow the cursor to move to positions where there is no actual character
-- in visual block mode (Ctrl-v). Useful for rectangular selections/edits.
-- :h virtualedit — https://neovim.io/doc/user/options.html#'virtualedit'
vim.opt.virtualedit = 'block'

-- Use Treesitter's syntax tree to define fold regions for structured languages
-- like JavaScript and TSX. This makes fold commands such as za/zc/zo work on
-- functions, blocks, JSX, etc. instead of requiring manual folds.
-- :h foldmethod — https://neovim.io/doc/user/options.html#'foldmethod'
-- :h foldexpr — https://neovim.io/doc/user/options.html#'foldexpr'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Start with all folds open (99 = effectively no folding on open) even though
-- fold regions now exist. You can still close/toggle them on demand with zc/za,
-- or collapse everything with zM.
-- :h foldlevelstart — https://neovim.io/doc/user/options.html#'foldlevelstart'
vim.opt.foldlevelstart = 99

-- Set the language for spell checking to US English (activate with :set spell).
-- :h spelllang — https://neovim.io/doc/user/options.html#'spelllang'
vim.opt.spelllang = 'en_us'

-- Path to a custom dictionary file. Words added via `zg` in spell mode are saved here,
-- letting you sync your personal dictionary across machines via dotfiles.
-- :h spellfile — https://neovim.io/doc/user/options.html#'spellfile'
vim.opt.spellfile = vim.fn.expand('~/dotfiles/vim/custom-dictionary.utf-8.add')

-- Suppress the intro splash screen shown when starting Neovim without a file.
-- 'I' = don't give the intro message.
-- :h shortmess — https://neovim.io/doc/user/options.html#'shortmess'
vim.opt.shortmess:append('I')

-- Use ripgrep instead of the default grep for :grep commands. Ripgrep is much faster
-- and respects .gitignore. --vimgrep formats output for Vim's quickfix list.
-- :h grepprg — https://neovim.io/doc/user/options.html#'grepprg'
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'

-- Format string that tells Neovim how to parse ripgrep output into filename:line:message.
-- :h grepformat — https://neovim.io/doc/user/options.html#'grepformat'
vim.opt.grepformat = '%f:%l:%m,%f:%l:%m'

-- Treat hyphens (-) as part of a word. Affects word motions (w, b, e), double-click
-- selection, and * search. E.g., "my-variable" is treated as one word.
-- :h iskeyword — https://neovim.io/doc/user/options.html#'iskeyword'
vim.opt.iskeyword:append('-')

-- Enable 24-bit RGB color in the terminal. Required for modern colorschemes
-- like Catppuccin to display correctly.
-- :h termguicolors — https://neovim.io/doc/user/options.html#'termguicolors'
vim.opt.termguicolors = true

-- Render the top tabline using the immediate parent directory plus filename for
-- the active buffer in each tab (for example: `src/init.lua`). This avoids
-- Neovim's default shortened labels, which can be hard to read when several
-- similarly named files are open.
local function escape_tab_label(text)
  return text:gsub('%%', '%%%%')
end

local function buffer_label(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local buftype = vim.bo[bufnr].buftype
  local filetype = vim.bo[bufnr].filetype

  if name == '' then
    if buftype == 'quickfix' then
      return '[Quickfix]'
    end
    if filetype ~= '' then
      return '[' .. filetype .. ']'
    end
    return '[No Name]'
  end

  if buftype == 'terminal' then
    local terminal_name = vim.fn.fnamemodify(name, ':t')
    return terminal_name ~= '' and terminal_name or '[Terminal]'
  end

  local filename = vim.fn.fnamemodify(name, ':t')
  local parent = vim.fn.fnamemodify(name, ':h:t')

  if parent == '' or parent == '.' or parent == '/' then
    return filename
  end

  return parent .. '/' .. filename
end

local function tab_label(tabnr)
  local winnr = vim.fn.tabpagewinnr(tabnr)
  local bufnr = vim.fn.tabpagebuflist(tabnr)[winnr]
  return buffer_label(bufnr)
end

function _G.dotfiles_tabline()
  local parts = {}
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr('$')

  for tabnr = 1, last_tab do
    local highlight = tabnr == current_tab and '%#TabLineSel#' or '%#TabLine#'
    parts[#parts + 1] = highlight
    parts[#parts + 1] = '%' .. tabnr .. 'T'
    parts[#parts + 1] = ' '
    parts[#parts + 1] = escape_tab_label(tab_label(tabnr))
    parts[#parts + 1] = ' '
  end

  parts[#parts + 1] = '%#TabLineFill#%T'
  return table.concat(parts)
end

vim.opt.tabline = '%!v:lua.dotfiles_tabline()'

-- [[ Keymaps ]]
-- :h vim.keymap.set() — https://neovim.io/doc/user/lua.html#vim.keymap.set()

-- Remap H/L to jump to the start/end of the line instead of their defaults
-- (top/bottom of screen). ^ goes to first non-blank char, $ to end, g_ to last
-- non-blank char (used in visual mode to avoid selecting the trailing newline).
vim.keymap.set('n', 'H', '^', { desc = 'Start of line' })
vim.keymap.set('n', 'L', '$', { desc = 'End of line' })
vim.keymap.set('v', 'H', '^', { desc = 'Start of line' })
vim.keymap.set('v', 'L', 'g_', { desc = 'End of line' })

-- Type "kj" or "jj" quickly to exit insert mode instead of reaching for Escape.
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- Use gj/gk for j/k so that navigation moves by screen lines (visual lines)
-- instead of file lines. Matters when long lines are wrapped.
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { desc = 'Down (screen line)' })
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { desc = 'Up (screen line)' })

-- Press ; to enter command mode instead of : (one less keypress — no shift needed).
-- The default ; (repeat last f/t motion) is sacrificed.
vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = 'Command mode' })

-- Ctrl-e switches between the current buffer and the last-edited buffer (like alt-tab).
-- Works from both normal and insert mode.
vim.keymap.set('n', '<C-e>', '<cmd>e#<CR>', { desc = 'Toggle last buffer' })
vim.keymap.set('i', '<C-e>', '<Esc><cmd>e#<CR>', { desc = 'Toggle last buffer' })

-- Make Y yank from cursor to end of line, consistent with how D deletes to end
-- and C changes to end. Default Y yanks the entire line (same as yy).
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- After indenting a visual selection with < or >, re-select the same text so
-- you can keep indenting without re-selecting.
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- After jumping to the next/prev search match, center the screen (zz) and open
-- just enough folds (zv) to make the match visible.
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result (centered)' })

-- c* searches forward for the word under the cursor, jumps back (N), then enters
-- change mode using cgn. After changing and pressing Esc, you can press . to repeat
-- the change on the next occurrence. c# does the same but searches backward.
-- :h gn — https://neovim.io/doc/user/pattern.html#gn
vim.keymap.set('n', 'c*', '*Ncgn', { desc = 'Change word (forward)' })
vim.keymap.set('n', 'c#', '#NcgN', { desc = 'Change word (backward)' })

-- Quickly select the contents of the current line (excluding leading/trailing whitespace).
-- ^ jumps to first non-blank, v enters visual, g_ selects to last non-blank.
vim.keymap.set('n', 'vv', '^vg_', { desc = 'Select line contents' })

-- By default ' jumps to the line of a mark but not the column. This remaps ' to `
-- so it always jumps to the exact line AND column of a mark.
-- :h mark-motions — https://neovim.io/doc/user/motion.html#mark-motions
vim.keymap.set('n', "'", '`', { desc = 'Go to exact mark position' })

-- Disable keys that are easy to hit accidentally:
-- Q enters Ex mode (rarely wanted), U is undo-line (confusing, not the same as u),
-- zE removes all folds in the file.
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set('n', 'U', '<Nop>')
vim.keymap.set('v', 'U', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'zE', '<Nop>')

-- Leader mappings for common actions:
-- ,w saves the file, ,e clears search highlighting, ,d closes the current buffer.
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>e', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- Creates a :Wrap command that toggles word wrap for the current buffer,
-- and maps ,r to invoke it.
vim.api.nvim_create_user_command('Wrap', 'setlocal wrap! linebreak nolist', {})
vim.keymap.set('n', '<leader>r', '<cmd>Wrap<CR>', { desc = 'Toggle word wrap' })

-- Pressing Escape in normal mode clears search highlighting (same as ,e above,
-- but more convenient).
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Opens all diagnostics (errors, warnings, etc.) for the current buffer in the
-- location list window so you can navigate through them with :lnext / :lprev.
-- :h vim.diagnostic.setloclist() — https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.setloclist()
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics quickfix list' })

-- [[ Autocommands ]]
-- :h autocmd — https://neovim.io/doc/user/autocmd.html

-- Briefly highlight the region of text that was just yanked (copied). Provides
-- visual feedback so you can confirm what was yanked.
-- :h vim.hl.on_yank() — https://neovim.io/doc/user/lua.html#vim.hl.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Fast file picker helpers ]]
-- Prefer the nearest project/package root instead of always searching the full
-- monorepo. This keeps file pickers much faster when working inside a subproject.
local picker_root_markers = {
  'pnpm-workspace.yaml',
  'turbo.json',
  'nx.json',
  'lerna.json',
  'package.json',
  'go.work',
  'Cargo.toml',
  'pyproject.toml',
  '.git',
}

local picker_excludes = {
  '.git',
  'node_modules',
  'dist',
  'build',
  'coverage',
  '.next',
  '.nuxt',
  '.turbo',
  '.cache',
}

local function find_picker_root()
  local bufname = vim.api.nvim_buf_get_name(0)
  local start = bufname ~= '' and vim.fs.dirname(bufname) or vim.fn.getcwd()
  local cwd = vim.fn.getcwd()

  local function search(path)
    if not path or path == '' then
      return nil
    end

    local match = vim.fs.find(picker_root_markers, { path = path, upward = true })[1]
    if match then
      return vim.fs.dirname(match)
    end
  end

  return search(start) or search(cwd) or start or cwd
end

local function build_fd_command()
  if vim.fn.executable('fd') ~= 1 then
    return nil
  end

  local cmd = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--hidden', '--follow' }
  for _, exclude in ipairs(picker_excludes) do
    table.insert(cmd, '--exclude')
    table.insert(cmd, exclude)
  end

  return table.concat(cmd, ' ')
end

local function build_rg_files_command()
  if vim.fn.executable('rg') ~= 1 then
    return nil
  end

  local cmd = { 'rg', '--files', '--hidden', '--follow' }
  for _, exclude in ipairs(picker_excludes) do
    table.insert(cmd, '-g')
    table.insert(cmd, string.format('"!%s"', exclude))
    table.insert(cmd, '-g')
    table.insert(cmd, string.format('"!%s/**"', exclude))
  end

  return table.concat(cmd, ' ')
end

local function fast_files_command()
  return build_fd_command() or build_rg_files_command()
end

local function in_git_repo(path)
  vim.fn.system({ 'git', '-C', path, 'rev-parse', '--is-inside-work-tree' })
  return vim.v.shell_error == 0
end

local function open_project_files()
  local fzf = require('fzf-lua')
  local opts = {
    cwd = find_picker_root(),
  }

  local cmd = fast_files_command()
  if cmd then
    opts.cmd = cmd
  end

  fzf.files(opts)
end

local function open_project_git_files()
  local root = find_picker_root()
  if not in_git_repo(root) then
    return open_project_files()
  end

  require('fzf-lua').files({
    cwd = root,
    cmd = 'git ls-files --cached --others --exclude-standard',
  })
end

-- [[ Bootstrap lazy.nvim ]]
-- lazy.nvim is a plugin manager for Neovim. This block auto-installs it on first
-- run by cloning the repo into the Neovim data directory (~/.local/share/nvim/lazy/),
-- then prepends it to the runtime path so require('lazy') works below.
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]
require('lazy').setup({

  -- Automatically detects the indentation style (tabs vs spaces, width) of the
  -- file you open and adjusts shiftwidth/expandtab to match. No configuration needed.
  -- https://github.com/tpope/vim-sleuth
  { 'tpope/vim-sleuth' },

  -- Full Git wrapper for Neovim. Provides :Git (or :G) to run any git command
  -- from within the editor — status, commit, diff, blame, log, etc. The :Git
  -- status window lets you stage/unstage files interactively.
  -- https://github.com/tpope/vim-fugitive
  { 'tpope/vim-fugitive' },

  -- Seamless navigation between tmux panes and Neovim splits using Ctrl-h/j/k/l.
  -- Without this, Ctrl-h/j/k/l only works within Neovim; this plugin makes the
  -- same keys also move into adjacent tmux panes. Requires a matching tmux plugin.
  -- https://github.com/christoomey/vim-tmux-navigator
  { 'christoomey/vim-tmux-navigator' },

  -- Catppuccin colorscheme — a warm, pastel theme. "mocha" is the dark variant.
  -- priority = 1000 ensures it loads before other plugins so colors are available.
  -- init runs before the plugin loads to set it as the active colorscheme.
  -- https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
    },
    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  -- Shows git status indicators in the sign column (gutter) next to line numbers.
  -- + = added line, ~ = changed line, _ = deleted line below, ‾ = deleted line above.
  -- on_attach sets up buffer-local keymaps when gitsigns activates:
  --   ,gb = show who last changed this line (blame)
  --   ,gd = diff the current file against the index
  --   ]h / [h = jump to next/previous changed hunk
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { buffer = bufnr, desc = 'Git blame line' })
        vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { buffer = bufnr, desc = 'Git diff' })
        vim.keymap.set('n', ']h', gitsigns.next_hunk, { buffer = bufnr, desc = 'Next git hunk' })
        vim.keymap.set('n', '[h', gitsigns.prev_hunk, { buffer = bufnr, desc = 'Prev git hunk' })
      end,
    },
  },

  -- Displays a popup showing available keybindings as you type a prefix (e.g.,
  -- pressing , shows all leader mappings). The `spec` groups related mappings
  -- under labeled headings in the popup (LSP, Search, Git).
  -- https://github.com/folke/which-key.nvim
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      spec = {
        { '<leader>l', group = 'LSP' },
        { '<leader>s', group = 'Search' },
        { '<leader>g', group = 'Git' },
      },
    },
  },

  -- Fast fuzzy finder optimized for large repos/monorepos. Uses external tools
  -- like fd/rg/git ls-files for candidate generation and keeps file previews
  -- hidden by default to reduce picker overhead. This is the primary picker UI
  -- for files, grep, buffers, help, diagnostics, git history, and LSP symbols.
  -- Keymaps:
  --   ,f = fast project files (nearest project/package root)
  --   ,a = live grep   ,b = buffers   ,sh = help tags
  --   ,sg = fast git-aware project files   ,sc = git commits
  --   ,s/ = fuzzy search current buffer    ,sd = workspace diagnostics
  --   ,sr = resume last picker             ,sw = grep word under cursor
  -- https://github.com/ibhagwan/fzf-lua
  {
    'ibhagwan/fzf-lua',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local fzf = require('fzf-lua')

      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            hidden = 'hidden',
          },
        },
        files = {
          cwd_prompt = false,
        },
      })

      pcall(fzf.register_ui_select)

      vim.keymap.set('n', '<leader>f', open_project_files, { desc = 'Fast project files' })
      vim.keymap.set('n', '<leader>a', fzf.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>sg', open_project_git_files, { desc = 'Fast git project files' })
      vim.keymap.set('n', '<leader>sc', fzf.git_commits, { desc = 'Search git commits' })
      vim.keymap.set('n', '<leader>s/', fzf.blines, { desc = 'Search in buffer' })
      vim.keymap.set('n', '<leader>sd', fzf.diagnostics_workspace, { desc = 'Search diagnostics' })
      vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Search resume' })
      vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'Search current word' })
    end,
  },

  -- LSP (Language Server Protocol) — provides IDE features like go-to-definition,
  -- rename, code actions, and diagnostics by communicating with language servers.
  -- Dependencies:
  --   mason.nvim — portable package manager that installs LSP servers, linters, etc.
  --   mason-lspconfig.nvim — bridges Mason and lspconfig so servers auto-install
  -- When an LSP attaches to a buffer, these keymaps become available:
  --   ,ld = go to definition   ,lr = rename symbol   ,la = code action
  --   ,lf = format file        ,ls = document symbols
  -- Also highlights all references to the symbol under the cursor when you pause
  -- (CursorHold), and clears them when you move.
  -- Configured servers:
  --   ts_ls — TypeScript/JavaScript
  --   lua_ls — Lua (configured for Neovim's runtime so it understands `vim.*`)
  -- https://github.com/neovim/nvim-lspconfig
  -- https://github.com/mason-org/mason.nvim
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>ld', require('fzf-lua').lsp_definitions, 'Go to definition')
          map('<leader>lr', vim.lsp.buf.rename, 'Rename')
          map('<leader>la', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })
          map('<leader>lf', function() require('conform').format({ async = true, lsp_fallback = true }) end, 'Format')
          map('<leader>ls', require('fzf-lua').lsp_document_symbols, 'Document symbols')

          -- When the cursor rests on a symbol, highlight all other references to it
          -- in the buffer. Clears when the cursor moves. Only activates if the LSP
          -- server supports the documentHighlight capability.
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
              end,
            })
          end
        end,
      })

      -- Merges blink.cmp's enhanced completion capabilities into the LSP client
      -- so the completion engine can advertise snippet support, etc. to servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Table of LSP servers to install and configure. Keys are server names
      -- (matching lspconfig names), values are server-specific settings.
      local servers = {
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
              completion = { callSnippet = 'Replace' },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Mason-lspconfig ensures the servers listed above are installed, and
      -- the handler function configures each one with the merged capabilities.
      require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },

  -- Automatic code formatting on save. Runs external formatters (like prettier
  -- or stylua) before writing the buffer. Falls back to LSP formatting if no
  -- dedicated formatter is configured. Skips C/C++ since they lack a single
  -- dominant style. `stop_after_first = true` means use prettierd if available,
  -- otherwise fall back to prettier.
  -- Run :ConformInfo to see which formatter is active for the current file.
  -- https://github.com/stevearc/conform.nvim
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { timeout_ms = 2500, lsp_fallback = true }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

  -- Fast, Lua-based autocompletion engine. Shows a popup menu as you type with
  -- suggestions from LSP, file paths, snippets (from friendly-snippets), and
  -- words in the current buffer. signature = enabled shows function parameter
  -- hints as you type arguments. Uses default keybindings (Tab/Shift-Tab to
  -- navigate, Enter to confirm, Ctrl-Space to trigger).
  -- https://github.com/saghen/blink.cmp
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true },
    },
  },

  -- Highlights TODO, FIXME, HACK, NOTE, etc. comments in your code with distinct
  -- colors and makes them searchable via :TodoTelescope or :TodoQuickFix.
  -- signs = false disables sign column icons, keeping just the inline highlight.
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- mini.nvim — a collection of small, independent Lua modules. Only the ones
  -- explicitly set up below are activated:
  -- https://github.com/echasnovski/mini.nvim
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Minimal statusline at the bottom of the screen showing mode, filename,
      -- file progress, diagnostics, etc. Uses Nerd Font icons if available.
      -- Override just the filename section so it matches the tabline's
      -- `parent/file` format.
      -- https://github.com/echasnovski/mini.statusline
      local statusline = require('mini.statusline')
      statusline.setup({
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 75 })
            local diff = statusline.section_diff({ trunc_width = 75 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local lsp = statusline.section_lsp({ trunc_width = 75 })
            local filename = buffer_label(vim.api.nvim_get_current_buf())
            local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = statusline.section_location({ trunc_width = 75 })
            local search = statusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            })
          end,
          inactive = function()
            local filename = buffer_label(vim.api.nvim_get_current_buf())
            return statusline.combine_groups({
              '%<',
              { hl = 'MiniStatuslineInactive', strings = { filename } },
            })
          end,
        },
      })

      -- Add/delete/change surrounding pairs (brackets, quotes, tags, etc.).
      -- sa = add surround, sd = delete surround, sr = replace surround.
      -- E.g., saiw" adds quotes around a word; sd" removes surrounding quotes.
      -- https://github.com/echasnovski/mini.surround
      require('mini.surround').setup()

      -- Enhanced text objects for "around" (a) and "inside" (i) selections.
      -- Adds smarter handling of function arguments, brackets, quotes, and more.
      -- n_lines = 500 means it searches up to 500 lines to find matching pairs.
      -- https://github.com/echasnovski/mini.ai
      require('mini.ai').setup({ n_lines = 500 })

      -- Automatically inserts closing brackets, quotes, etc. when you type an
      -- opening one. Also handles backspace to delete pairs together.
      -- https://github.com/echasnovski/mini.pairs
      require('mini.pairs').setup()
    end,
  },

  -- Treesitter provides fast, accurate syntax parsing for highlighting, indentation,
  -- and code navigation. This plugin manages parser installation. The actual
  -- highlighting/indent features are built into Neovim 0.11+. ensure_installed
  -- lists the language parsers to auto-download. build = ':TSUpdate' keeps
  -- parsers up to date when the plugin updates.
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter',
    opts = {
      ensure_installed = {
        'bash', 'c', 'css', 'diff', 'fish', 'html', 'javascript',
        'json', 'lua', 'luadoc', 'markdown', 'markdown_inline',
        'query', 'regex', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
      },
    },
  },

  -- Uses Treesitter to automatically close and rename HTML/JSX tags. When you
  -- type <div>, it auto-inserts </div>. When you rename <div> to <span>, the
  -- closing tag updates to </span> automatically.
  -- https://github.com/windwp/nvim-ts-autotag
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  -- File explorer that opens the parent directory as an editable buffer. You can
  -- rename, delete, and create files by editing the buffer and saving.
  -- Press - to open Oil in the current file's parent directory.
  -- show_hidden = true displays dotfiles.
  -- https://github.com/stevearc/oil.nvim
  {
    'stevearc/oil.nvim',
    cmd = { 'Oil' },
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
      })

      -- vim-tmux-navigator's global <C-h/j/k/l> maps get overridden by Oil's
      -- own <C-h> binding inside Oil buffers. Set buffer-local maps to restore
      -- tmux pane navigation when inside an Oil buffer.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function(event)
          vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>',  { buffer = event.buf, desc = 'Navigate left' })
          vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>',  { buffer = event.buf, desc = 'Navigate down' })
          vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>',    { buffer = event.buf, desc = 'Navigate up' })
          vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { buffer = event.buf, desc = 'Navigate right' })
        end,
      })
    end,
    keys = {
      { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
    },
  },

-- The second argument to lazy.setup() configures the lazy.nvim UI itself.
-- When Nerd Fonts are available (have_nerd_font = true), it uses the default
-- Nerd Font icons. Otherwise, falls back to unicode/emoji icons.
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- [[ Git leader mappings (fugitive) ]]
-- ,gs opens the fugitive Git status window where you can stage (s), unstage (u),
-- and commit (cc) files interactively.
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status' })
