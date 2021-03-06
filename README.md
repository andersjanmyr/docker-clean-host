# Docker clean-host

Removes old images and containers from the host.

The container accepts an `INTERVAL` environment variable with the number of
seconds to sleep before recurring.

[![](https://images.microbadger.com/badges/image/andersjanmyr/docker-clean-host.svg)](https://microbadger.com/images/andersjanmyr/docker-clean-host "Get your own image badge on microbadger.com")

## Run

```
# Start the container with access to the docker bin and docker.sock
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  andersjanmyr/docker-clean-host
```


## Implementation

The commands run are:

```
docker rmi $(docker images -q)
docker rm -v $(docker ps -qa --no-trunc)
```

