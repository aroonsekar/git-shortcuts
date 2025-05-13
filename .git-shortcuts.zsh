githelp() {
  echo ""
  echo "📘 Git Shortcuts Help – Natural Language Commands"
  echo "---------------------------------------------------"
  echo "addncommit \"msg\"        – Add all changes and commit with message"
  echo "commitnpush \"msg\"       – Add, commit, and push to current branch"
  echo "readytopush \"msg\"       – Commit, rebase with remote, and push"
  echo "newbranch \"branch\"      – Create and switch to a new branch"
  echo "switchtobranch \"branch\" – Checkout/switch to a branch"
  echo "fetchlatest              – Fetch remote changes and rebase"
  echo "gitstart \"msg\" [branch] [repo] – Init, commit, and push to new remote repo"
  echo "whatsthestatus           – Show current git status"
  echo "whatdidido               – Show last commit details"
  echo "showcommits              – Pretty view of commit history"
  echo "undoLastCommit           – Undo last commit (keep changes staged)"
  echo "nukeLastCommit           – Hard undo of last commit (discard changes)"
  echo "unstage <file>           – Unstage a specific file"
  echo "forcepush                – Push changes forcefully (with lease)"
  echo "stashit \"msg\"           – Stash current work with a message"
  echo "stashlist                – Show all saved stashes"
  echo "bringitback              – Apply the latest stash"
  echo "getthecode <repo>        – Clone a git repo"
  echo "quicksave \"msg\"         – Stash current work, switch to main, pull"
  echo "fixmerge                 – Abort merge and reset working directory"
  echo "deletemybranch \"branch\" – Delete a branch locally & remotely"
  echo "stashthenapply \"msg\"    – Stash and immediately apply stash"
  echo "gitmenu                  – Launch interactive menu for all above"
  echo "githelp                  – Show this help guide"
  echo ""
}


# Commit only
addncommit() {
  git add .
  git commit -m "$1"
}

# Commit & push
commitnpush() {
  git add .
  git commit -m "$1"
  branch=$(git rev-parse --abbrev-ref HEAD)
  git push origin "$branch"
}

# Checkout and create a new branch
newbranch() {
  git checkout -b "$1"
}

# Checkout branch
switchtobranch() {
  git checkout "$1"
}

# Pull latest changes and rebase onto them
fetchlatest() {
  git fetch
  git rebase origin/$(git rev-parse --abbrev-ref HEAD)
}

# Init + first commit + push
gitstart() {
  git init
  git add .
  git commit -m "$1"
  branch=${2:-main}
  git branch -M "$branch"
  git remote add origin "$3"
  git push -u origin "$branch"
}

#Stages all changes, commits with a message, pulls latest changes (rebased), then pushes.
readytopush() {
  git add .
  git commit -m "$1"
  git fetch
  git rebase origin/$(git rev-parse --abbrev-ref HEAD)
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

# What's going on in the repo?
whatsthestatus() {
  git status
}

# What did I just commit?
whatdidido() {
  git log -1
}

# Show all commits (pretty)
showcommits() {
  git log --oneline --graph --decorate --all
}

# Undo the last commit but keep the changes
undoLastCommit() {
  git reset --soft HEAD~1
}

# Completely undo the last commit and discard changes
nukeLastCommit() {
  git reset --hard HEAD~1
}

# Remove a file from staging area
unstage() {
  git reset HEAD "$1"
}

# Push forcefully (with lease)
forcepush() {
  git push --force-with-lease
}

# Save your work temporarily
stashit() {
  git stash push -m "$1"
}

# Show all stashes
stashlist() {
  git stash list
}

# Apply latest stash
bringitback() {
  git stash pop
}

# Clone a repo naturally
getthecode() {
  git clone "$1"
}

# Stashes current changes with a message, switches to main(change to you main branch), pulls the latest.
quicksave() {
  git stash push -m "$1"
  git checkout main
  git pull
}

fixmerge() {
  echo "⚠️ Aborting merge and cleaning up..."
  git merge --abort 2>/dev/null || echo "No merge in progress"
  git reset --hard
  git clean -fd
}

deletemybranch() {
  branch="$1"
  current=$(git rev-parse --abbrev-ref HEAD)
  if [[ "$branch" == "$current" ]]; then
    echo "❌ You cannot delete the current branch ($current)"
  else
    git branch -D "$branch"
    git push origin --delete "$branch"
  fi
}

stashthenapply() {
  git stash push -m "$1"
  git stash pop
}

gitmenu() {
  echo ""
  echo "🧰 Git Helper Menu"
  echo "1. ✅ Add & Commit"
  echo "2. 📤 Commit & Push"
  echo "3. 🚀 Ready to Push (Commit + Rebase + Push)"
  echo "4. 🌿 New Branch"
  echo "5. 🔀 Switch Branch"
  echo "6. 🔄 Fetch & Rebase"
  echo "7. 📦 Init + First Push (gitstart)"
  echo "8. ❓ Status"
  echo "9. 🧠 Last Commit"
  echo "10. 📜 Commit History"
  echo "11. 🔙 Undo Last Commit (keep changes)"
  echo "12. 💥 Nuke Last Commit (discard changes)"
  echo "13. 🧼 Unstage File"
  echo "14. 💪 Force Push"
  echo "15. 💾 Stash"
  echo "16. 📂 List Stashes"
  echo "17. 🧲 Apply Last Stash"
  echo "18. 🔽 Clone Repo"
  echo "19. 🧘 Quick Save & Pull Main"
  echo "20. 🧯 Fix Merge"
  echo "21. 🗑️ Delete Branch (local & remote)"
  echo "22. 💫 Stash Then Apply"
  echo "0. ❌ Exit"
  echo ""

  read "choice?Pick an option (0-22): "

  case $choice in
    1) read -r "msg?Commit message: "; addncommit "$msg" ;;
    2) read -r "msg?Commit message: "; commitnpush "$msg" ;;
    3) read -r "msg?Commit message: "; readytopush "$msg" ;;
    4) read -r "name?New branch name: "; newbranch "$name" ;;
    5) read -r "name?Branch to switch to: "; switchtobranch "$name" ;;
    6) fetchlatest ;;
    7)
      read -r "msg?Commit message: "
      read -r "branch?Branch name (default: main): "
      read -r "url?Repo URL: "
      gitstart "$msg" "$branch" "$url"
      ;;
    8) whatsthestatus ;;
    9) whatdidido ;;
    10) showcommits ;;
    11) undoLastCommit ;;
    12) nukeLastCommit ;;
    13) read -r "file?Filename to unstage: "; unstage "$file" ;;
    14) forcepush ;;
    15) read -r "msg?Stash message: "; stashit "$msg" ;;
    16) stashlist ;;
    17) bringitback ;;
    18) read -r "url?Repo URL to clone: "; getthecode "$url" ;;
    19) read -r "msg?Stash message: "; quicksave "$msg" ;;
    20) fixmerge ;;
    21) read -r "branch?Branch name to delete: "; deletemybranch "$branch" ;;
    22) read -r "msg?Stash message: "; stashthenapply "$msg" ;;
    0) echo "👋 Exiting Git Menu";;
    *) echo "❌ Invalid option" ;;
  esac
}



autoload -Uz compinit
compinit
if type compdef &>/dev/null; then
  compdef _gnu_generic addncommit commitnpush newbranch switchtobranch fetchlatest gitstart readytopush \
    whatsthestatus whatdidido showcommits undoLastCommit nukeLastCommit unstage forcepush \
    stashit stashlist bringitback getthecode quicksave fixmerge deletemybranch stashthenapply gitmenu
fi