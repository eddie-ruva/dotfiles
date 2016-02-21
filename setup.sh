#!/bin/bash
############################
# Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# From help from this blog post:
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_bk              # old dotfiles backup directory
script_name="${0##*/}"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles directory
for full_path in $dir/*
do
  file_name="${full_path##*/}"
  if [[ "${file_name}" != "${script_name}" ]] && [[ -f $file_name ]]
  then
    echo "Moving existing dotfiles ----  ${file_name} ----- ~ to $olddir"
    mv ~/.$file_name $olddir
    echo -e "\n"

    echo "Creating symlink to $full_path in home directory."
    ln -s $full_path ~/.$file_name
  fi
done
