# debian-setting-shell
(if you want, make your disrtibution "sid")
## set sudo
```sh
su -
visudo
```

## sid
```sh
sudo nano /etc/apt/sources.list
```
3 つ目のフィールドをsidに
セキュリティ関連のものは削除する
![](./list.png)

```sh
sudo apt full-upgrade
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


