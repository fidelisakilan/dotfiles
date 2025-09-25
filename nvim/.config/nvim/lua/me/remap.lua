-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Go to netrw' })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Move highlighted block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without copying the highlighted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank and put it in clipboard also
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- J but also keeps the cursor at starting point
vim.keymap.set("n", "J", "mzJ`z")

-- cursor stays in the middle when navigating with C-d, C-v
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor stays in the  middle when searching for text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- format code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format Document' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })


vim.api.nvim_create_user_command('Rfinder',
  function()
    local path = vim.api.nvim_buf_get_name(0)
    os.execute('open -R ' .. path)
  end,
  {}
)

vim.api.nvim_set_keymap('n', '<F2>', '<cmd>set wrap!<CR>', { noremap = true, silent = true })

-- Tab navigation keymaps
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Close other tabs' })
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>th', ':tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tH', ':tabfirst<CR>', { desc = 'First tab' })
vim.keymap.set('n', '<leader>tL', ':tablast<CR>', { desc = 'Last tab' })

-- Quick tab switching with Alt+number
vim.keymap.set('n', '<A-1>', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<A-2>', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<A-3>', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<A-4>', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<A-5>', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<A-6>', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<A-7>', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<A-8>', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<A-9>', '9gt', { desc = 'Go to tab 9' })
vim.keymap.set('n', '<A-0>', ':tablast<CR>', { desc = 'Go to last tab' })
