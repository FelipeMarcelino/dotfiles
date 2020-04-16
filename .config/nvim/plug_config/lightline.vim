
let g:lightline = {
  \ 'component_function': {
  \   'filename': 'FileName',
  \   'gitbranch': 'GitBranch',
  \   'filencode': 'FileEncoding',
  \   'readonly': 'LightLineReadonly',
  \   'filename_active': 'LightlineFilenameActive',
  \   'filetype': 'LightLineFiletype',
  \   'fileformat': 'LightLineFileformat',
  \   'cocstatus': 'coc#status',
  \   'currentFunction' : 'CocCurrentFunction'
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'WizChecking',
  \   'linter_warnings': 'WizWarnings',
  \   'linter_errors': 'WizErrors',
  \   'linter_ok': 'WizOk',
  \   'buffers': 'lightline#bufferline#buffers',
  \   'coc_error'        : 'LightlineCocErrors',
  \   'coc_warning'      : 'LightlineCocWarnings',
  \   'coc_info'         : 'LightlineCocInfos',
  \   'coc_hint'         : 'LightlineCocHints',
  \   'coc_fix'          : 'LightlineCocFixes',
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \   'buffers': 'tabsel',
  \   'coc_error'        : 'error',
  \   'coc_warning'      : 'warning',
  \   'coc_info'         : 'tabsel',
  \   'coc_hint'         : '',
  \   'coc_fix'          : 'middle',
  \ }
  \}

" lighline functions
function! FileName()
  let l:fn = expand("%:t")
  let l:ro = &ft !~? 'help' && &readonly ? " RO" : ""
  let l:mo = &modifiable && &modified ? " +" : ""
  return l:fn . l:ro . l:mo
endfunction

function! GitBranch()abort
  return !IsTree() ? exists('*fugitive#head') ? fugitive#head() : '' : ''
endfunction

function FileEncoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
endfunction

function LightLineFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : '') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! IsTree()
  let l:name = expand('%:t')
  return l:name =~ 'NetrwTreeListing\|undotree\|NERD' ? 1 : 0
endfunction

""""""""""""""""
let s:indicator_checking = get(g:, 'lightline#ale#indicator_checking', ' ')
let s:indicator_ok = get(g:, 'lightline#ale#indicator_ok', ' ')

function! WizWarnings() abort
  if !WizLinted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf(' %d', all_non_errors)
endfunction

function! WizErrors() abort
  if !WizLinted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  " ×   
  return l:all_errors == 0 ? '' : printf(' %d', all_errors)
endfunction

function! WizOk() abort
  if !WizLinted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? s:indicator_ok : ''
endfunction

function! WizChecking() abort
  return ale#engine#IsCheckingBuffer(bufnr('')) ? s:indicator_checking : ''
endfunction

function! WizLinted() abort
  return get(g:, 'ale_enabled', 0) == 1
        \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
        \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
  \ 0: '⓿ ', 1: '❶ ', 2: '❷ ', 3: '❸ ', 4: '❹ ',
  \ 5: '❺ ', 6: '❻ ', 7: '❼ ', 8: '❽ ', 9: '❾ '}

" Leader is , 
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

augroup alestatus
  autocmd!
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
augroup END


let g:lightline.colorscheme = "mytheme"
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']] }
let g:lightline.component = { 'close':  'X ' }
let g:lightline.separator = { 'right': '', 'left': '' }
let g:lightline.active = {
  \   'left': [['coc_error', 'coc_warning', 'coc_hint', 'coc_info','currentFunction','linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \             [ 'gitbranch' ] ],
  \   'right': [ [ 'percent', 'lineinfo', 'fileformat' ],
  \             [ 'filencode', 'filetype' ] ],
  \ }
let g:lightline.inactive = {
  \   'left': [ ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \           [ 'filename_active' ] ],
  \   'right':[['lineinfo']],
  \ }


"autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  if a:kind == 'warning'
    return printf(' %d', info[a:kind])
  elseif a:kind == 'error'
    return printf(' %d', info[a:kind])
  elseif a:kind == 'information'
    return printf(' %d', info[a:kind])
  elseif a:kind == 'hints'
    return printf(' %d', info[a:kind])
  endif
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
\ }

autocmd User CocDiagnosticChange call lightline#update()

