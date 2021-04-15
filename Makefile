
run: build
	docker run --rm -it -v ${HOME}/src:/root/common-lisp -p 4242:4242 -p 4243:4243 t
#	docker run --rm -it --user val t

build:
	docker build  .  -t t

clean:
	rm -fr quicklisp.lisp
	tree .
