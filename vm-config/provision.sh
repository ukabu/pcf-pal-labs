#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive
# configure CloudFoundry debian repo
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

# configure MongoDB debian repo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# configure RabbitMQ debian repo
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list

# add ppa for Java builds - to get java 8 on trusty
add-apt-repository -y ppa:openjdk-r/ppa

apt-get update

# Install cf client, curl, git, jq (json parser/prettyfier), siege (HTTP load tester)
apt-get install -y build-essential cf-cli curl git graphviz grc httpie jq openjdk-8-jdk mongodb-org nginx rabbitmq-server siege unzip zip

# configure rabbitmq, add a user that can be used remotely
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user pal palpass
rabbitmqctl set_permissions -p / pal ".*" ".*" ".*"
rabbitmqctl set_user_tags pal administrator

# install mysql server without root password
apt-get -y install mysql-server

# download and install redis
pushd /tmp
  wget -O- http://download.redis.io/redis-stable.tar.gz | tar -zxvf -
  pushd redis-stable
    make
    make install
  popd
popd

# Make sure cartificate authority are up-to-date
update-ca-certificates -f

# call user-config.sh as vagrant user
su -c "source /vagrant/vm-config/user-config.sh" vagrant
