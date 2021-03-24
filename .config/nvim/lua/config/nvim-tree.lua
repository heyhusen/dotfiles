local cmd = vim.cmd

cmd('let g:nvim_tree_ignore = [ ".git", "node_modules", ".cache" ]')
cmd('let g:nvim_tree_auto_close = 1')
cmd('let g:nvim_tree_quit_on_open = 1')
cmd('let g:nvim_tree_follow = 1')
cmd('let g:nvim_tree_git_hl = 1')

