-- local has_autopairs, autopairs = pcall(require, 'nvim-autopairs')
-- local has_autotag, autotag = pcall(require, 'nvim-ts-autotag')
-- local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
-- local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
-- local has_compe, compe = pcall(require, 'compe')

local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
local has_lspconfig, lspconfig = pcall(require, 'lspconfig')

if has_treesitter then
    local autopairs = require('nvim-autopairs')
    local autopairs_compe = require('nvim-autopairs.completion.compe')
    local autotag = require('nvim-ts-autotag')

    autopairs.setup({ check_ts = true })
    autotag.setup()

    autopairs_compe.setup({
        map_cr = true,
        map_complete = true
    })

    treesitter.setup {
        ensure_installed = 'maintained',

        incremental_selection = {
            enable = true,
        },

        indent = { enable = true },
        autopairs = { enable = true },
        autotag = { enable = true }
    }
end

if has_lspconfig then
    local lsp_compe = require('compe')

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        local opts = {
            noremap = true,
            silent = true
        }

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.hover({ border = "single" })<cr>', opts)
        buf_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    end

    lspconfig.intelephense.setup{
        on_attach = on_attach
    }

    lspconfig.vuels.setup{
        on_attach = on_attach
    }

    lsp_compe.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;

        source = {
            path = true;
            buffer = true;
            calc = true;
            nvim_lsp = true;
            nvim_lua = true;
            vsnip = true;
            ultisnips = true;
        };
    }
end
