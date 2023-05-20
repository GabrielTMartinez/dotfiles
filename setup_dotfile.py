import os
from datetime import datetime
from pathlib import Path


def setup_dotfiles():
    run_time = datetime.now()

    home = str(Path.home())
    config_folder = f"{home}/.config/"

    file_names = {
        "alacritty.yml": f"{config_folder}/alacritty/",
        "init.lua": f"{config_folder}/nvim/",
        ".p10k.zsh": f"{home}/",
        ".tmux.conf": f"{home}/",
        ".zshrc": f"{home}/",
        "config": f"{config_folder}/sway/",
    }

    for file_name in file_names:
        full_file_path = file_names[file_name] + file_name

        if os.path.exists(full_file_path) and not os.path.islink(full_file_path):
            backup_file_name = f"{full_file_path}-{run_time}"
            print(f"Saving a backup in: {backup_file_name}")
            os.rename(full_file_path, backup_file_name)

        print(f"Creating symlink for ./dotfiles/{file_name} in {full_file_path}")
        os.symlink(f'{Path().resolve()}/dotfiles/{file_name}', f'{full_file_path}')

