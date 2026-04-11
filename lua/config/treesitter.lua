-- TREESITTER
local tsconfigs = require("nvim-treesitter.configs")
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
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
