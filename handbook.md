# Uninstall all Python packages using pip
pip freeze | xargs pip uninstall -y

# apt list all installed packages
sudo apt list --installed

# Start vim in current dir with explorer on the right and opening files in the right split
vim -c :Lexplore

# With coc.nvim installed, installs coc-pyright (LSP for Python in VIM)
# SHOULD BE EXECUTED IN THE ROOT OF THE PROJECT
:CocInstall coc-pyright

# good color hex
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

# linux useful commands
fdisk -l : list partitions/devices info
lsblk -o name,size,fstype,type,mountpoints,uuid : list partitions/devices info
blkid : list uuids for devices
fdisk <path_to_disk> : start disk partitioning
/etc/fstab : text file containing desirable mount points at boot

xxd <file> : print bytes in hex and bytes-to-ascii of the file
ldd <file> : print shared object dependencies 
hexdump <file> : print bytes in hex of the file
objdump -<opt> <file> : print info about the object
file <file> : print info about the file
strings <file>: print human readble strings from a file
readelf -a <file>: print info about an elf file

loadkeys <keyboard_layout/br-abnt2> : set current keyboard layout

# create readonly btrfs snapshot - WARN Does not include subvolume below, e.g. / does not include /home
sudo btrfs subvolume snapshot -r <btrfs-subvolume> ./snapname
## send snapshot to another btrfs file system
sudo btrfs send snapname | sudo btrfs receive backup-drive/
## create new subvolume
sudo btrfs subvolume create <subvolume-name>
## restore snapshot
sudo btrfs subvolume snapshot snapname <subvolume-name>

# kvm
## on fedora
sudo dnf group install --with-optional virtualization

# check which ports are listening
sudo netstat -tulpn | grep LISTEN
sudo lsof -i -P -n | grep LISTEN
sudo ss -tulpn | grep LISTEN

# docker
docker build -t <tag> .
docker run --rm -dp <container-port>:<host-port> <image/tag>
docker run --network host -d image
docker exec -it <container> bash

docker stop -a
docker ps -a
docker images
docker container prune # remove all non running conteiners
docker rmi <image>
docker rm <container>

