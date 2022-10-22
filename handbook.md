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
