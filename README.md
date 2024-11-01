# acsl

Before you start, set up your device and SSH key to GitHub. 

[Setup](https://github.com/acsl-tcu/ros2/tree/main#setup)

## Install 

```bash
curl -L -O https://github.com/acsl-tcu/acsl/releases/download/v1.0/acsl_1.0_all.deb
sudo dpkg -i acsl_1.0_all.deb
rm -f acsl_1.0_all.deb
```

### Uninstall 
```bash
sudo dpkg -r acsl
```

## Usage
- Register your SSH key to Github desktop
- [Install docker](https://github.com/acsl-tcu/ros2?tab=readme-ov-file#setup)
  
### init
```bash
  cd work_dir
  acsl init PROJECT RID
```
PROJECT(string) : project name<br />
RID(integer) : ros domain id

### clean

Caution : All changes will be removed.
```bash
  cd work_dir
  acsl clean
```

### install package
Install a package
```bash
  acsl install PACKAGE RUN_ARGS
```
PACKAGE : package name is equal to the branch name of [ros_package](https://github.com/acsl-tcu/ros_package)<br />
RUN_ARGS : arguments to run launch_PACKAGE.sh<br />
inside the program following command called
```bash
  launch_PACKAGE.sh RUN_ARGS
```
### remove
Remove a package
```bash
  acsl remove PACKAGE
```

## STRUCTURE of PROJECT
PROJECT is a group of PACKAGEs.

PACKAGE consists of followings
```
WORK_DIR/
  |- 1_ros_launcher/
    |- launch_PACKAGE.sh
  |- 2_ros_packages/
  |- 3_dockerfiles/
    |- dockerfile.PACKAGE
  |- PACKAGE.rules
  |- project_launch.sh
```

## For developer

### New project
```bash
  acsl project_name project_RID
```
Write several files

### Create/Update docker image
Make *dockerfile.PACKAGE* and ask to build the image by sending it to ACSL manager.

## For ACSL manager : Maintenance
```bash
  acsl/Debian> md5sum usr/bin/acsl | tee DEBIAN/md5sums
  acsl> fakeroot dpkg-deb --build Debian .
```

### Docker image
```bash
git clone git@PROJECT.git
cd PROJECT
export PROJECT=PROJECT
```
For project image
```bash
bsbuild
build_project (ros_packages)
dpush image_PROJECT
```

For package image : check its versatility first.
```bash
bsbuild base PACKAGE build
dpush PACKAGE
```
