install:
	bundle install

clean:
	rm -f cookbooks.tar.gz

test:
	bundle exec rubocop
	bundle exec foodcritic -f any -- .

bump:
	bundle exec thor version:bump auto -d patch

artifact:
	bundle exec berks package cookbooks.tar.gz

upload:
	bundle exec blo install cookbooks.tar.gz

release:
	make clean
	make artifact
	make upload
