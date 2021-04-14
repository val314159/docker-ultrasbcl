
run: build
	docker run --rm -it t

build: slime.git
	docker build  .  -t t

slime.git:
	git clone https://github.com/slime/slime.git slime.git

