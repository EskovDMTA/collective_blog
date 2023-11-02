setup: install

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views

.PHONY: test
