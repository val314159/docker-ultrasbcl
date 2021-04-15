FROM debian:9
MAINTAINER Joel Ward <jmward@gmail.com>
ENV HOME /root
ENV VER 21.01.14.108
ENV DEB roswell_${VER}-1_amd64.deb
ENV PFX https://github.com/roswell/roswell/releases/download
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y libssl-dev libcurl3 \
  sbcl make wget bzip2 libyaml-0-2 rlwrap emacs-nox libreadline-dev ecl && \
 wget ${PFX}/v${VER}/${DEB} && dpkg -i ${DEB} && rm ${DEB} && apt-get clean
ADD quicklisp.lisp install.lisp /tmp/
RUN cd /tmp && sbcl --script install.lisp && rm /tmp/*.lisp
RUN ros install parenscript hunchentoot hunchensocket cl-who
WORKDIR ${HOME}/common-lisp
ADD root /root/
