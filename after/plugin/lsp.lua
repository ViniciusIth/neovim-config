local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

---
-- installed language servers
require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl"},
    root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUninported = true,
            usePlaceholders = true,
            analyzes = {
                unusedparams = true
            }
        }
    }
}
require'lspconfig'.lua_ls.setup {}
require'lspconfig'.htmx.setup{}
