# ctrla

Easy way to switch words under cursor

# Install

Install manually or use a package manager whatever you like. It should be the same as you install other plugins.

# Usage

1. Configure `g:ctrla#dict`. Example:

```vimL
let g:ctrla#dict = [
    \ ['+', '-', '*', '/'],
    \ ['||', '&&']
    \ ]
```

2. The default hot key is `<c-a>` and `<c-x>`. You can remap it as you like.
```vimL
nnoremap <c-j> :<c-u>Ctrla<cr>
nnoremap <c-K> :<c-u>Ctrlx<cr>
```
