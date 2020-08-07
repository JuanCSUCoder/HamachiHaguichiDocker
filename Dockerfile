FROM ubuntu:xenial

# Update Packages and Dependencies
RUN apt update
RUN apt upgrade -y
RUN apt install -y software-properties-common dbus dbus-x11

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

# Add entrypoint.sh and Set Permissions
COPY entrypoint.sh /hamachi/entrypoint.sh
RUN chmod a+x /hamachi/entrypoint.sh

ENTRYPOINT [ "/hamachi/entrypoint.sh" ]
CMD [ "haguichi" ]