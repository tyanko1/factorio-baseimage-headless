NAME = factorio-baseimage
VERSION = 0.13.17_1

build:
	docker build -t $(NAME):$(VERSION) .

test:
	rspec spec
	docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
