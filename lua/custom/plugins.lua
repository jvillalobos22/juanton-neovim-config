return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for icons
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'solarized_dark',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { {
            'filename',
            file_status = true,
            path = 0,
          } },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' ',
              },
            },
            'encoding',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { {
            'filename',
            file_status = true,
            path = 1,
          } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'fugitive' },
      }
    end,
  },
  -- AI-powered completion with inline ghost text (works alongside blink.cmp)
  {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<Tab>', -- Accept full AI suggestion (only when ghost text visible)
          clear_suggestion = '<C-]>', -- Clear/reject the suggestion
          accept_word = '<C-j>', -- Accept just the next word
        },
        ignore_filetypes = { -- Don't trigger in these filetypes
          -- cpp = true,
        },
        color = {
          suggestion_color = '#6c7086', -- Ghost text color (Catppuccin overlay0)
          cterm = 244,
        },
        log_level = 'info', -- Set to "off" to disable logging
        disable_inline_completion = false, -- Disable to stop ghost text from appearing
        disable_keymaps = false, -- Set to true to disable built-in keymaps
      }
      -- Toggle Supermaven AI completion
      vim.keymap.set('n', '<leader>smt', '<cmd>SupermavenToggle<CR>', { desc = '[S]uper[m]aven [T]oggle' })
    end,
  },
  -- COMMENTED OUT: nvim-cmp conflicts with blink.cmp (active in init.lua)
  -- To re-enable: uncomment this block and comment out blink.cmp in init.lua
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter', -- Load when entering insert mode
  --   dependencies = {
  --     'hrsh7th/cmp-nvim-lsp', -- LSP completion source
  --     'hrsh7th/cmp-buffer', -- Buffer completion source
  --     'L3MON4D3/LuaSnip', -- Snippet engine
  --     'onsails/lspkind.nvim', -- VS Code-like pictograms
  --   },
  --   config = function()
  --     local cmp = require 'cmp'
  --     local lspkind = require 'lspkind'
  --
  --     cmp.setup {
  --       snippet = {
  --         expand = function(args)
  --           require('luasnip').lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert {
  --         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --         ['<C-Space>'] = cmp.mapping.complete(),
  --         ['<C-e>'] = cmp.mapping.close(),
  --         ['<CR>'] = cmp.mapping.confirm {
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         },
  --       },
  --       sources = cmp.config.sources {
  --         { name = 'nvim_lsp' },
  --         { name = 'buffer' },
  --       },
  --       formatting = {
  --         format = lspkind.cmp_format { with_text = false, maxwidth = 50 },
  --       },
  --     }
  --
  --     vim.cmd [[
  --       set completeopt=menuone,noinsert,noselect
  --       highlight! default link CmpItemKind CmpItemMenuDefault
  --     ]]
  --   end,
  -- },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local autopairs = require 'nvim-autopairs'

      autopairs.setup {
        disable_filetype = { 'TelescopePrompt', 'vim' },
      }

      -- Note: nvim-cmp integration removed since we're using blink.cmp
      -- blink.cmp handles autopairs automatically
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'tabs',
          separator_style = 'slant',
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
        },
        highlights = {
          separator = {
            guifg = '#073642',
            guibg = '#002b36',
          },
          separator_selected = {
            guifg = '#073642',
          },
          background = {
            guifg = '#657b83',
            guibg = '#002b36',
          },
          buffer_selected = {
            guifg = '#fdf6e3',
            gui = 'bold',
          },
          fill = {
            guibg = '#073642',
          },
        },
      }
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', desc = 'Next diagnostic' },
      { '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', desc = 'Previous diagnostic' },
      { 'K', '<Cmd>Lspsaga hover_doc<CR>', desc = 'Hover documentation' },
      { 'gd', '<Cmd>Lspsaga finder<CR>', desc = 'LSP Finder' },
      { 'gp', '<Cmd>Lspsaga peek_definition<CR>', desc = 'Peek definition' },
      { 'gr', '<Cmd>Lspsaga rename<CR>', desc = 'Rename' },
    },
    config = function()
      require('lspsaga').setup {
        -- Modern lspsaga configuration
        ui = {
          border = 'rounded',
        },
        lightbulb = {
          enable = false,
        },
      }

      -- Add signature help in insert mode (alternative to <C-k>)
      vim.keymap.set('i', '<C-s>', '<Cmd>Lspsaga signature_help<CR>', { desc = 'Signature help' })
    end,
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      -- Configure linters by filetype
      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      }

      -- Auto-lint on these events
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    'dinhhuy258/git.nvim',
    event = 'VeryLazy',
    config = function()
      require('git').setup {
        keymaps = {
          -- Open blame window
          blame = '<Leader>gb',
          -- Open file/folder in git repository
          browse = '<Leader>go',
        },
      }
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    config = function()
      require('project_nvim').setup {
        -- Detection methods to find project root
        detection_methods = { 'pattern', 'lsp' },

        -- Patterns to detect project root
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'pom.xml' },

        -- Don't auto-cd in these directories
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- Silent mode (no messages)
        silent_chdir = true,

        -- Scope: global, tab, or win
        scope_chdir = 'global',
      }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file [E]xplorer' },
      { '<leader>tf', '<cmd>NvimTreeFindFile<CR>', desc = '[T]ree [F]ind file' },
    },
    config = function()
      -- Disable netrw at the very start (recommended by nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup {
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
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
            git_placement = 'after',
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
      }
    end,
  },
}
