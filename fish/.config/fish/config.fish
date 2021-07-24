set -gx PATH $PATH ~/fvm/default/bin ~/.pub-cache/bin /usr/local/share ~/Git/depot_tools /Applications/MacVim.app/Contents/bin ~/go/bin /usr/local/bin/ /opt/local/bin /Volumes/case-sensitive/esp-open-sdk/xtensa-lx106-elf/bin /Applications/mCRL2.app/Contents/bin
#set -gx FLUTTER_FRAMEWORK_DIR $FLUTTER_FRAMEWORK_DIR /usr/local/flutter/bin/cache/artifacts/engine/ios 
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/pieter/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/pieter/.ghcup/bin $PATH

# NeoVim as manpager
set -x MANPAGER "nvim -c 'set ft=man' -"
set -x EDITOR "nvim"
