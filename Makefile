.PHONY: dev
dev:
	bundle exec jekyll serve

.PHONY: build
build:
	JEKYLL_ENV=production \
	  bundle exec jekyll build

.PHONY: clean
clean:
	rm -rf _site
