return {

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  -- delete buffer
  {
    'famiu/bufdelete.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 'Q', ":lua require('bufdelete').bufdelete(0, false)<cr>", { noremap = true, silent = true, desc = 'Delete buffer' })
    end,
  },

  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { 'joosepalviste/nvim-ts-context-commentstring', lazy = true },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    'stevearc/dressing.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
    config = function()
      require('dressing').setup()
    end,
  },

  -- Neovim notifications and LSP progress messages
  {
    'j-hui/fidget.nvim',
    branch = 'legacy',
    enabled = false,
    config = function()
      require('fidget').setup {
        window = { blend = 0 },
      }
    end,
  },
  -- Multi cursor
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },

  -- Smooth scrolling neovim plugin written in lua
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {
        stop_eof = true,
        easing_function = 'sine',
        hide_cursor = true,
        cursor_scrolls_alone = true,
      }
    end,
  },

  -- Pop up cmd line
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },

  -- find and replace
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  -- Heuristically set buffer options
  {
    'tpope/vim-sleuth',
  },

  -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup {
        library = { plugins = { 'neotest' }, types = true },
      }
    end,
  },

  -- Lorem Ipsum generator for Neovim
  {
    'derektata/lorem.nvim',
    enabled = false,
    config = function()
      local lorem = require 'lorem'
      lorem.setup {
        sentenceLength = 'mixedShort',
        comma = 1,
      }
    end,
  },

  -- Indent guide for Neovim
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    enabled = false,
    version = '2.1.0',
    opts = {
      char = '┊',
      -- char = "│",
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- editor config support
  {
    'editorconfig/editorconfig-vim',
  },

  { -- for the UI
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require('barbecue').setup {
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      }

      vim.api.nvim_create_autocmd({
        'WinScrolled', -- or WinResized on NVIM-v0.9 and higher
        'BufWinEnter',
        'CursorHold',
        'InsertLeave',

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup('barbecue.updater', {}),
        callback = function()
          require('barbecue.ui').update()
        end,
      })
    end,
  },
  -- persist sessions
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {},
  },

  -- better code annotation
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local neogen = require 'neogen'

      neogen.setup {
        snippet_engine = 'luasnip',
      }
    end,
    -- version = "*"
  },

  {
    'ThePrimeagen/refactoring.nvim',
    enabled = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('refactoring').setup {}
    end,
  },

  -- vim wiki for text note
  {
    'vimwiki/vimwiki',
  },
}
