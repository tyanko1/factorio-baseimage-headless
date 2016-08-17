NAME = factorio-baseimage
VERSION = 0.13.2_1

build:
	docker build -t $(NAME):$(VERSION) .

test:
	rspec spec
