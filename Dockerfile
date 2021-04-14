FROM debian:9
MAINTAINER Joel Ward <jmward@gmail.com>
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
 sbcl make wget bzip2 libyaml-0-2 rlwrap emacs-nox libreadline-dev ecl \
 && apt-get clean
ENV HOME /root
WORKDIR ${HOME}
ADD quicklisp.lisp install.lisp /tmp/
RUN cd /tmp && sbcl --script install.lisp && rm /tmp/*.lisp
ADD root /root/
#ADD slime  ${HOME}/slime
