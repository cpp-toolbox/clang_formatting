#!/bin/bash
ln -sr .clangd ../
ln -sr .clang-format ../
# https://github.com/git/git/blob/master/Documentation/RelNotes/2.32.0.txt
# therefore we can't symlink the gitignore, we copy it 
cp -n .gitignore ../

# https://stackoverflow.com/a/4749368/6660685
if grep -Fxq ".gitignore" ../.gitignore
then
    echo ".gitignore already present in .gitignore"
else
    echo "added .gitignore to .gitignore as it was not present"
    echo .gitignore >> ../.gitignore
fi
