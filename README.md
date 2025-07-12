# tiny-exercise.nvim
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Status: Under Development](https://img.shields.io/badge/status-under%20development-orange.svg)
![Lua](https://img.shields.io/badge/Made%20with-Lua-blueviolet.svg)

A Neovim plugin that helps you build muscle memory for essential key combinations through tiny, interactive exercises.

---

## 🚧 Under Heavy Development 🚧

**Warning:** This plugin is currently in the early stages of development.

It is not yet stable and should be considered an alpha version. Features may be added, changed, or removed without notice. Feel free to try it out and provide feedback, but please do not rely on it.

## ✨ Vision & Philosophy

The goal of `tiny-exercise.nvim` is to bridge the gap between knowing a keybinding and making it second nature. By providing short, repeatable drills directly within the editor, this plugin aims to help Neovim users improve their editing speed and efficiency, one key combination at a time.

## 📦 Installation

You can install it directly from GitHub using your favorite plugin manager (for example lazy.nvim)

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- lua/plugins/tiny-exercise.lua
return {
    'pherklotz/tiny-exercise.nvim',
    opts = {}
}
```

## 🚀 Usage
The API and commands are still being finalized. The planned workflow is as follows:

1. Run a command like `:Training` to open a new exercise buffer.
2. Follow the on-screen prompts to practice specific movements or commands.
3. Receive feedback on your speed and accuracy.

(More detailed usage instructions will be added as features are implemented.)

## 🤝 Contributing
This is a passion project, and contributions are highly welcome!
If you have ideas, suggestions, or want to report a bug, please feel free to open an issue.

## 📄 License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
