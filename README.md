# .vim

This is my portable vim setup.


## Installation

First, clone the repo.

```
cd ~
rm -rf .vim/
rm .vimrc
git clone https://github.com/taylorvance/.vim.git
```

Next, create a symlink to .vimrc in `~`.

```
ln -s ~/.vim/.vimrc ~/.vimrc
```

Finally, download the plugins.

```
cd ~/.vim/
git submodule init
git submodule update
```


## Notable Features

* Semi-colon mapped to colon (saves a shift every time)
* Relative line numbers
* `<leader>` is comma
  * `<leader><space>` to clear highlighted search text
* `jj` mapped to `<esc>` for quick escape
* `<C-l>` and `<C-h>` for quick tab traversal
* `<tab>` goes to matching bracket pair
* Maintain clipboard after pasting
* Stay in Visual after tab shift
* Mouse and system clipboard support
* Git submodules managed by Pathogen
  * CtrlP
  * NERDTree
  * NERDCommenter
  * Solarized dark colorscheme


## Extend

To add a new plugin:

```
cd ~/.vim/bundle/
git submodule add https://github.com/username/name-of-repo.git
git submodule init
git submodule update
```


## Troubleshooting

### Colors don't look right

Make sure your terminal colors are set to solarized.

If you're using tmux, you can try these steps:

* Add this line to ~/.bashrc: `alias tmux="tmux -2"`
* Add this line to ~/.tmux.conf: `set -g default-terminal "screen-256color"`
* Then run `source ~/.bashrc`
