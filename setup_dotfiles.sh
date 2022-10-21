#!/usr/bin/env bash
set -e

dotfiles_home="$HOME/.dotfiles"
dotfiles_backups="$dotfiles_home/backups"

echo "Coping dotfiles to $dotfiles_home..."
mkdir -p $dotfiles_home
cp -a .dotfiles/. $dotfiles_home

this_backup_folder="$dotfiles_backups/$(date +'%Y_%m_%d_%H_%M_%S')"
for file_name in .dotfiles/.[^.]*; do
    full_file_name="$HOME/${file_name##*/}"
    
    if [ -f $full_file_name ]; then
        echo "File $full_file_name already exists..."

        mkdir -p $this_backup_folder
        echo "Backing it up at $this_backup_folder"
        mv $full_file_name $this_backup_folder 
        echo "Done!"
    fi 

    echo "Creating symlink for ${file_name##*/}"
    ln -s $dotfiles_home/${file_name##*/} $full_file_name
done

