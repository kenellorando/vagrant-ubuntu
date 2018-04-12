# vagrant-ubuntu
A Vagrantfile and bootstrap 1-click script with git, nodejs, &amp; mongo provisioner. Drop this into an existing project and be up and running after a few modifications.

- Downloads or upgrades box `ubuntu/trusty64`
- Reloads Vagrant
- Provisioner `bootstrap.sh` installs git, nodejs, and mongodb-org
- The mongo dbpath is set into the guest machine path `/data`
- Project dependencies are installed
- Server is started, accessible from host browser at `localhost:4532`

## Usage
Drop these files into an existing project, then:
```
chmod +x ./start.sh
./start.sh <flags>
```
Comes with a `-c` flag which can be used to delete existing `.vagrant/` configuration.

## Vagrant File
The Vagrantfile syncs the project root directory with a guest machine folder, called `/tuto` in this example:
```
config.vm.synced_folder "..", "/tuto"
```
There are also two forwarded ports, the node server's `4532` and mongo's `27017`.
```
config.vm.network "forwarded_port", guest: 4532, host: 4532
config.vm.network "forwarded_port", guest: 27017, host: 27017
```
