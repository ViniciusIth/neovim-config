local lsp_zero = require('lsp-zero')
local luasnip = require('luasnip')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

---
-- Autocompletition
---
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    })
}

require("luasnip.loaders.from_vscode").lazy_load()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true

---
-- installed language servers
---
require 'lspconfig'.gopls.setup {
    capabilities = lsp_capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            usePlaceholders = true,
        },
        analyzes = {
            unusedparams = true,
            unusedvariable = true
        }
    }
}

require 'lspconfig'.lua_ls.setup {
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            }
        }
    }
}

require 'lspconfig'.html.setup {
    capabilities = lsp_capabilities,
}

lsp_zero.setup_servers({ 'htmx' })
