1. Install Nix cia the recommended multi-user installation following instructions [here](https://nixos.org/download)
2. Clone repo in ~/.config directory
```
git clone https://github.com/ainharan/home-manager.git ~/.config/home-manager
```
3. Enable experimental-features = in your nix config file to
```
mkdir -p ~/.config/nix
cat <<EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```
4. Restart the nix daemon for this change to be picked up (MacOS)
```
sudo launchctl kickstart -k system/org.nixos.nix-daemon
```

5. Let home-manager set up
```
cd ~/.config/home-manager && nix run . switch
```
