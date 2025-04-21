--attempt to index field 'summary' (a nil value)- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- TODO: Think if I need to reinstall lint tools ( play with conform?)
-- TODO: Consider telescope-undo
-- TODO: Consider vim-terraform?
-- TODO: Consider vim-comentary

-- HARPOON
local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<C-f>', function()
  harpoon:list():add()
end, { desc = 'Harpoon add file' })
vim.keymap.set('n', '<C-m>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window' })
vim.keymap.set('n', '<C-n>', function()
  harpoon:list():next { ui_nav_wrap = true }
end, { desc = 'Next harpoon file' })
vim.keymap.set('n', '<C-p>', function()
  harpoon:list():prev { ui_nav_wrap = true }
end, { desc = 'Previous harpoon file' })

-- HARPOON

-- OIL
require('oil').setup { default_file_explorer = true }
-- OIL

pcall(require('telescope').load_extension, 'undo')

require('which-key').register {
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>v'] = { name = '[V]ertical things', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]esting', _ = 'which_key_ignore' },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>ve', ':Vexplore<CR>', { desc = '[V][e]xplore directory' })
vim.keymap.set('n', '<leader>mh', '<C-w>h', { desc = '[m]ove cursor left' })
vim.keymap.set('n', '<leader>ml', '<C-w>l', { desc = '[m]ove cursor right' })
vim.keymap.set('n', '<leader>mj', '<C-w>j', { desc = '[m]ove cursor down' })
vim.keymap.set('n', '<leader>mk', '<C-w>k', { desc = '[m]ove cursor up' })

function _G.set_terminal_keymaps()
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Move focus to the left window', buffer = 0 })
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Move focus to the right window', buffer = 0 })
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Move focus to the lower window', buffer = 0 })
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Move focus to the upper window', buffer = 0 })
end
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank globally' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank globally' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste globally' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = '[P]aste globally' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank globally' })
vim.keymap.set('v', '<leader>Y', '"+Y', { desc = '[Y]ank globally' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = '[P]aste globally' })
vim.keymap.set('v', '<leader>P', '"+P', { desc = '[P]aste globally' })
vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[S]earch [T]odo' })
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gc', ':Git checkout<CR>', { desc = '[G]it [C]heckout' })
vim.keymap.set('n', '<leader>jq', ':%!jq .<CR>', { desc = '[J][Q] the file' })
vim.keymap.set('n', '<leader>yq', ':%!yq .<CR>', { desc = '[Y][Q] the file' })

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
--
-- require('lspconfig').pylsp.setup {
--   on_init = function(client)
--     client.settings = vim.tbl_deep_extend('force', client.settings, {
--       pylsp = {
--         plugins = {
--           jedi = {
--             environment = require('whichpy.lsp').find_python_path(client.config.root_dir),
--           },
--         },
--       },
--     })
--   end,
-- }

vim.keymap.set('n', '<leader>mt', ':RenderMarkdown toggle<CR>', { desc = '[M]arkdown render [T]oggle' })
-- vim.keymap.set('n', '<leader>tt', require('neotest').run.run, { desc = '[t]est nearest [test]' })
vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = '[t]est [f]ile' })
vim.keymap.set('n', '<leader>tt', function()
  require('neotest').summary.toggle()
end, { desc = '[t]est [t]est summary' })
vim.keymap.set('n', '<leader>to', function()
  require('neotest').output.open()
end, { desc = '[t]est [o]pen' })
-- vim.keymap.set('n', '<leader>tt', require('neotest').summary.toggle, { desc = '[t]oggle [t]est summary' })
-- vim.keymap.set('n', '<leader>to', require('neotest').output.open, { desc = '[t]est [o]pen' })

-- vim.api.nvim_create_autocmd('VimEnter', {
--   desc = 'Auto select virtualenv Nvim open',
--   pattern = '*',
--   callback = function()
--     local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
--     if venv ~= '' then
--       require('venv-selector').retrieve_from_cache()
--     end
--   end,
--   once = true,
-- })
--
-- require('venv-selector').setup {
--   poetry_path = '$HOME/.cache/pypoetry/virtualenvs',
-- }

require('nvim-web-devicons').setup {}

return {}
