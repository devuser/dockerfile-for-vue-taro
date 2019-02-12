#!/bin/sh
CURRENTFOLDER=$PWD
echo $CURRENTFOLDER
cd $HOME
# tar zcvf $CURRENTFOLDER/dot-oh-my-zsh.tar.gz .oh-my-zsh
cd $CURRENTFOLDER
# cp $HOME/.zshrc dot-zshrc
docker build --no-cache -t node/vuetaro .
echo "Remove the middle-files"
# rm -rf $CURRENTFOLDER/dot-oh-my-zsh.tar.gz
# rm -rf dot-zshrc
