# my nvim config

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

---

## ✦ plugins

| plugin | what it does |
|--------|-------------|
| [harpoon](https://github.com/ThePrimeagen/harpoon) | jump between your most-used files |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | autocompletion |
| [fugitive](https://github.com/tpope/vim-fugitive) | git via :Git |

---

## ✦ install

back up your existing config first:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

then clone:

```bash
git clone https://github.com/yourusername/nvim-config ~/.config/nvim
```

open neovim — everything installs on first launch

---

## ✦ keymaps

| key | action |
|-----|--------|
| `<Space>` | leader key |
| `<leader>a` | harpoon add file |
| `<leader>h` | harpoon menu |
| `<leader>gg` | fugitive git status |
| `gd` | go to definition |
| `K` | hover docs |
| `<Tab>` | cycle completions |
