NAME = factorio-baseimage
VERSION = 0.14.1_1

test:
	rspec spec
	docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi

build:  test
	docker build -t $(NAME):$(VERSION) .
	docker tag factorio-baseimage:$(VERSION) factoriohub.io:5000/factorio-baseimage:$(VERSION)

push:	push
	docker push factoriohub.io:5000/factorio-baseimage:$(VERSION)

