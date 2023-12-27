local lsp_zero = require('lsp-zero')
local luasnip = require('luasnip')
require("mason").setup()
require("mason-lspconfig").setup()

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
local cmp_action = require('lsp-zero').cmp_action()
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
    }),
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.expand_or_locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        -- -- navigate between snippet placeholder
        -- ['<C-a>'] = cmp_action.luasnip_jump_backward(),
        -- ['<C-d>'] = cmp_action.luasnip_jump_forward(),

        -- -- Confirm item
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
}

require("luasnip.loaders.from_vscode").lazy_load()
require 'luasnip'.filetype_extend("svelte", { "html", "tailwindCSS", "tsserver" })
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
    filetypes = { "html", "svelte" },
}

require("lspconfig").tailwindcss.setup {
    capabilities = lsp_capabilities,
}

require("lspconfig").tsserver.setup {
    filetypes = { "svelte" }
}

lsp_zero.setup_servers({ 'htmx', 'tsserver' })
