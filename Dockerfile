FROM ubuntu:14.04

MAINTAINER Ilias Kiourktsidis "ekiourk@gmail.com"

RUN apt-get update && apt-get install -y\
  curl

RUN curl -L -O https://downloads.plex.tv/plex-media-server/0.9.12.8.1362-4601e39/plexmediaserver_0.9.12.8.1362-4601e39_amd64.deb

RUN dpkg -i plexmediaserver_0.9.12.8.1362-4601e39_amd64.deb && rm plexmediaserver_0.9.12.8.1362-4601e39_amd64.deb

ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS 6
ENV PLEX_MEDIA_SERVER_HOME /usr/lib/plexmediaserver
ENV PLEX_MEDIA_SERVER_MAX_STACK_SIZE 3000
ENV PLEX_MEDIA_SERVER_TMPDIR /tmp
ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR /Library/Application Support
ENV LD_LIBRARY_PATH $PLEX_MEDIA_SERVER_HOME
ENV TMPDIR /tmp

RUN mkdir -p $PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR

RUN ulimit -s $PLEX_MAX_STACK_SIZE

WORKDIR $PLEX_MEDIA_SERVER_HOME

RUN mv Plex\ Media\ Server plex_media_server

CMD ["./plex_media_server"]

