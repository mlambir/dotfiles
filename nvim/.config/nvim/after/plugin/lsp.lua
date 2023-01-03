local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)

    local function dopts(desc)
        return {buffer = bufnr, remap = false, desc=desc}
    end

    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, dopts("Code Action"))
    vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, dopts("Rename"))
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, dopts("Signature Help"))
    vim.keymap.set("n", "gd", builtin.lsp_definitions, dopts("Go to Definition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, dopts("Hover"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, dopts("next"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, dopts("prev"))
    vim.keymap.set("n", "<leader>lc", builtin.lsp_incoming_calls, dopts("Incoming Calls"))
    vim.keymap.set("n", "<leader>lC", builtin.lsp_outgoing_calls, dopts("Outgoing Calls"))
    vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, dopts("Document Symbols"))
    vim.keymap.set("n", "<leader>lw", builtin.lsp_workspace_symbols, dopts("Workspace Symbols"))
    vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, dopts("Implementations"))
    vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, dopts("Type Definitions"))
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, dopts("Format"))
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true, desc="Trouble Toggle"})
    vim.keymap.set("n", "<leader>lD", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true, desc="Workspace Diagnostics"})
    vim.keymap.set("n", "<leader>ld", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true, desc="Document Diagnostics"})
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true, desc="Loclist"})
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true, desc="QuickFix"})
    vim.keymap.set("n", "<leader>lr", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true, desc="Lsp Refereces"})

end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
    automatic_installation = true,
    automatic_setup = true,
})
mason_nullls.setup_handlers({})

require("lsp-inlayhints").setup()
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
