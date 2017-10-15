# Adaptation from https://hub.docker.com/r/ixilon/qgis/~/dockerfile/
FROM ubuntu:16.04
MAINTAINER Luiz Motta <motta.luiz@gmail.com>

RUN echo "deb     http://qgis.org/ubuntugis-nightly-release xenial main" >> /etc/apt/sources.list
RUN echo "deb-src http://qgis.org/ubuntugis-nightly-release xenial main" >> /etc/apt/sources.list
RUN echo "deb     http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list

# Keys from 2017-10-15 - qgis and ubuntugis
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 089EBE08314DF160

RUN apt-get update && \
    apt-get install -y qgis python-qgis qgis-plugin-grass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD qgis
