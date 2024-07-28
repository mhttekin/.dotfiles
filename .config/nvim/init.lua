require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
local opt = vim.opt

opt.number = true

opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true
opt.clipboard = 'unnamedplus'
opt.wrap = true

vim.o.pumheight = 7

vim.cmd([[
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
]])
