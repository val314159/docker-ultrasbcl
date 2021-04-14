FROM debian:9
MAINTAINER Joel Ward <jmward@gmail.com>
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
 sbcl make wget bzip2 libyaml-0-2 rlwrap emacs-nox libreadline-dev ecl \
 && apt-get clean
ENV HOME /root
WORKDIR ${HOME}
RUN wget http://beta.quicklisp.org/quicklisp.lisp -P /tmp
ADD install.lisp /tmp/install.lisp
RUN cd /tmp && sbcl --script install.lisp && rm /tmp/*lisp
ADD .emacs ${HOME}/
ADD slime  ${HOME}/slime

