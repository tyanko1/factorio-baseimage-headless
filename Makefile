NAME = factorio-baseimage
VERSION = 0.1.0_1

build:
	docker build -t $(NAME):$(VERSION) --rm image

test:
	bundle exec rake spec
