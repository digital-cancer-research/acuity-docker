#!/usr/bin/env sh
apk update
apk add make
apk add gcc
apk add wget
apk add linux-headers
apk add libc-dev
wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
tar -xvzf openssl-1.1.1k.tar.gz
rm openssl-1.1.1k.tar.gz
cd openssl-1.1.1k
./config
make install
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64" >> ~/.bashrc
openssl version
