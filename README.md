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
* Git submodules (plugins) managed by Pathogen
  * [UltiSnips](https://github.com/SirVer/ultisnips.git) with [vim-snippets](https://github.com/honza/vim-snippets.git)
  * [CtrlP](https://github.com/ctrlpvim/ctrlp.vim.git)
  * [NERDTree](https://github.com/scrooloose/nerdtree.git)
  * [NERDCommenter](https://github.com/scrooloose/nerdcommenter.git)
  * [Surround](https://github.com/tpope/vim-surround.git)
  * [Solarized dark colorscheme](https://github.com/altercation/vim-colors-solarized.git)


## Plugin Management

To add a new plugin:

```
cd ~/.vim/bundle/
git submodule add https://github.com/username/reponame.git
git submodule init
git submodule update
```

*Note: You will need to run the `init` and `update` cmds when pulling new plugins from remote.*

To remove a plugin:

```
cd ~/.vim/
git submodule deinit bundle/reponame/
git rm -rf bundle/reponame/
rm -rf .git/bundle/reponame/
```

To update all plugins:

```
cd ~/.vim/
git submodule foreach git pull origin master
```


## Troubleshooting

### Colors don't look right

Make sure your terminal colors are set to solarized.

If you're using tmux, you can try these steps:

* Add this line to ~/.bashrc: `alias tmux="tmux -2"`
* Add this line to ~/.tmux.conf: `set -g default-terminal "screen-256color"`
* Then run `source ~/.bashrc`

In iTerm2 (and maybe others), if certain terminal commands yield invisible text (Mocha does in my experience), increase "Minimum contrast" a bit in your terminal profile color settings.
