echo
echo "Configuring bash with bash-it"

pushd ~

cp /vagrant/vm-config/files/dircolors.ansi-dark ~/.dircolors
cp /vagrant/vm-config/files/.inputrc ~/.inputrc

rm -rf ~/.bash_it

git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
cp /vagrant/vm-config/files/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom
cp /vagrant/vm-config/files/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash

~/.bash_it/install.sh

source ~/.bashrc

bash-it enable completion git
bash-it enable plugin ssh
bash-it enable plugin rbenv
bash-it enable completion ssh

popd
