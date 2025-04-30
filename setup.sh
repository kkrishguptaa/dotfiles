# Install XCode command line tools
xcode-select --install
# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# add extra-experimental-features = nix-command flakes to ~/.config/nix/nix.conf
echo "extra-experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

nix flake update --flake ~/dotfiles/nix

# install nix-darwin
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- boot --flake ~/dotfiles/nix#darwinConfigurations.mac.system
