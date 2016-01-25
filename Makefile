NAME=andersjanmyr/clean-host
VERSION = 1.0.0

.PHONY: docker-build
docker-build:
	docker build --tag $(NAME):$(VERSION) .


.PHONY: docker-run
docker-run:
	docker run --name clean -it -v /var/run/docker.sock:/var/run/docker.sock -v $(shell which docker):/usr/bin/docker --env INTERVAL=20 --rm $(NAME):$(VERSION)


docker-debug:
	docker run --name clean -it -v /var/run/docker.sock:/var/run/docker.sock -v $(shell which docker):/usr/bin/docker --env INTERVAL=20 --rm $(NAME):$(VERSION) sh
