FROM gfjardim/hamachi

# Install Haguichi
RUN add-apt-repository -y ppa:webupd8team/haguichi
RUN apt update
RUN apt install -y haguichi

# Copy Haguichi startup script
COPY startup.sh /etc/my_init.d/startup.sh

# Chack copied file. TODO: Remove this
RUN cat /etc/my_init.d/startup.sh