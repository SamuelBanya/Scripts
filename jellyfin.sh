#!/bin/bash
docker run -d \
 --name jellyfin \
 --user 1000:1000 \
 --device /dev/dri/renderD128:/dev/dri/renderD128 \ # CUSTOM CONFIG: For Hardware Acceleration
 --device /dev/dri/card0:/dev/dri/card0 \ # CUSTOM CONFIG: For Hardware Acceleration
 --net=host \
 --volume /home/sam/jellyfin/config:/config \ # Alternatively --volume jellyfin-config:/config
 --volume /home/sam/jellyfin/cache:/cache \ # Alternatively --volume jellyfin-cache:/cache
 --mount type=bind,source=/media/REDHDD/Movies,target=/media \
 --restart=unless-stopped \
 jellyfin/jellyfin
