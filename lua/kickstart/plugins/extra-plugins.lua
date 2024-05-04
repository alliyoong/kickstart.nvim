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

  -- Enhanced f/t motions for Leap
  {
    'ggandor/flit.nvim',
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },

  -- breadcrumbs
  -- {
  --   "LunarVim/breadcrumbs.nvim",
  --   config = function()
  --     require("breadcrumbs").setup()
  --   end,
  -- },
  -- Simple winbar/statusline plugin that shows your current code context
  -- {
  --   "SmiteshP/nvim-navic",
  --   config = function()
  --     local icons = require("config.icons")
  --     require("nvim-navic").setup({
  --       highlight = true,
  --       lsp = {
  --         auto_attach = true,
  --         preference = { "typescript-tools" },
  --       },
  --       click = true,
  --       separator = " " .. icons.ui.ChevronRight .. " ",
  --       depth_limit = 0,
  --       depth_limit_indicator = "..",
  --       icons = {
  --         File = " ",
  --         Module = " ",
  --         Namespace = " ",
  --         Package = " ",
  --         Class = " ",
  --         Method = " ",
  --         Property = " ",
  --         Field = " ",
  --         Constructor = " ",
  --         Enum = " ",
  --         Interface = " ",
  --         Function = " ",
  --         Variable = " ",
  --         Constant = " ",
  --         String = " ",
  --         Number = " ",
  --         Boolean = " ",
  --         Array = " ",
  --         Object = " ",
  --         Key = " ",
  --         Null = " ",
  --         EnumMember = " ",
  --         Struct = " ",
  --         Event = " ",
  --         Operator = " ",
  --         TypeParameter = " ",
  --       },
  --     })
  --   end,
  -- },

  {
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
}
