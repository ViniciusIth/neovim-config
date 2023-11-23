require('lualine').setup {
    options = {
        disabled_filetypes = {
            'NvimTree', 'packer',
        },
    },
    winbar = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}
