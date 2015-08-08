#!/bin/bash

PORT=32400
CONTAINER="plex_media_server"
LIBRARY_DIR=/docker-plex

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
  echo "$CONTAINER does not exist. Starting a new one."
  docker run -it -d --net="host" --name=$CONTAINER -p $PORT:32400 -v $LIBRARY_DIR:/Library -v $1:/data ekiourk/plex && \
  sleep 1 && \
  firefox http://localhost:$PORT/web/index.html
  exit 0
fi

if [ "$RUNNING" == "false" ]; then
  echo "Starting existing $CONTAINER."
  docker start $CONTAINER && \
  sleep 1 && \
  firefox http://localhost:$PORT/web/index.html
  exit 0
fi

echo "$CONTAINER is already running."
exit 0

