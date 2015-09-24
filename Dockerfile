FROM ngparty/nodejs-base:0.9.17

MAINTAINER Mario Vejlupek <mario@vejlupek.cz>

LABEL Description="Nodejs 4.x and NPM 3.x image" Vendor="ngParty" Version="1.2"

# Use baseimage-docker's init system. see http://bit.ly/1j6tz0M
CMD ["/sbin/my_init"]

# Install Nodejs 4.x version
RUN mkdir /nodejs && \
  curl https://nodejs.org/dist/v4.1.1/node-v4.1.1-linux-x64.tar.xz | \
  tar xvJf - -C /nodejs --strip-components=1
ENV PATH $PATH:/nodejs/bin

# Update npm to 3.x version
RUN npm update npm -g

# Clean apt
RUN rm -rf /tmp/* /var/tmp/*
