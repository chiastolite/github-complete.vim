let g:github_complete#overwrite_omnifunc        = get(g:, 'github_complete#overwrite_omnifunc', 1)
let g:github_complete#enable_neocomplete        = get(g:, 'github_complete#enable_neocomplete', 0)
let g:github_complete#enable_emoji_completion   = get(g:, 'github_complete#enable_emoji_completion', 1)
let g:github_complete#enable_issue_completion   = get(g:, 'github_complete#enable_issue_completion', 1)
let g:github_complete#enable_user_completion    = get(g:, 'github_complete#enable_user_completion', 1)
let g:github_complete#include_issue_title       = get(g:, 'github_complete#include_issue_title', 0)
let g:github_complete#max_issue_candidates      = get(g:, 'github_complete#max_issue_candidates', 100)
let g:github_complete#git_cmd                   = get(g:, 'github_complete#git_cmd', 'git')
let g:github_complete#fetch_issues_filetypes    = get(g:, 'github_complete#fetch_issues_filetypes', ['gitcommit'])
let g:github_complete#emoji_japanese_workaround = get(g:, 'github_complete#emoji_japanese_workaround', 1)

function! github_complete#error(msg)
    echohl ErrorMsg
    echomsg 'github-complete.vim: ' . a:msg
    echohl None
endfunction

function! github_complete#find_start(input, pattern, completion)
    if !g:github_complete#enable_{a:completion}_completion
        return -1
    endif

    let c = col('.')

    if a:input ==# ''
        return -1
    endif

    let offset = c == 1 ? 1 : 2

    " Note: Consider the case when the cursor is at the end of line

    return match(a:input[:c - offset], a:pattern)
endfunction

function! github_complete#import_vital()
    if !exists('s:modules')
        let s:modules = {}
        let vital = vital#of('github_complete')
        for m in ['Process', 'Web.HTTP', 'Web.JSON', 'Data.Optional']
            let s:modules[m] = vital.import(m)
        endfor
    endif

    return s:modules
endfunction

function! s:find_start_col()
    let line = getline('.')

    for kind in ['emoji', 'issue', 'user']
        let c = github_complete#{kind}#find_start(line)
        if c >= 0
            return c
        endif
    endfor

    return col('.') - 1
endfunction

function! github_complete#complete(findstart, base)
    if a:findstart
        return s:find_start_col()
    endif

    for kind in ['emoji', 'issue', 'user']
        if github_complete#{kind}#is_available(a:base)
            return github_complete#{kind}#candidates(a:base)
        endif
    endfor

    let candidates = []
    for kind in ['emoji', 'issue', 'user']
        let candidates += github_complete#{kind}#candidates(a:base)
    endfor
    return candidates
endfunction

