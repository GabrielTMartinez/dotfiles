import os
import shutil
import subprocess

import setup_dotfile


def get_pkg_manager():
    pkg_man = {
        "pkgman": None,
        "update_cmd": None,
        "install_cmd": None,
        "autoremove_cmd": None,
    }
    if shutil.which("apt"):
        pkg_man["pkgman"] = "apt"
        pkg_man["update_cmd"] = "sudo apt -y update; sudo apt -y upgrade"
        pkg_man["install_cmd"] = "sudo apt -y install"
        pkg_man["autoremove_cmd"] = "sudo apt -y autoremove"
    elif shutil.which("dnf"):
        pkg_man["pkgman"] = "dnf"
        pkg_man["update_cmd"] = "sudo dnf update -y"
        pkg_man["install_cmd"] = "sudo dnf install -y"
        pkg_man["autoremove_cmd"] = "sudo dnf autoremove -y"
    elif shutil.which("pacman"):
        pkg_man["pkgman"] = "pacman"
        pkg_man["update_cmd"] = "sudo pacman -Syyu --noconfirm"
        pkg_man["install_cmd"] = "sudo pacman -S --noconfirm"
        pkg_man["autoremove_cmd"] = "sudo pacman -Qdttq | pacman -Rs - --noconfirm"
    else:
        raise Exception("No package manager found!")

    print(f'{pkg_man["pkgman"]} found! Using it as the package manager')
    return pkg_man


def set_bash_cmds(pkg_man):
    os.environ["pkgman"] = pkg_man["pkgman"]
    os.environ["update_cmd"] = pkg_man["update_cmd"]
    os.environ["install_cmd"] = pkg_man["install_cmd"]
    os.environ["autoremove_cmd"] = pkg_man["autoremove_cmd"]


pkg_man = get_pkg_manager()
set_bash_cmds(pkg_man)

print("Executing full installation")

os.system("${update_cmd}")

subprocess.run("./install_files/cli-utils.sh", shell=True)
subprocess.run("./install_files/term-utils.sh", shell=True)

subprocess.run('./install_files/asdf.sh', shell=True)
subprocess.run('./install_files/docker.sh', shell=True)

# TODO ncdu

setup_dotfile.setup_dotfiles()
# subprocess.run('./setup_wsl.sh', shell=True)

# subprocess.run('./install_files/apps.sh', shell=True)

os.system("${autoremove_cmd}")

print("\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s ${which zsh}\n")

print("Full install, done!")
