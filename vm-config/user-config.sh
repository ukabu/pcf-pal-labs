#!/bin/bash -x

# make private bin directory
[ -d ~/bin ] || mkdir ~/bin

source /vagrant/vm-config/configuration-bash.sh

curl -s "https://get.sdkman.io" | bash 2> /dev/null
source "/home/vagrant/.sdkman/bin/sdkman-init.sh"

sdk install maven 2> /dev/null
sdk install gradle 2> /dev/null

# TomEE
wget http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.2/apache-tomee-7.0.2-plume.tar.gz -q -O - | tar -zxvC ~

#minio
pushd ~/bin
  wget https://dl.minio.io/server/minio/release/linux-amd64/minio
  chmod +x minio
  wget https://dl.minio.io/client/mc/release/linux-amd64/mc
  chmod +x mc
popd

# useful alias for ./gradlew
echo "alias gw=./gradlew" >> ~/.bashrc
