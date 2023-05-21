import os
from datetime import datetime
from pathlib import Path


def setup_dotfiles():
    run_time = datetime.now()

    home = str(Path.home())
    python_runtime_path = str(Path().resolve())

    for root, dirs, files in os.walk(f'{python_runtime_path}/dotfiles/'):
        current_dir = root.replace(f'{python_runtime_path}/dotfiles', f'{home}')
        
        if not os.path.exists(current_dir):
            print(f'Creating directory {current_dir}')
            os.makedirs(current_dir)

        for file in files:
            full_file_path = current_dir + '/' + file
            if os.path.exists(full_file_path) or os.path.islink(full_file_path):
                backup_file_name = f"{full_file_path}-{run_time}"
                print(f"Saving a backup in: {backup_file_name}")
                os.rename(full_file_path, backup_file_name)

            print(f"Creating symlink for {root}/{file} in {full_file_path}")
            os.symlink(f'{root}/{file}', f'{full_file_path}')

