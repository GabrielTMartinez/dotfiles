import os
from datetime import datetime
from pathlib import Path


def setup_dotfiles():
    run_time = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")

    home = str(Path.home())
    home_config = f"{home}/.config"
    python_runtime_path = str(Path().resolve())

    src_target_map = {
        f"{python_runtime_path}/dotfiles/home": f"{home}/",
        f"{python_runtime_path}/dotfiles/.config": f"{home_config}/",
    }

    for src, target in src_target_map.items():
        for file_name in os.listdir(src):
            full_file_path = f"{target}/{file_name}"

            if os.path.exists(full_file_path) or os.path.islink(full_file_path):
                backup_file_name = f"{full_file_path}-{run_time}"
                print(f"Saving a backup in: {backup_file_name}")
                os.rename(full_file_path, backup_file_name)

            print(
                f"Creating symlink for {src}/{file_name} in {full_file_path}"
            )
            os.symlink(f"{src}/{file_name}", f"{full_file_path}")
