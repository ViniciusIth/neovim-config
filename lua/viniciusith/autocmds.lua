local autocmd = vim.api.nvim_create_autocmd

-- Function to check if NvimTree is already open
local function is_nvimtree_open()
    return vim.bo.filetype == 'NvimTree'
end

-- Autocmd to open NvimTree when the last buffer is closed with :bd
autocmd("BufEnter", {
    callback = function()
        if #vim.fn.win_findbuf(vim.fn.bufnr('%')) == 0 and
            vim.bo.filetype ~= 'NvimTree' and
            not is_nvimtree_open() then
            vim.cmd('NvimTreeToggle')
        end
    end
})
