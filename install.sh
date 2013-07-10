#!/bin/sh

DIR_BASE=$( cd $(dirname $0) ; pwd )
DIR_SKELETON=$DIR_BASE/homedir

echo "Linking configuration files..."
ls -A $DIR_SKELETON | xargs -n 1 -I R ln -nfs $DIR_SKELETON/R ~/R
echo "DONE"
echo

echo "Checking for unchanged Git options..."
EMAIL_MATCHES=$(grep -c '<email>' ~/.gitconfig)
if [ $EMAIL_MATCHES -gt 0 ]
then
    echo -n "Email: "
    read EMAIL
    sed -i '' -e "s/<email>/$EMAIL/g" $DIR_SKELETON/.gitconfig
fi

NAME_MATCHES=$(grep -c '<name>' ~/.gitconfig)
if [ $NAME_MATCHES -gt 0 ]
then
    echo -n "Name: "
    read NAME
    sed -i '' -e "s/<name>/$NAME/g" $DIR_SKELETON/.gitconfig
fi
echo "DONE"
echo
