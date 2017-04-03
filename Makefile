NAME = factorio-stable
VERSION = 0.14.22_1

test:
	rspec spec
	docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi

build:
	docker build -t $(NAME):$(VERSION) .
	docker tag factorio-stable:$(VERSION) factoriohub.io:5000/factorio-stable:$(VERSION)

push:	push
	docker push factoriohub.io:5000/factorio-baseimage:$(VERSION)

