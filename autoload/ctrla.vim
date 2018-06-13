function! s:fallback(key)
    exec 'silent! normal! ' . a:key
endfunction

function! s:getCursorWord()
    return expand("<cword>")
endfunction

function! s:getNextWord(word, dir)
    " TODO
    return a:word
endfunction

function! s:replaceWord(dir)
    let word = s:getCursorWord()
    let nextword = s:getNextWord(word, a:dir)
    let cursorCol = col(".")
    let cursorLine = getline(".")
    return 0
endfunction

function! ctrla#next()
    if !s:replaceWord(1)
        call s:fallback("\<c-a>")
    endif
endfunction

function! ctrla#prev()
    if !s:replaceWord(-1)
        call s:fallback("\<c-x>")
    endif
endfunction
