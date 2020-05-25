FROM     python:3.6-alpine

# Data and config volumes
VOLUME   /root/.flexget
VOLUME   /root/torrents

# Install FlexGet
# RUN      set|grep proxy
RUN ping -c3 google.com
RUN      pip3 -vv install -U pip && pip3 install flexget

# Add start script
COPY     start.sh /root/
RUN      chmod +x ./start.sh

USER     flexget
CMD      ["./start.sh"]
