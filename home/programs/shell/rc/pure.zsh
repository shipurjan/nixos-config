# https://github.com/sindresorhus/pure

autoload -U promptinit; promptinit

# The max execution time of a process before its run time is shown when it exits.
PURE_CMD_MAX_EXEC_TIME=5

# Prevents Pure from checking whether the current Git remote has been updated.
PURE_GIT_PULL=1

# Do not include untracked files in dirtiness check.
# Mostly useful on large repos (like WebKit).
PURE_GIT_UNTRACKED_DIRTY=1

# Time in seconds to delay git dirty checking when git status takes > 5 seconds.
PURE_GIT_DELAY_DIRTY_CHECK=1800

# Defines the prompt symbol.
PURE_PROMPT_SYMBOL=$

# Defines the prompt symbol used when the vicmd keymap is active (VI-mode).
PURE_PROMPT_VICMD_SYMBOL=:

# Defines the git down arrow symbol.
PURE_GIT_DOWN_ARROW=⇣

# Defines the git up arrow symbol.
PURE_GIT_UP_ARROW=⇡

# Defines the git stash symbol.
PURE_GIT_STASH_SYMBOL=≡

# Colors
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# ┌────────────────────────────────────────────────────── user
# │      ┌─────────────────────────────────────────────── host
# │      │           ┌─────────────────────────────────── path
# │      │           │          ┌──────────────────────── git:branch
# │      │           │          │     ┌────────────────── git:dirty
# │      │           │          │     │ ┌──────────────── git:action
# │      │           │          │     │ │        ┌─────── git:arrow
# │      │           │          │     │ │        │ ┌───── git:stash
# │      │           │          │     │ │        │ │ ┌─── execution_time
# │      │           │          │     │ │        │ │ │
# zaphod@heartofgold ~/dev/pure master* rebase-i ⇡ ≡ 42s
# venv ❯
# │    │
# │    └───────────────────────────────────────────────── prompt
# └────────────────────────────────────────────────────── virtualenv (or prompt:continuation)

# The execution time of the last command when exceeding PURE_CMD_MAX_EXEC_TIME
zstyle :prompt:pure:execution_time color yellow
# For PURE_GIT_UP_ARROW and PURE_GIT_DOWN_ARROW
zstyle :prompt:pure:git:arrow color cyan
# For PURE_GIT_STASH_SYMBOL
zstyle :prompt:pure:git:stash color cyan
# The name of the current branch when in a Git repository
zstyle :prompt:pure:git:branch color 242
# The name of the current branch when the data isn't fresh
zstyle :prompt:pure:git:branch:cached color red
# The current action in progress (cherry-pick, rebase, etc.) when in a Git repository
zstyle :prompt:pure:git:action color 242
# The asterisk showing the branch is dirty
zstyle :prompt:pure:git:dirty color 218
# The hostname when on a remote machine
zstyle :prompt:pure:host color 242
# The current path, for example, PWD
zstyle :prompt:pure:path color blue
# The PURE_PROMPT_SYMBOL when the previous command has failed
zstyle :prompt:pure:prompt:error color red
# The PURE_PROMPT_SYMBOL when the previous command has succeeded
zstyle :prompt:pure:prompt:success color magenta
# The color for showing the state of the parser in the continuation prompt (PS2).
# It's the pink part in this
# [screenshot](https://user-images.githubusercontent.com/147409/70068574-ebc74800-15f8-11ea-84c0-8b94a4b57ff4.png),
# it appears in the same spot as virtualenv.
# You could for example matching both colors so that Pure has a uniform look
zstyle :prompt:pure:prompt:continuation color 242
# The ✦ symbol indicates that jobs are running in the background
zstyle :prompt:pure:suspended_jobs color red
# The username when on remote machine
zstyle :prompt:pure:user color 242
# The username when the user is root
zstyle :prompt:pure:user:root color default
# The name of the Python virtualenv when in use
zstyle :prompt:pure:virtualenv color 242

# Other options
zstyle :prompt:pure:git:stash show yes

prompt pure
