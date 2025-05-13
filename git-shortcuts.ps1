
# Git Shortcuts for PowerShell
# Save this as git-shortcuts.ps1 and dot-source it in your PowerShell profile

Function AddAndCommit($Message) {
    git add .
    git commit -m $Message
}

Function CommitAndPush($Message) {
    $branch = git rev-parse --abbrev-ref HEAD
    git add .
    git commit -m $Message
    git push origin $branch
}

Function ReadyToPush($Message) {
    $branch = git rev-parse --abbrev-ref HEAD
    git add .
    git commit -m $Message
    git fetch
    git rebase origin/$branch
    git push origin $branch
}

Function NewBranch($Name) {
    git checkout -b $Name
}

Function SwitchToBranch($Name) {
    git checkout $Name
}

Function FetchLatest() {
    $branch = git rev-parse --abbrev-ref HEAD
    git fetch
    git rebase origin/$branch
}

Function GitStart($Message, $Branch = "main", $Remote) {
    git init
    git add .
    git commit -m $Message
    git branch -M $Branch
    git remote add origin $Remote
    git push -u origin $Branch
}

Function WhatIsTheStatus() {
    git status
}

Function WhatDidIDo() {
    git log -1
}

Function ShowCommits() {
    git log --oneline --graph --decorate --all
}

Function UndoLastCommit() {
    git reset --soft HEAD~1
}

Function NukeLastCommit() {
    git reset --hard HEAD~1
}

Function Unstage($File) {
    git reset HEAD $File
}

Function ForcePush() {
    git push --force-with-lease
}

Function StashIt($Message) {
    git stash push -m $Message
}

Function StashList() {
    git stash list
}

Function BringItBack() {
    git stash pop
}

Function GetTheCode($RepoUrl) {
    git clone $RepoUrl
}

Function QuickSave($Message) {
    git stash push -m $Message
    git checkout main
    git pull
}

Function FixMerge() {
    Write-Host "⚠️ Aborting merge and cleaning up..."
    git merge --abort
    git reset --hard
    git clean -fd
}

Function DeleteMyBranch($Branch) {
    $current = git rev-parse --abbrev-ref HEAD
    if ($Branch -eq $current) {
        Write-Host "❌ You cannot delete the current branch ($current)"
    } else {
        git branch -D $Branch
        git push origin --delete $Branch
    }
}

Function StashThenApply($Message) {
    git stash push -m $Message
    git stash pop
}

Function GitHelp() {
    Write-Host ""
    Write-Host "📘 Git Shortcuts Help – Natural Language Commands"
    Write-Host "---------------------------------------------------"
    Write-Host 'AddAndCommit "msg"         – Add all changes and commit with message'
    Write-Host 'CommitAndPush "msg"        – Add, commit, and push to current branch'
    Write-Host 'ReadyToPush "msg"          – Commit, rebase with remote, and push'
    Write-Host 'NewBranch "branch"         – Create and switch to a new branch'
    Write-Host 'SwitchToBranch "branch"    – Checkout/switch to a branch'
    Write-Host 'FetchLatest                – Fetch remote changes and rebase'
    Write-Host 'GitStart "msg" "branch" "remote" – Init, commit, and push to remote'
    Write-Host 'WhatIsTheStatus            – Show current git status'
    Write-Host 'WhatDidIDo                 – Show last commit details'
    Write-Host 'ShowCommits                – Pretty view of commit history'
    Write-Host 'UndoLastCommit             – Undo last commit (keep changes staged)'
    Write-Host 'NukeLastCommit             – Hard undo of last commit (discard changes)'
    Write-Host 'Unstage "file"             – Unstage a specific file'
    Write-Host 'ForcePush                  – Push changes forcefully (with lease)'
    Write-Host 'StashIt "msg"              – Stash current work with a message'
    Write-Host 'StashList                  – Show all saved stashes'
    Write-Host 'BringItBack                – Apply the latest stash'
    Write-Host 'GetTheCode "repo_url"      – Clone a git repo'
    Write-Host 'QuickSave "msg"            – Stash work, switch to main, pull'
    Write-Host 'FixMerge                   – Abort merge and reset working directory'
    Write-Host 'DeleteMyBranch "branch"    – Delete branch locally & remotely'
    Write-Host 'StashThenApply "msg"       – Stash and immediately apply stash'
    Write-Host 'GitHelp                    – Show this help guide'
    Write-Host ""
}
