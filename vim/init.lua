--[[
  Neovim Configuration
  Author: Dustin Martin <dm@dustinmartin.net>
  Based on kickstart.nvim
--]]

-- [[ Leader Key ]]
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'nosplit'
vim.opt.cursorline = true
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = ' ↪ '
vim.opt.hlsearch = true
vim.opt.gdefault = true
vim.opt.virtualedit = 'block'
vim.opt.foldlevelstart = 99
vim.opt.spelllang = 'en_us'
vim.opt.spellfile = vim.fn.expand('~/dotfiles/vim/custom-dictionary.utf-8.add')
vim.opt.shortmess:append('I')
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%m,%f:%l:%m'
vim.opt.iskeyword:append('-')
vim.opt.termguicolors = true

-- [[ Keymaps ]]

-- H / L — line start/end
vim.keymap.set('n', 'H', '^', { desc = 'Start of line' })
vim.keymap.set('n', 'L', '$', { desc = 'End of line' })
vim.keymap.set('v', 'H', '^', { desc = 'Start of line' })
vim.keymap.set('v', 'L', 'g_', { desc = 'End of line' })

-- kj / jj — escape from insert mode
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- j / k — screen line navigation
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { desc = 'Down (screen line)' })
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { desc = 'Up (screen line)' })

-- ; remapped to : (command mode)
vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = 'Command mode' })

-- Ctrl-e — toggle last two buffers
vim.keymap.set('n', '<C-e>', '<cmd>e#<CR>', { desc = 'Toggle last buffer' })
vim.keymap.set('i', '<C-e>', '<Esc><cmd>e#<CR>', { desc = 'Toggle last buffer' })

-- Y — yank to end of line
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Keep visual selection after indent
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Center screen on search results
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result (centered)' })

-- Change word under cursor and repeat with .
vim.keymap.set('n', 'c*', '*Ncgn', { desc = 'Change word (forward)' })
vim.keymap.set('n', 'c#', '#NcgN', { desc = 'Change word (backward)' })

-- Select current line contents
vim.keymap.set('n', 'vv', '^vg_', { desc = 'Select line contents' })

-- Make ' go to exact position
vim.keymap.set('n', "'", '`', { desc = 'Go to exact mark position' })

-- Disable accidental commands
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set('n', 'U', '<Nop>')
vim.keymap.set('v', 'U', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'zE', '<Nop>')

-- Leader mappings
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>e', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- Clear search on Esc (kickstart default)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic navigation (supplement 0.11 defaults)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics quickfix list' })

-- [[ Autocommands ]]

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Bootstrap lazy.nvim ]]
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

  -- Detect indentation automatically
  { 'tpope/vim-sleuth' },

  -- Git operations
  { 'tpope/vim-fugitive' },

  -- Tmux/Neovim pane navigation with Ctrl-hjkl
  { 'christoomey/vim-tmux-navigator' },

  -- Colorscheme
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

  -- Git signs in the gutter
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

  -- Which-key for key discovery
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

  -- Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>a', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Search git files' })
      vim.keymap.set('n', '<leader>sc', builtin.git_commits, { desc = 'Search git commits' })
      vim.keymap.set('n', '<leader>s/', builtin.current_buffer_fuzzy_find, { desc = 'Search in buffer' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search resume' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current word' })
    end,
  },

  -- LSP
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

          map('<leader>ld', require('telescope.builtin').lsp_definitions, 'Go to definition')
          map('<leader>lr', vim.lsp.buf.rename, 'Rename')
          map('<leader>la', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })
          map('<leader>lf', function() require('conform').format({ async = true, lsp_fallback = true }) end, 'Format')
          map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document symbols')

          -- Highlight references on cursor hold
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

      -- LSP capabilities (enhanced by blink.cmp)
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Servers to install and configure
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

  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable for languages without a well-defined style
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

  -- Completion
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

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Mini modules
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Statusline
      require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })

      -- Surround (replaces vim-surround)
      require('mini.surround').setup()

      -- Better text objects (around/inside)
      require('mini.ai').setup({ n_lines = 500 })

      -- Auto pairs
      require('mini.pairs').setup()
    end,
  },

  -- Treesitter (parsers + queries; highlighting/indent are built into Neovim 0.11)
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

  -- Auto close/rename HTML/JSX tags
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  -- Oil file explorer
  {
    'stevearc/oil.nvim',
    cmd = { 'Oil' },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
    },
  },

  -- Git status with fugitive leader bindings
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
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status' })
