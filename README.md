# debian-setting-shell

## 1. set sudo
```sh
su -
visudo
```

## 2. sid
```sh
sudo nano /etc/apt/sources.list
```
3 つ目のフィールドをsidに
セキュリティ関連のものは削除する
![](./list.png)


```sh
sudo apt full-upgrade
```

## 3. install git and clone
```sh
sudo apt update
sudo apt install git

# if gdm installed
cd ドキュメント
git clone https://github.com/Kashiwade-music/debian-dotfiles.git
```

## for gnome desktop

```sh
cd ./gdm
sh do1.sh
```

```sh
sh do2.sh
```

## for swaydm
- install debian with no desktop manager
  - but install 標準システムユーティリティ (standard system utilities)


