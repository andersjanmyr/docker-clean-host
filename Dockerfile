FROM alpine:latest
MAINTAINER Anders Janmyr <anders@janmyr.com>

ADD ./docker-clean-up.sh /
ADD https://get.docker.com/builds/Linux/x86_64/docker-latest /usr/bin/docker
RUN chmod a+x /usr/bin/docker

ENV INTERVAL 3600
CMD ["./docker-clean-up.sh"]
