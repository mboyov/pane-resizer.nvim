<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

</div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/mboyov/pane-resizer.nvim">
    <img src="./logo.gif" width="auto" alt="Logo">
  </a>
  <h3 align="center">Pane Resizer</h3>
  <p align="center">
    A Neovim plugin to dynamically resize panes, focusing on the active window and excluding NvimTree and floating windows.
  </p>
</div>

---

# Pane Resizer

Pane Resizer is a Neovim plugin that dynamically resizes windows to optimize workspace layout. It focuses on enhancing your workflow by giving priority to the active pane, while preserving the width of excluded windows such as `NvimTree`, floating windows, or buffers you've explicitly disabled from resizing.

## ✨ Features

* **Smart Pane Resizing**: Automatically resizes the focused window to a user-defined percentage of available space.
* **Fixed Width for NvimTree**: Keeps `NvimTree` at a constant width even when focus changes.
* **Floating Window Exclusion**: Skips floating windows from layout calculations.
* **Per-Buffer Resize Control**: Disable resizing for any buffer on demand while preserving its current width.
* **Fully Configurable**: Customize widths, behavior, and activation dynamically.

## 🚀 Why use this?

* 🧠 **Focus-centric layout**: Maintain a clean visual hierarchy by resizing only what matters.
* ⚙️ **Custom per-buffer behavior**: Need a terminal or outline to keep its size? No problem.
* �� **Floating support**: Avoid breaking UI popups like Telescope or LSP dialogs.
* 🧩 **Plug-and-play**: Minimal setup and works out of the box with most setups.

---

## 📦 Installation & Configuration

### Using Lazy.nvim:

```lua
-- Lazy setup
{
  "mboyov/pane-resizer.nvim",
  config = function()
    require("pane_resizer").setup({
      NVIMTREE_WIDTH = 40,             -- Optional: fixed width for NvimTree (default: 30)
      FOCUSED_WIDTH_PERCENTAGE = 0.6,  -- Optional: focused window width (default: 0.7)
    })
  end,
}
```

---

## 🛠️ Commands

| Command               | Description                                                           |
| --------------------- | --------------------------------------------------------------------- |
| `:PaneResizerToggle`  | Enable or disable automatic resizing globally.                        |
| `:PaneResizerDisable` | Disable resizing for the current buffer and freeze its current width. |
| `:PaneResizerEnable`  | Re-enable resizing for the current buffer.                            |

---

## 📌 Use Cases

* Developers using multiple vertical splits who want the focused pane to be emphasized.
* Users with sidebars (e.g., `NvimTree`, `Outline`, `Trouble`) who want consistent widths.
* Terminal lovers who want their REPL pane to keep its size during window navigation.
* Tinkerers looking for full control over window layout behavior.

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request to improve functionality or performance.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more details.

---

## 🙌 Credits

* [Neovim](https://neovim.io) for building an editor made to be extended.
* The amazing Neovim community for their plugins, examples, and ideas.

---

[contributors-shield]: https://img.shields.io/github/contributors/mboyov/pane-resizer.nvim.svg?style=for-the-badge
[contributors-url]: https://github.com/mboyov/pane-resizer.nvim/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mboyov/pane-resizer.nvim.svg?style=for-the-badge
[forks-url]: https://github.com/mboyov/pane-resizer.nvim/network/members
[stars-shield]: https://img.shields.io/github/stars/mboyov/pane-resizer.nvim.svg?style=for-the-badge
[stars-url]: https://github.com/mboyov/pane-resizer.nvim/stargazers
[issues-shield]: https://img.shields.io/github/issues/mboyov/pane-resizer.nvim.svg?style=for-the-badge
[issues-url]: https://github.com/mboyov/pane-resizer.nvim/issues
[license-shield]: https://img.shields.io/github/license/mboyov/pane-resizer.nvim.svg?style=for-the-badge
[license-url]: https://github.com/mboyov/pane-resizer.nvim/blob/main/LICENSE
