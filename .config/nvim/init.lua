--line numbering
vim.opt.number = true

--vim.g.molokai_original = 1
--vim.g.rehash256 = 1
--vim.cmd.colorscheme("molokai")


vim.pack.add{{ src = 'https://github.com/ayu-theme/ayu-vim' },}
vim.opt.termguicolors = true
vim.g.ayucolor = "dark"   -- или "mirage", "dark"
vim.cmd.colorscheme("ayu")

--CLANGD ++++++++++++++++++++++++++++++++++++++++++++++++++++
--get from https://clangd.llvm.org/installation
--also https://neovim.io/doc/user/lsp/#lsp-quickstart
 -- Leaving this empty will use the default options from the
 -- `nvim-lspconfig` plugin. See |:h vim.lsp.Config| for all
 -- available fields, and see below for more customization.
 vim.lsp.config('clangd', {
	    -- Add custom command-line flags:
    cmd = { 
	'clangd',
    	'--query-driver=/usr/bin/g++',
	'--background-index',
	'--clang-tidy',
	'--log=verbose'
	},
	    -- Customize clangd's behaviour:
    init_options = { fallbackFlags = { '-std=c++17' }, },
 })

 -- ------------------------------------------ --
 -- For version 0.10.x and below:
-- require('lspconfig').clangd.setup(clangd_opts)

 -- ------------------------------------------ --
 -- For version 0.11.x and above:
-- if not vim.lsp.is_enabled('clangd') then
     vim.lsp.enable('clangd')
-- end
--CLANGD ++++++++++++++++++++++++++++++++++++++++++++++++++++

--add lspconfig plugin
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

--add clangd_extensions plugin
vim.pack.add{
  { src = 'https://github.com/dchinmay2/clangd_extensions.nvim' },
}



--fix kitty and nvim communication issue https://github.com/neovim/neovim/issues/32143
vim.api.nvim_create_autocmd("VimEnter", {
callback = function()
io.stdout:write("\027[>1u")
end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
callback = function()
io.stdout:write("\027[<1u")
end,
})

