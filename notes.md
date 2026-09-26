Run this when creating new angular projects so the linter works
`ng add @angular-eslint/schematics`

Change .build to build when working on normally structured c++ projects
`cmd = { "clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=.build" },`

Change this to whatever ur local one is 
`nodePath = "/home/mingco/.nvm/version/node/v24.19.0/lib/node_modules",`

If its a common language you want to add, just grep for supported_languages and add it to the list

TODO
- [ ] Write LSP.lua to handle language servers and diagnostics
- [ ] Write telescope.lua to add special features and take advantage of other pickers that are available. 
- [ ] sff shortcut ^
- [ ] conform plugin? add detail
- [ ] nvim-lint? add detail
- [ ] rust config idk just how its set up at work. 


