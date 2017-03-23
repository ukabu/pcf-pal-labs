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

If you are on Windows, you can run `vagrant up` from an administrator cmd shell.
when you do so, it will use SMB for the shared folder which is about 5-6 times
faster when building. You will be asked for you current Windows username and
password so the guest VM can access the SMB share. For username, you MUST provide
the domain name (ex: `user@domain`). The credentials are not saved anywhere.

Do your Git clone in the Guest VM and edit files using your IDE/Editor on the
Host.

Bash configuration has been adapted from https://github.com/pivotal/workstation-setup/blob/master/scripts/configuration-bash.sh
