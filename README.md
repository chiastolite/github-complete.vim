Vim Input Completion for [GitHub](https://github.com/)
======================================================

[![Build Status](https://travis-ci.org/rhysd/github-complete.vim.svg?branch=master)](https://travis-ci.org/rhysd/github-complete.vim)

github-complete.vim is a completion plugin to complete things related to GitHub.  It generates, caches and contextually shows candidates of completion via GitHub API.

Now github-complete.vim provides below completions:
- Emoji completion
- User name completion
- Repository name completion
- Issue number completion
- Link URL completion

You can use these completions as omni completion in Vim.  Type `<C-x><C-o>` in insert mode to invoke omni completion.

Please see [documentation](https://github.com/rhysd/github-complete.vim/blob/master/doc/github-complete.txt) for more detail.

## Emoji completion :dog:

When the cursor is after ":", github-complete.vim invokes emoji completion.  If your font can deal with unicode emojis, the items of completion show the corresponding emojis.

![emoji completion](https://raw.githubusercontent.com/rhysd/screenshots/master/github-complete.vim/emoji_completion.gif)

## User name completion

When the cursor is after "@" or "github.com/", github-complete.vim invokes GitHub user name completion.

![user name completion](https://raw.githubusercontent.com/rhysd/screenshots/master/github-complete.vim/user_completion.gif)

## Repository name completion

When the cursor is after the format `{user name}/{some query}`, github_complete.vim invokes GitHub repository completion.  It shows repositories which `{user name}` owns.

![repo name completion](https://raw.githubusercontent.com/rhysd/screenshots/master/github-complete.vim/repo_completion.gif)

## Issue number completion

When the cursor is after "#", github-complete.vim invokes issue number completion.
You can select an issue with looking the issue titles in items of completion.

![issue number completion](https://raw.githubusercontent.com/rhysd/screenshots/master/github-complete.vim/issue_completion.gif)

## Link URL completion

When writing link to GitHub repository in markdown, you can complete its URL.
On writing `[something](`, github-complete.vim searches GitHub repositories by the title `something` and shows the result.

![link completion](https://raw.githubusercontent.com/rhysd/ss/master/github-complete.vim/link_completion.gif)

## Installation 

You can use modern Vim plugin package managers (e.g. [Vundle.vim](https://github.com/gmarik/Vundle.vim)/[vim-plug](https://github.com/junegunn/vim-plug)/[neobundle.vim](https://github.com/Shougo/neobundle.vim)):

```vim
Plugin 'rhysd/github-complete.vim'
Plug 'rhysd/github-complete.vim'
NeoBundle 'rhysd/github-complete.vim'
```

github-complete.vim optionally depends on [vimproc.vim](https://github.com/Shougo/vimproc.vim).  I recommend to install them in advance.

Then you've already gained the completions.  Open a buffer, execute `:setf gitcommit`, then try to type `<C-x><C-o>` after `:`.  It will show emoji candidates.  If you can't see the candidates, check `omnifunc` option with `:set omnifunc` and make sure to set it to `github_complete#complete`.

## [neocomplete](https://github.com/Shougo/neocomplete.vim) sources

github-complete.vim provides [neocomplete](https://github.com/Shougo/neocomplete.vim) sources corresponding to above completions.  They are disabled by default.  When you enable them, neocomplete will show candidates of the completion automatically.  Please see [documentation](https://github.com/rhysd/github-complete.vim/blob/master/doc/github-complete.txt) for more detail.

## Japanese description for emoji

If you are Japanese, you may be lucky.  For the environment where unicode emoji font is not available, emoji completion shows the Japanese descriptions instead of them.  Set `g:github_complete_emoji_japanese_workaround` to 1 to enable this feature.

![Japanese workaround](https://raw.githubusercontent.com/rhysd/screenshots/master/github-complete.vim/japanese_workaround.gif)

## Related plugins

- [github-issues.vim](https://github.com/jaxbot/github-issues.vim)

github-issues.vim provides you GitHub issue integration in Vim.
You can look, create and close a GitHub issue.

- [vim-fugitive](https://github.com/jaxbot/github-issues.vim)

Git integration for Vim

- [vim-emoji](https://github.com/junegunn/vim-emoji)

Vim emoji is a library and small completion plugin to use emoji in Vim.  The plugin is distributed under the MIT license.  I use the data in the library following it.  Thank you [@junegunn](https://github.com/junegunn)!

## Libraries

github-complete.vim uses [vital.vim](https://github.com/vim-jp/vital.vim).  vital.vim is a general purpose Vim script libraries developed by Japanese Vim community.  They are embedded in github-complete.vim as vital modules so that users need not to install it manually. (Don't worry, vital.vim is open to the public with very relaxed license.)

## License

This software is distributed under [The MIT License](http://opensource.org/licenses/MIT)
