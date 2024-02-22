PROJECT := $(shell basename $$PWD)

console:
	bundle exec rake console
.PHONY: console

test:
	bundle exec rake
.PHONY: test

build:
	bundle exec rake build
.PHONY: build

push:
	gem push pkg/*.gem
.PHONY: push
