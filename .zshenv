#
# Defines environment variables.
#

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk
export ANDROID_NDK=$ANDROID_NDK_HOME/27.1.12297006

# export NODE_BINARY=$HOME/.local/share/fnm/aliases/default/bin

source $ZDOTDIR/functions/load-brew

export PNPM_HOME="$HOME/.local/share/pnpm"
export NODE_COMPILE_CACHE=$HOME/Library/Caches/nodejs-compile-cache

export FZF_DEFAULT_COMMAND='fd --type f'

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
