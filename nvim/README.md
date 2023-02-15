# My Neovim Config

## Installation

- option 1 (best dev experience and easiest): just use the `deb` image and install using either `sudo apt install <deb file>` or `dpk install .... something`
- option 2: download the `appimage` then copy the binary to one of the `$PATH`s

## Requirements

- nvim >= `0.8.0`, some commands don't work for lower versions
- git
- Installing `black`, `isort` and `pylint` can sometimes result in `unable to create python3 venv environment`. Check this [stackoverflow](https://askubuntu.com/questions/958303/unable-to-create-virtual-environment-with-python-3-6) post

- telescope
  - ripgrep `rg`
- `fd` for finding files

(Optional Requirements)

- lazygit
- nerd fonts

(For a nice development environment)

- `nvm` for node version management
- `virtualenv`
- `pnpm`

## Configuration (i.e. things you might need to do manually after installing)

- install a local typescript server for `vue`'s `volar takeover` mode (check `global_ts` from `lspconfig.lua`)
- for `DAP`, you might have to manually type the location of some of the adapters, e.g. for python
  - see `dap.adapters.python` under `debugging.lua`
- you might need to configure a custom location if you'd want to use a dictionary for `MD` files

## Snapshots

- to create snapshots, type `:PackerSnapshot <name of snap>`
- `name of snap` can be an absolute path
- for the sake of simplicity and git tracking, snapshots are saved under `./packer_snaps`, where `.` is the current directory (`~/.config/nvim/`)
- check the [docs](https://github.com/wbthomason/packer.nvim#custom-initialization) to see how to config packer to use a custon snap directory

## Common issues

- `;5u` appearing when i try to exit a terminal: this happens when you press `Ctrl+Enter` (sometimes i forget that i'm actually holding `ctrl` because of `ctrl+space` zsh autocomplete)
- `pylint` false positives about import error: probably has to do with `NULL LS` being confused about which `pylint` installation to use, when pylint is installed from mason, it attempts to use that, and as a result, it may try to resolve import dependencies from where the global `mason` pylint package is installed.
  - `FIX`: under `mason.lua`, comment out the part where `pylint` is under `null_ls`'s `ensure_installed` packages
  - then simply install pylint inside the venv of your project (seems to work lol idk why)
