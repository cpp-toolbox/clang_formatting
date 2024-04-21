#!/bin/bash
ln -sr .clangd ../
ln -sr .clang-format ../
# https://github.com/git/git/blob/master/Documentation/RelNotes/2.32.0.txt
# therefore we can't symlink the gitignore, we copy it 
cp -n .gitignore ../
