DOPTS=-v ${HOME}/src:/root/common-lisp -p 4242:4242 -p 4243:4243

run: build
	docker run --rm -it ${DOPTS} t

build:
	docker build  .  -t t
