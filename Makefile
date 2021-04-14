
run: build
	docker run --rm -it t

build: quicklisp.lisp
	docker build  .  -t t

quicklisp.lisp:
	wget http://beta.quicklisp.org/quicklisp.lisp

clean:
	rm -fr quicklisp.lisp
	tree .
