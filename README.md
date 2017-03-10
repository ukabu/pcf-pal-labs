PCF-PAL-LABS
============

Vagrantfile to provision a VM with the environment required to participate
in Pivotal CloudFoundry Platform Acceleration Lab.

You only need [Vagrant](https://www.vagrantup.com/) and your preferred IDE/Editor on the host.

On Windows, also install [GitHub Desktop](https://desktop.github.com/) and use Git Shell as your terminal.

Open a terminal:

```
vagrant up
vagrant ssh
cd /vagrant/labs
```

Do your Git clone in the Guest VM and edit files using your IDE/Editor on the
Host.

Bash configuration has been adapted from https://github.com/pivotal/workstation-setup/blob/master/scripts/configuration-bash.sh
