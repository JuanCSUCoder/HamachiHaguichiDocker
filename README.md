# Hamachi + Haguichi in Docker
Since Hamachi is made for old versions of Ubuntu and CentOS, here is a little workaround to make it work properly on every linux system, with Haguichi as the graphical frontend to use it.

To build:

```shell
git clone https://github.com/JCSUCoder/HamachiHaguichiDocker.git
cd HamachiHaguichiDocker
docker build . -t HamachiHaguichi
```

To run use:

```shell
docker run --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --env="DISPLAY" --net=host HamachiHaguichi
```

