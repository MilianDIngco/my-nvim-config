-- TREESITTER
local ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tsconfigs.setup({
  ensure_installed = {
    "lua",
    "c",
    "cpp",
    "java",
    "html",
    "css",
    "vim",
    "bash",
    "javascript",
    "python",
    "markdown",
    "markdown_inline",
    "rust",
    "dart",
    "typescript",
    "scss",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
