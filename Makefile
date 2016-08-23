NAME = factorio-baseimage
VERSION = 0.13.17_1

test:
	rspec spec
	docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi

build:  test
	docker build -t $(NAME):$(VERSION) .

