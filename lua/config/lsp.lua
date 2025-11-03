-- MASON
require("mason").setup()

-- MASON-LSPCONFIG
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
    "ts_ls",
    "html",
    "cssls",
    "rust_analyzer",
  },
})

------------------------------------------------------- LSP CONFIG -------------------------------------------------------
-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define configs
local servers = {
  lua_ls = { capabilities = capabilities },
  clangd = { capabilities = capabilities },
  pyright = { capabilities = capabilities },
  ts_ls = { capabilities = capabilities },
  html = { capabilities = capabilities },
  cssls = { capabilities = capabilities },
  rust_analyzer = {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = true,
      },
    },
  },
}

-- Register them
for name, config in pairs(servers) do
  vim.lsp.config(name, config)
end

-- Autostart for matching filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "c", "cpp", "python", "typescript", "html", "css", "rust" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if servers[ft] then
      vim.lsp.start(servers[ft])
    end
  end,
})


-- Global LSP keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})
