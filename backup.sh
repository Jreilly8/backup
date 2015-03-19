#!/bin/sh
# Modified to use external hard drive

BACKUPMAIN=/share/full/destination/path
FSMAIN=$BACKUPMAIN/filesystem
EXCLUDES=$BACKUPMAIN/scripts/excludes.txt
LINK=$FSMAIN/current
TS_NOW=`date "+%Y-%m-%d-%H%M%S"`
TS_REMOVE=`date "+%Y-%m-%d-%H%M*" --date="10 days ago"`
ARCHIVE_TO_REMOVE=$FSMAIN/$TS_REMOVE
CURRENT=$FSMAIN/$TS_NOW
SOURCE=root@your.domain.com:/

mkdir $CURRENT
rsync -av --relative --delete --delete-excluded --exclude-from=$EXCLUDES --link-dest=$LINK $SOURCE $CURRENT
rm -f $LINK
ln -s $CURRENT $LINK
rm -rf $ARCHIVE_TO_REMOVE
