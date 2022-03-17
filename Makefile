haunt: 
	haunt build

serve:
	haunt serve --watch

deploy: haunt
	git subtree push --prefix docs origin gh-pages
