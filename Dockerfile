FROM alpine:latest
MAINTAINER Anders Janmyr <anders@janmyr.com>

ADD ./docker-clean-up.sh /

ENV INTERVAL 3600
CMD ["./docker-clean-up.sh"]
