#!/bin/sh

set -o errexit

interval=${INTERVAL:-3600} # 1 hour is default

main() {
  while true
  do
    echo "Cleaning host..."
    remove_containers
    remove_images
    echo "Sleeping... $interval seconds"
    sleep $interval
  done
}

remove_images() {
  local images=$(docker images -q)

  if [ -n "$images" ]; then
    echo "$Removing images $images"
    docker rmi $images || true
  fi
}

remove_containers() {
  local containers=$(docker ps -qa --no-trunc)

  if [ -n "$containers" ]; then
    echo "$Removing containers $containers"
    docker rm -v $containers || true
  fi
}

main
