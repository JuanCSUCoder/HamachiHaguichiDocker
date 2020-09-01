# Hamachi + Haguichi in Docker ![GitHub](https://img.shields.io/github/license/JCSUCoder/HamachiHaguichiDocker) ![GitHub forks](https://img.shields.io/github/forks/JCSUCoder/HamachiHaguichiDocker?style=social) ![GitHub stars](https://img.shields.io/github/stars/JCSUCoder/HamachiHaguichiDocker?style=social) 
Since Hamachi is made for old versions of Ubuntu and CentOS, here is a little workaround to make it work properly on every linux system, with Haguichi as the graphical frontend to use it.

**GUI only works in X server**

To pull:
```shell
docker pull juancsucoder/hamachihaguichi
```

To build:

```shell
git clone https://github.com/JCSUCoder/HamachiHaguichiDocker.git
cd HamachiHaguichiDocker
docker build . -t juancsucoder/hamachihaguichi
```

To run use:

```shell
docker run -d --name="HamachiHaguichi" --privileged="true" -v "/etc/localtime":"/etc/localtime":ro --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --env="DISPLAY" --net=host juancsucoder/hamachihaguichi
```

To open GUI:

```shell
docker exec HamachiHaguichi haguichi
```

