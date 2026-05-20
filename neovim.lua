vim.pack.add({ 'https://github.com/no-clown-fiesta/no-clown-fiesta.nvim' }, { confirm = false })
require('no-clown-fiesta').setup({
    transparent = true
})
vim.o.winborder = 'rounded'
vim.cmd.colorscheme('no-clown-fiesta')
