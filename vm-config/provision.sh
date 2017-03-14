#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive
# configure CloudFoundry debian repo
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

# add ppa for Java builds - to get java 8 on trusty
add-apt-repository -y ppa:openjdk-r/ppa

apt-get update

# Install cf client, curl, git, jq (json parser/prettyfier), siege (HTTP load tester)
apt-get install -y cf-cli curl git grc jq openjdk-8-jdk siege unzip zip

# install mysql server without root password
apt-get -y install mysql-server

# call user-config.sh as vagrant user
su -c "source /vagrant/vm-config/user-config.sh" vagrant
