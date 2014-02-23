#!/usr/bin/env bash

DIR_BASE=$( cd $(dirname $0) ; pwd )
DIR_SKELETON=$DIR_BASE/homedir

# Install git submodules as well
( cd $DIR_BASE; git submodule update --init )

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
    sed --in-place -e "s/<email>/$EMAIL/g" $DIR_SKELETON/.gitconfig
fi

NAME_MATCHES=$(grep -c '<name>' ~/.gitconfig)
if [ $NAME_MATCHES -gt 0 ]
then
    echo -n "Name: "
    read NAME
    sed --in-place -e "s/<name>/$NAME/g" $DIR_SKELETON/.gitconfig
fi
echo "DONE"
echo
