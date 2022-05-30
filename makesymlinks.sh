#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/Git/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
configdir=~/.config
files="brewfile vim_pluginsrc aliases bashrc zshrc gitconfig bash_profile vimrc vim gitignore"    # list of files/folders to symlink in homedir
configfolders="lvim"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -f -s $dir/$file ~/.$file
done

# move any existing folder in .config to dotfiles_old, then create symlinks
for folder in $configfolders; do
  echo "Backing up $folder in $configdir to .dotfiles_old"
  mv $configdir/$folder $olddir
  echo "Creating symlink to $folder in home $configdir directory."
  ln -f -s $dir/$folder $configdir/$folder
done

# installs antibody if needed
$dir/antibody/install.sh
