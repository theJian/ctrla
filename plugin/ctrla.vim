if exists("g:loaded_ctrla")
    finish
endif
let g:loaded_ctrla = 1

command! Ctrla call ctrla#next()
command! Ctrlx call ctrla#prev()

silent! nnoremap <silent> <c-a> :<C-U>Ctrla<CR>
silent! nnoremap <silent> <c-x> :<C-U>Ctrlx<CR>
