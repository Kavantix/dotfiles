set -gx PATH /opt/usr/bin /Users/pieter/Library/Python/3.8/bin /opt/homebrew/bin ~/fvm/default/bin ~/.pub-cache/bin /usr/local/share ~/Git/depot_tools /Applications/MacVim.app/Contents/bin ~/go/bin /usr/local/bin/ /opt/local/bin /Volumes/case-sensitive/esp-open-sdk/xtensa-lx106-elf/bin /Applications/mCRL2.app/Contents/bin $PATH
set -gx GO111MODULE on
set -gx SHELL (which fish)
#set -gx FLUTTER_FRAMEWORK_DIR $FLUTTER_FRAMEWORK_DIR /usr/local/flutter/bin/cache/artifacts/engine/ios 
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/pieter/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/pieter/.ghcup/bin $PATH

# NeoVim as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"
set -x MANPAGER "bat"
set -x EDITOR "nvim"

#aliases
alias uja="cd ~/git/uj_apps"
alias ujav="cd ~/git/uj_apps; and nvim"
alias ujb="cd ~/git/uj-api-backend-frontend"
alias ujbv="cd ~/git/uj-api-backend-frontend; and nvim"
alias dotfiles="cd ~/git/dotfiles"
alias dotfilesv="cd ~/git/dotfiles; and nvim"
alias lg="lazygit"
alias spotlighton="sudo mdutil -a -i on"
alias spotlightoff="sudo mdutil -a -i off"
alias kitty="kitty -1"
alias b64="read | base64"
alias cb64="read | base64 | pbcopy"
alias d64="read | base64 -d"
alias cd64="read | base64 -d | pbcopy"
