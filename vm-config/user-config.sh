#!/bin/bash -x

# make private bin directory
[ -d ~/bin ] || mkdir ~/bin

source /vagrant/vm-config/configuration-bash.sh

curl -s "https://get.sdkman.io" | bash 2> /dev/null
source "/home/vagrant/.sdkman/bin/sdkman-init.sh"

sdk install maven 2> /dev/null
sdk install gradle 2> /dev/null
