#
# Editors
#

export EDITOR="${EDITOR:-hx}"
export VISUAL="${VISUAL:-code}"
export PAGER="${PAGER:-less}"
export GIT_EDITOR="${EDITOR:-hx}"

#
# Language
#

if [[ -z "$LANG" ]]; then
  if [[ "$OSTYPE" == darwin* ]]; then
    export LANG='en_US.UTF-8'
  else
    export LANG='es_ES.UTF-8'
  fi
fi

if [[ -z "$LC_ALL" ]]; then
  if [[ "$OSTYPE" == darwin* ]]; then
    export LC_ALL='en_US.UTF-8'
  else
    export LC_ALL='es_ES.UTF-8'
  fi
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $ANDROID_HOME/emulator(N)
  $ANDROID_HOME/tools(N)
  $ANDROID_HOME/tools/bin(N)
  $ANDROID_HOME/platform-tools(N)
  "$HOME/Library/Application Support/Herd/bin"(N)
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"(N)
  ${XDG_CONFIG_HOME:-$HOME}/composer/vendor/bin(N)
  $PNPM_HOME(N)
  $HOME/.local/{,s}bin(N)
  $HOME/.maestro/bin(N)
  $HOME/{,s}bin(N)
  /{usr/local,opt/homebrew}/opt/python/libexec/bin(N)
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  /{usr/local,opt/homebrew}/opt/fzf/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)


# Homebrew managed shell completions: https://docs.brew.sh/Shell-Completion
# https://github.com/mattmc3/zephyr/blob/main/plugins/homebrew/homebrew.plugin.zsh
# `autoload -Uz compinit; compinit` handled by antidote plugin:`mattmc3/ez-compinit`.
fpath=(
  $ZDOTDIR/.zfunctions(-/FN)
  $fpath
)
