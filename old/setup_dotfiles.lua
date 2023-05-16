function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

run_time = os.date('%Y%m%d%H%M%S')
home = os.getenv("HOME")..'/'
config_folder = string.format('%s/.config/', home)

file_names = {}
file_names['alacritty.yml'] = string.format('%s/alacritty/', config_folder)
file_names['init.lua'] = string.format('%s/nvim/', config_folder)
file_names['.p10k.zsh'] = home
file_names['.tmux.conf'] = home
file_names['.zshrc'] = home

for file_name, file_path in pairs(file_names) do
    full_file_path = file_path..file_name
    if file_exists(full_file_path) then
        backup_file_name = string.format('%s-%s', full_file_path, run_time)
        print(string.format('Saving a backup in: %s', backup_file_name))
        os.rename(full_file_path, backup_file_name)
    end
    print(string.format('Copying file ./dotfiles/%s to %s', file_name, full_file_path))
    os.execute(string.format("cp ./dotfiles/%s %s", file_name, full_file_path))
end
