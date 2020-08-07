FROM ubuntu:xenial

# Environment Vars
ENV DEBIAN_FRONTEND noninteractive

# Update Packages and Dependencies
RUN apt update
RUN apt upgrade -y
RUN apt install -y software-properties-common dbus dbus-x11

# Add Systemd
RUN apt install -y systemd systemd-sysv
RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

# Hamachi Instalation
RUN mkdir /hamachi
ADD https://www.vpn.net/installers/logmein-hamachi_2.1.0.203-1_amd64.deb /hamachi/logmein-hamachi_2.1.0.203-1_amd64.deb
WORKDIR /hamachi/
RUN dpkg -i logmein-hamachi_2.1.0.203-1_amd64.deb

# Haguichi Installation
RUN add-apt-repository -y ppa:webupd8team/haguichi
RUN apt update
RUN apt install -y haguichi

# Configure Haguichi
RUN echo Ipc.User $USER >> /var/lib/logmein-hamachi/h2-engine-override.cfg

CMD ["/lib/systemd/systemd"]