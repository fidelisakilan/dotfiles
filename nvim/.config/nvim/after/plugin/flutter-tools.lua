vim.keymap.set('n', '<leader>mc', require('telescope').extensions.flutter.commands, { desc = 'Flutter Commands' })
vim.keymap.set('n', '<leader>md', vim.cmd.FlutterRun, { desc = 'Flutter Run' })
vim.keymap.set('n', '<leader>mr', vim.cmd.FlutterReload, { desc = 'Flutter Reload' })
vim.keymap.set('n', '<leader>mR', vim.cmd.FlutterRestart, { desc = 'Flutter Restart' })
vim.keymap.set('n', '<leader>mq', vim.cmd.FlutterQuit, { desc = 'Flutter Quit' })
vim.keymap.set('n', '<leader>mo', vim.cmd.FlutterQuit, { desc = 'Flutter Rename' })
vim.keymap.set('n', '<leader>mt', vim.cmd.FlutterOutlineToggle, { desc = 'Flutter Outline Tree' })
vim.keymap.set('n', '<leader>me', vim.cmd.FlutterEmulators, { desc = 'Flutter Emulators' })


