
run: build
	docker run --rm -it -v ${HOME}/src:/root/common-lisp t
#	docker run --rm -it --user val t

build: quicklisp.lisp
	docker build  .  -t t

quicklisp.lisp:
	wget http://beta.quicklisp.org/quicklisp.lisp

clean:
	rm -fr quicklisp.lisp
	tree .
