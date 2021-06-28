local hasconfigs, configs = pcall(require, 'nvim-treesitter.configs')

if hasconfigs then
    configs.setup {
        highlight = {
            enable = true
        },

        indent = {
            enable = true
        },

        textobjects = {
            select = {
                enable = true,

                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner'
                }
            }
        }
    }
end
