
run: build
	docker run --rm -it t

build: slime
	docker build  .  -t t

slime:
	git clone https://github.com/slime/slime
