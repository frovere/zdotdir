#!/usr/bin/env zsh
# Load zmv (batch file renaming)

zstyle -T ':zsh_custom:plugin:zmv' 'enabled' && \
  autoload -Uz zmv
