# Uninstall all Python packages using pip
pip freeze | xargs pip uninstall -y

# apt list all installed packages
sudo apt list --installed

# Start vim in current dir with explorer on the right and opening files in the right split
vim -c :Lexplore

# With coc.nvim installed, installs coc-pyright (LSP for Python in VIM)
# SHOULD BE EXECUTED IN THE ROOT OF THE PROJECT
:CocInstall coc-pyright

# good hex
282A36

# create tar gz
tar -czvf file.tar.gz directory
tar -czvf file.tar.gz file1.jpg file2.txt

# extract tar gz
tar -xzvf file.tar.gz -C directory
tar -xzvf file.tar.gz

# install flatpak to custom location
1. Put a file in /etc/flatpak/installations.d/ called extra.conf like this:
```
[Installation "extra"]
Path=/run/media/mwleeds/ext4_4tb/flatpak/
DisplayName=Extra Installation
StorageType=harddisk
```
See man flatpak-installation for the format.
2. Add a remote with e.g. flatpak --installation=extra remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
3. Install to it with e.g. flatpak --installation=extra install flathub org.inkscape.Inkscape
4. Run from it with e.g. flatpak run org.inkscape.Inkscape
