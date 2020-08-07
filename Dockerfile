FROM gfjardim/hamachi

# Install dependencies
RUN apt update
RUN apt install -y gtk-sharp2
RUN apt install -y build-essential
RUN apt install -y gettext
RUN apt install -y cmake
RUN apt install -y valac
RUN apt install -y libglib2.0-dev
RUN apt install -y libgtk-3-dev
RUN apt install -y libnotify-dev
RUN apt install -y mono-gmcs
RUN apt install -y libnotify-bin
RUN apt install -y monodoc-notify-sharp-manual
RUN apt install -y libnotify-cil-dev
RUN apt install -y libgconf2.0-cil
RUN apt upgrade -y
RUN apt install -y libglade2.0-cil-dev
RUN apt install -y gnome-sharp2
RUN apt install -y dbus
RUN apt install -y libndesk-dbus-glib1.0-cil-dev

# Download Haguichi
ADD https://launchpad.net/haguichi/1.0/1.0.23/+download/haguichi-1.0.23-clr4.0.tar.gz /haguichi/haguichi-1.0.23-clr4.0.tar.gz
RUN mkdir /haguichi/builder
RUN tar -xf /haguichi/haguichi-1.0.23-clr4.0.tar.gz -C /haguichi/builder/

# Build Old Haguichi Version
RUN mkdir /haguichi/builder/haguichi-1.0.23/build
WORKDIR /haguichi/builder/haguichi-1.0.23/
RUN ./configure
RUN make

# Verify
RUN make check

# Install Haguichi
RUN make install

# Clean Installation
RUN make clean

# Copy Haguichi startup script
COPY startup.sh /etc/my_init.d/startup.sh

# Chack copied file. TODO: Remove this
RUN cat /etc/my_init.d/startup.sh