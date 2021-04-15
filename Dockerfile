FROM debian:9
MAINTAINER Joel Ward <jmward@gmail.com>
ENV VER 21.01.14.108
ENV DEB roswell_${VER}-1_amd64.deb
ENV PFX https://github.com/roswell/roswell/releases/download
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y libssl-dev libcurl3 \
  make wget bzip2 libyaml-0-2 rlwrap emacs-nox libreadline-dev man sudo && \
 wget ${PFX}/v${VER}/${DEB} && dpkg -i ${DEB} && rm ${DEB} && apt-get clean && \
 ros install quicklisp-slime-helper hunchentoot hunchensocket cl-who parenscript && \
 ros run -e '(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)' -q
EXPOSE 4242 4243
ENV HOME /root
RUN mkdir -p ${HOME}/common-lisp
WORKDIR      ${HOME}/common-lisp
ADD root     ${HOME}/
