<h1 align="center">telescope-vim-pack.nvim</h1>

<h1 align="center">
<a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
  <br> <br>
  <div>
    <a href="https://github.com/IogaMaster/telescope-vim-pack.nvim/issues">
        <img src="https://img.shields.io/github/issues/IogaMaster/telescope-vim-pack.nvim?color=fab387&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/IogaMaster/telescope-vim-pack.nvim/stargazers">
        <img src="https://img.shields.io/github/stars/IogaMaster/telescope-vim-pack.nvim?color=ca9ee6&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/IogaMaster/telescope-vim-pack.nvim">
        <img src="https://img.shields.io/github/repo-size/IogaMaster/telescope-vim-pack.nvim?color=ea999c&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/IogaMaster/telescope-vim-pack.nvim/blob/main/.github/LICENCE">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
    </a>
    <br>
    </div>
        <img href="https://builtwithnix.org" src="https://builtwithnix.org/badge.svg"/>
   </h1>
   <br>

`telescope-vim-pack.nvim` adds a picker view for your plugins

## 📦 Installation and Usage

Include the repo with your favorite package manager.
Also be sure to install Telescope as well, although you already new that!

Then:
```lua
require('telescope').load_extension('vimpack')
```

Once that is in your config, you can call `:Telescope vimpack`

Keybinds (Default):
    - `u` updates single or multiple selected plugins
    - `U` updates all plugins
    - Enter over selected plugin opens its repo in the browser


## ❤️ Contributing

Contributions are whole-heartedly welcome! Please feel free to suggest new features,
implement additional builders, helpers, or generally assist if you'd like. We'd be happy to have you.
There's more information in [CONTRIBUTING.md](CONTRIBUTING.md).

## 📜 License

Licensed under the MIT license ([LICENSE](LICENSE) or <https://opensource.org/licenses/MIT>).
Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in this project by you, shall be licensed as above, without any additional terms or conditions.

