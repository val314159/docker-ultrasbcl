#!/bin/bash -ex
VER=21.01.14.108
DEB=roswell_${VER}-1_amd64.deb
apt-get -y update && apt-get -y upgrade
apt-get install -y libssl-dev libcurl3 apt-utils man sudo \
	make wget bzip2 libyaml-0-2 rlwrap emacs-nox libreadline-dev
wget https://github.com/roswell/roswell/releases/download/v${VER}/${DEB}
dpkg -i ${DEB} && rm ${DEB} && apt-get clean
ros install quicklisp-slime-helper hunchentoot hunchensocket cl-who parenscript
ros run -e '(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)' -q
mkdir -p ~/common-lisp && ros install val314159/ly val314159/r2
cp ~/.roswell/local-projects/val314159/r2/roswell/r2.ros lisp.ros
ros build lisp.ros && mv lisp /usr/bin
