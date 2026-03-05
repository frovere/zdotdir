# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HISTORY_IGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:ll:pwd:echo:kill"

# Set Zsh location vars.
ZSH_CONFIG_DIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

# Zsh options.
setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

# Lazy-load (autoload) Zsh function files from a directory.
for _fndir in $ZSH_CONFIG_DIR/functions(/FN) $ZSH_CONFIG_DIR/functions/*(/FN); do
  fpath=($_fndir $fpath)
  autoload -Uz $_fndir/*~*/_*(N.:t)
done
unset _fndir

# Source zstyles you might use with antidote.
[[ -r $ZSH_CONFIG_DIR/.zstyles ]] && source $ZSH_CONFIG_DIR/.zstyles

# Create an amazing Zsh config using antidote plugins.
source $ZSH_CONFIG_DIR/lib/antidote.zsh
#source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh
#antidote load

eval "$(fnm env --use-on-cd --shell zsh)" > /dev/null 2>&1

# Source conf.d.
for _rc in $ZSH_CONFIG_DIR/conf.d/*.zsh; do
  # ignore files that begin with ~
  [[ "${_rc:t}" != '~'* ]] || continue
  source "$_rc"
done
unset _rc


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Herd injected NVM configuration
# export NVM_DIR="/Users/felipe/Library/Application Support/Herd/config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
# export PATH="/Users/felipe/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/felipe/Library/Application Support/Herd/config/php/85/"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/felipe/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/felipe/Library/Application Support/Herd/config/php/83/"
