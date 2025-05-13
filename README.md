# 🚀 Git Shortcuts

A simple, natural language Git toolkit to speed up your workflow.  
Use plain English-style commands like `addncommit`, `readytopush`, or launch `gitmenu` to interact.

---

## ✨ Features

- 20+ natural language Git commands
- Interactive terminal menu with `gitmenu`
- Human-readable help with `githelp`
- Works on macOS, Linux, and WSL
- Available for Windows PowerShell

---

## 🐧 Installation (Zsh – macOS/Linux/WSL)

1. Clone this repo:

```bash
git clone https://github.com/aroonsekar/git-shortcuts.git
```

2. Add this to your `~/.zshrc`:

```bash
source ~/git-shortcuts/.git-shortcuts.zsh
```

3. Reload your shell:

```bash
source ~/.zshrc
```

---

## 🪟 Installation (PowerShell – Windows)

1. Clone this repo or [download `git-shortcuts.ps1`](https://github.com/aroonsekar/git-shortcuts/blob/master/git-shortcuts.ps1)

2. Save it to a known location, e.g.:

```
C:\Users\yourname\git-shortcuts\git-shortcuts.ps1
```

3. Enable execution (if not already):

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

4. Open your PowerShell profile:

```powershell
notepad $PROFILE
```

5. Add this line to the bottom:

```powershell
. "C:\Users\yourname\git-shortcuts\git-shortcuts.ps1"
```

6. Save and restart PowerShell.

---

## ⚡ Example Usage

**Zsh:**
```bash
addncommit "Update README"
readytopush "Fix merge conflict and push"
stashit "WIP - new UI layout"
deletemybranch feature/login
gitmenu
githelp
```

**PowerShell:**
```powershell
AddAndCommit "Update README"
ReadyToPush "Final bugfixes"
FixMerge
Show-GitMenu
GitHelp
```

---

## 🧠 Commands Overview

| Zsh Command       | PowerShell Equivalent | Description                                  |
|-------------------|------------------------|----------------------------------------------|
| `addncommit`      | `AddAndCommit`         | Add all changes and commit with message      |
| `readytopush`     | `ReadyToPush`          | Commit, rebase, and push                     |
| `newbranch`       | `NewBranch`            | Create and switch to a new branch            |
| `whatsthestatus`  | `WhatIsTheStatus`      | Show current git status                      |
| `whatdidido`      | `WhatDidIDo`           | Show last commit                             |
| `deletemybranch`  | `DeleteMyBranch`       | Delete local and remote branch               |
| `gitmenu`         | `Show-GitMenu`         | Interactive CLI menu                         |
| `githelp`         | `GitHelp`              | Show help text                               |

> Zsh users also have command autocompletion enabled for these shortcuts.

---

## 👤 Author

Created with [aroonsekar](https://github.com/aroonsekar) & ChatGPT.

If you like it, ⭐️ star it — and feel free to fork, contribute, or suggest new commands!
