#!/bin/sh

mv atleta/ ../
mkdir atleta
rm -rf .git/

HOST='ftp.thebikeinbox.com.br' 
USER='destrava@thebikeinbox.com.br'
PASS='spider'
HDIR="/"
LDIR=$(pwd)

echo $LDIR

ncftpput -R -v -u $USER -p $PASS $HOST $HDIR $LDIR

cd ..
mv atleta/ maps/
cd maps/