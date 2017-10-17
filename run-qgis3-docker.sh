# Adaptation from https://hub.docker.com/r/kartoza/qgis-desktop/
xhost +
# Users home is mounted as home
# --rm will remove the container as soon as it ends

docker run --rm --name="qgis" \
    -i -t \
    -v ${HOME}:/home/${USER} \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    qgis3
xhost -
