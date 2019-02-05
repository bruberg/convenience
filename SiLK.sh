#!/bin/bash

FIXBUF=2.0.0
YAF=2.10.0
SILK=3.17.1

apt -y install libgnutls28-dev doxygen libglib2.0-dev libpcap-dev python-dev build-essential

BASEDIR=`pwd`

test -e libfixbuf-${FIXBUF}.tar.gz || wget https://tools.netsa.cert.org/releases/libfixbuf-${FIXBUF}.tar.gz
test -e yaf-${YAF}.tar.gz || wget https://tools.netsa.cert.org/releases/yaf-${YAF}.tar.gz
test -e silk-${SILK}.tar.gz || wget https://tools.netsa.cert.org/releases/silk-${SILK}.tar.gz

test -d libfixbuf-${FIXBUF} || tar zxvf libfixbuf-${FIXBUF}.tar.gz
test -d yaf-${YAF} || tar zxvf yaf-${YAF}.tar.gz
test -d silk-${SILK} || tar zxvf silk-${SILK}.tar.gz

cd ${BASEDIR}/libfixbuf-${FIXBUF}/ && ./configure && make && make install && ldconfig

cd ${BASEDIR}/yaf-${YAF}/ && ./configure --enable-localtime --enable-applabel --enable-entropy && make && make install && ldconfig

cd ${BASEDIR}/silk-${SILK} && ./configure --with-libfixbuf=/usr/local/lib/pkgconfig/ --with-python --enable-ipv6 --enable-localtime --enable-data-rootdir=/srv/silk/data && make && make install && ldconfig





