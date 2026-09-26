-- TREESITTER

local supported_languages = {
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
}

require('nvim-treesitter').install(supported_languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = supported_languages,
  callback = function ()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})
