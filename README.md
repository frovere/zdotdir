# zdotdir

Personal Zsh configuration for macOS, using:

- Homebrew
- [antidote](https://getantidote.github.io/) plugin manager
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt
- XDG-style config location (`$HOME/.config/zsh`)

Repository: https://github.com/frovere/zdotdir

## What This Repo Contains

- `.zshrc`, `.zprofile`, `.zshenv`: shell startup files
- `.zsh_plugins.txt`: antidote plugin bundle list
- `conf.d/*.zsh`: modular runtime config
- `functions/`: custom autoloaded zsh functions
- `themes/*.p10k.zsh`: Powerlevel10k theme variants
- `lib/antidote.zsh`: antidote bootstrap and bundle generation

## Assumptions

- You are on macOS.
- You have Homebrew installed.
- You want `ZDOTDIR` at `~/.config/zsh`.
- You use antidote from Homebrew (with git-clone fallback).
- You use Powerlevel10k.

## 1. Install Base Dependencies

```bash
brew update
brew install zsh git antidote powerlevel10k fnm fzf fd zoxide
```

Optional but recommended:

```bash
brew install eza bat ripgrep jq
```

Notes:

- `fnm` is initialized in `.zshrc`.
- `fd` is used by `FZF_DEFAULT_COMMAND` in `.zshenv`.
- `zoxide` and `fzf` are enabled via plugin config.
- If `prompt p10k ...` fails, add/uncomment `romkatv/powerlevel10k kind:fpath` in `.zsh_plugins.txt` and restart Zsh.

## 2. Clone This Repo

```bash
git clone https://github.com/frovere/zdotdir.git ~/.config/zsh
```

## 3. Bootstrap `~/.zshenv` (Home)

Zsh reads `~/.zshenv` first. If you relocate configs to `~/.config/zsh`, keep a tiny bootstrap file in `$HOME`:

```bash
cat > ~/.zshenv <<'EOF'
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
[[ -r "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
EOF
```

## 4. Ensure Zsh Is Your Login Shell

```bash
which zsh
chsh -s "$(which zsh)"
```

Log out/in after changing shell.

## 5. Install a Nerd Font for Powerlevel10k

Powerlevel10k themes in this repo expect a Nerd Font.

```bash
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

Then set your terminal font to **MesloLGS NF**.

## 6. First Launch

Start a new shell:

```bash
exec zsh
```

On first run:

- `lib/antidote.zsh` will load antidote.
- `.zsh_plugins.zsh` is generated from `.zsh_plugins.txt` when needed.
- Prompt is initialized with `prompt p10k rvr`.

## 7. Antidote Fallback (If Brew Formula Is Missing)

This repo expects antidote at:

- `${HOMEBREW_PREFIX:-/opt/homebrew}/opt/antidote/share/antidote`

If antidote is not available there, clone manually:

```bash
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/repos"
git clone https://github.com/mattmc3/antidote.git "${XDG_CACHE_HOME:-$HOME/.cache}/repos/antidote"
```

Then update `lib/antidote.zsh` and set:

```zsh
ANTIDOTE_REPO=${XDG_CACHE_HOME:-$HOME/.cache}/repos/antidote
```

## 8. Choosing a Prompt Theme

Current default in `conf.d/prompt.zsh`:

```zsh
prompt p10k rvr
```

Available theme files:

- `themes/rvr.p10k.zsh`
- `themes/lean.p10k.zsh`
- `themes/min.p10k.zsh`
- `themes/mmc.p10k.zsh`
- `themes/pure.p10k.zsh`

To switch, update the prompt line to another theme name and reload shell.

## 9. Updating Plugins

Edit `.zsh_plugins.txt`, then regenerate plugin snapshot:

```bash
rm -f ~/.config/zsh/.zsh_plugins.zsh
exec zsh
```

Or run antidote directly:

```bash
antidote bundle < ~/.config/zsh/.zsh_plugins.txt > ~/.config/zsh/.zsh_plugins.zsh
```

## 10. Local Machine Secrets and Overrides

Use local files for machine-specific secrets/tokens and keep them out of git.

Suggested approach:

- Create `conf.d/keys.local.zsh` locally.
- Add local-only patterns to `.gitignore` if needed.
- Never commit API tokens or private credentials.

## Troubleshooting

- `brew command not found`: install Homebrew from https://brew.sh.
- `Powerlevel10k not found in plugins`: ensure `romkatv/powerlevel10k` is present in `.zsh_plugins.txt`, then regenerate `.zsh_plugins.zsh`.
- Prompt icons look broken: confirm terminal font is a Nerd Font (MesloLGS NF recommended).
- Plugins not loading after edit: regenerate `.zsh_plugins.zsh` and restart shell.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
