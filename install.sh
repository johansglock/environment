#!/bin/sh

DIR_BASE=$( cd $(dirname $0) ; pwd )
DIR_SKELETON=$DIR_BASE/homedir

ls -A $DIR_SKELETON | xargs -n 1 -I R ln -nfs $DIR_SKELETON/R ~/R
