

```conf
experimental-features = nix-command flakes
trusted-users = root kkrishguptaa
```

```sh
sudo nix shell cachix --command cachix use nix-community
```

```sh
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake ~/.dotfiles#mac
```
