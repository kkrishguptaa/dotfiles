# Install XCode command line tools
# xcode-select --install
# Install nix
# sh <(curl -L https://nixos.org/nix/install) --daemon
# Install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo "experimental-features = nix-command flakes\ntrusted-users = root kkrishguptaa" | sudo tee -a /etc/nix/nix.conf > /dev/null

sudo nix shell cachix --command cachix use nix-community

nix flake update --flake ~/.dotfiles

nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake ~/.dotfiles#mac