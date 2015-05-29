automated build at [docker hub](https://registry.hub.docker.com/u/rabbit52/boot2docker/)

## feature
Replace vboxsf with NFS, OS X only

## usage
- `build.sh` build image locally required [boot2docker/boot2docker](https://registry.hub.docker.com/u/boot2docker/boot2docker/)
- `make.sh` generate `boot2docker.iso`
- `nfs-server.sh` enable OS X nfs server, need sudo access