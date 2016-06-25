NAME = factorio-baseimage
VERSION = 0.1.0_1

build:
	docker build -t $(NAME):$(VERSION) . 

test:
	bundle exec rake spec
