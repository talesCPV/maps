
#!/bin/sh

cd ..
rm -rf .git/

HOST='ftp.thebikeinbox.com.br' 
USER='destrava@thebikeinbox.com.br'
PASS='spider'
HDIR="/"
#LDIR='/opt/lampp/htdocs/maps/'
LDIR=$(pwd)

echo $LDIR

ncftpput -R -v -u $USER -p $PASS $HOST $HDIR $LDIR
