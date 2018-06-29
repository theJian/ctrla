function! s:fallback(key)
    exec 'silent! normal! ' . a:key
endfunction

function! s:getWordPos()
    exec "normal! viw\<esc>"
    let start = getpos("'<")[2] - 1
    let end = getpos("'>")[2] - 1
    return [start, end]
endfunction

function! s:getNextWord(word, dir)
    if !exists("g:ctrla#dict") || type(g:ctrla#dict) != type([])
        return ""
    endif

    for words in g:ctrla#dict
        let idx = index(words, a:word)
        if idx != -1
            let maxlen = len(words)
            let nextIdx = (maxlen + a:dir + idx) % maxlen
            return words[nextIdx]
        endif
    endfor

    " Not found
    return ""
endfunction

function! s:replaceWord(dir)
    let [start, end] = s:getWordPos()
    let line = getline(".")
    let word = line[start:end]
    let nextword = s:getNextWord(word, a:dir)

    if nextword == ""
        return 0
    endif

    let left = line[:start - 1]
    let right = line[end + 1:]
    call setline(".", left . nextword . right)
    exec printf("normal! %d|", len(left) + len(nextword))
    return 1
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
