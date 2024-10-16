# acsl

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
  |- ros_packages/
  |- ros_launcher/launch_PACKAGE.sh
  |- dockerfile.PACKAGE
  |- PACKAGE.rules
```

## Maintenance
```bash
  acsl/Debian> md5sum usr/bin/acsl | tee DEBIAN/md5sums
  acsl> fakeroot dpkg-deb --build Debian .
```
