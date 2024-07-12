#!/bin/bash
ln -sr .clangd ../
ln -sr .clang-format ../
echo "Just copied clang files to parent dir"
# https://github.com/git/git/blob/master/Documentation/RelNotes/2.32.0.txt
# therefore we can't symlink the gitignore, we copy it  -n is no clobber so doesn't overwrite the file

if [ -e "../.gitignore" ]; then
    echo "You already have a gitignore, not clobbering it, if you want to replace it delete the current one first"
else
  cp .gitignore ../
  echo "Just pasted gitignore"
fi

# https://stackoverflow.com/a/4749368/6660685
if grep -Fxq ".gitignore" ../.gitignore
then
    echo ".gitignore already present in .gitignore"
else
    echo "added .gitignore to .gitignore as it was not present, this is required because the content of the
    gitignore is stored in clang_formatting not in this project"
    echo .gitignore >> ../.gitignore
fi
