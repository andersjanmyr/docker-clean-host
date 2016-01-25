NAME=docker-clean-host

.PHONY: docker-build
docker-build:
	docker build --tag $(NAME):latest .


.PHONY: docker-run
docker-run:
	docker run --name clean -it -v /var/run/docker.sock:/var/run/docker.sock --env INTERVAL=20 --rm $(NAME)


docker-debug:
	docker run --name clean -it -v /var/run/docker.sock:/var/run/docker.sock --env INTERVAL=20 --rm $(NAME) sh

