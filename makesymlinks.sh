#!/usr/bin/env bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
############################

########## Variables

SCRIPT_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"             # old dotfiles backup directory
filesToSave=".tmux.conf .tmux.osx.conf .bashrc .bash_profile .vimrc .vim .gitconfig .nvmrc .editorconfig"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating ${BACKUP_DIR} for backup of any existing dotfiles in ~ ..."
mkdir -p $BACKUP_DIR
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ${HOME} to ${BACKUP_DIR}"
for file in $filesToSave; do
   if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
      echo "Backing up file ${file}";
      mv "${HOME}/${file}" "${BACKUP_DIR}/"
   fi
done

echo "Creating symlinks for bash files."
ln -s "${SCRIPT_DIR}/bash/bash_profile" "${HOME}/.bash_profile"
ln -s "${SCRIPT_DIR}/bash/bashrc" "${HOME}/.bashrc"

echo "Creating symlinks for editor files."
ln -s "${SCRIPT_DIR}/editors/vim" "${HOME}/.vim"
ln -s "${SCRIPT_DIR}/editors/vimrc" "${HOME}/.vimrc"
ln -s "${SCRIPT_DIR}/editors/editorconfig" "${HOME}/.editorconfig"

echo "Creating symlinks for git files."
ln -s "${SCRIPT_DIR}/git/gitconfig" "${HOME}/.gitconfig"
# ensure that the global gitignore setting is correct (it's an absolute value)
git config --global core.excludesfile "${SCRIPT_DIR}/git/gitignore_global"

echo "creating symlinks for framework files."
ln -s "${SCRIPT_DIR}/frameworks/nvmrc" "${HOME}/.nvmrc"

echo "creating symlinks for tmux files."
ln -s "${SCRIPT_DIR}/tmux/tmux.conf" "${HOME}/.tmux.conf"
ln -s "${SCRIPT_DIR}/tmux/tmux.osx.conf" "${HOME}/.tmux.osx.conf"
