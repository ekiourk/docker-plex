# docker-plex
Plex Media Server running inside docker

### Base Docker Image

* [ubuntu:14:04](https://registry.hub.docker.com/u/library/ubuntu/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [docker image](https://registry.hub.docker.com/u/ekiourk/plex/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull ekiourk/plex`

   (alternatively, you can build an image from Dockerfile: `docker build -t plex github.com/ekiourk/docker-plex`)

### Usage

##### Start a plex media server.
Run the following command and then visit http://localhost:32400/web on a browser

`docker run -it -p 32400:32400 ekiourk/plex`

##### Use local media library and persist plex configuration
1. Go to the directory where your media files are located.

2. Run `docker run -it -d --net="host" -p 32400:32400 -v /docker-plex:/Library -v $PWD:/data ekiourk/plex`

Inside /docker-plex will be persist all the plex media server configuration files.

##### Use the run.sh script.
Assuming that your media files are on /home/Videos. Run the script by passing the path of the media directory

`./run.sh /home/Videos`

