# debian-setting-shell
## pre-configuration
- debian install
  - if you want to use GNOME, install GNOME at "Software seection"
  - if you want to use Hyprland, don't install any debian desktop environment but install standard system utilities 
- after install, change /etc/apt/sources.list and set `sid` to third field of each list.
  ![](./list.png)
  after that, start upgrade and reboot
  ```sh
  sudo apt full-upgrade
  ```
- install git
  ```sh
  sudo apt install git
  ```
- if needed, add your user to sudoers list
  ```sh
  su -
  visudo
  ```

## GNOME
```sh
cd ./gdm
sh do1.sh
```

```sh
sh do2.sh
```

## Hyprland
- make directory and clone
  ```sh
  cd ~
  mkdir -p Documents
  cd Documents
  git clone https://github.com/Kashiwade-music/debian-dotfiles.git
  cd debian-dotfiles
  ```
- run
  
