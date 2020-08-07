FROM gfjardim/hamachi

# Install dependencies
RUN apt update
RUN apt install -y build-essential gettext cmake valac libglib2.0-dev libgtk-3-dev libnotify-dev

# Download Haguichi
ADD https://launchpad.net/haguichi/1.3/1.3.1/+download/haguichi-1.3.1.tar.xz /tmp/haguichi-1.3.1.tar.xz
RUN mkdir /tmp/builder
RUN tar -xf /tmp/haguichi-1.3.1.tar.xz -C /tmp/builder/

# Install Haguichi
RUN sudo make install

# Build Old Haguichi Version
RUN mkdir /tmp/builder/build
WORKDIR /tmp/builder/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr
RUN make

# Copy Haguichi startup script
COPY startup.sh /etc/my_init.d/startup.sh

# Chack copied file. TODO: Remove this
RUN cat /etc/my_init.d/startup.sh