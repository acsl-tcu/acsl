# acsl

## Install

```bash
curl -L -O https://github.com/acsl-tcu/acsl/releases/download/v2.1/acsl_2.1_all.deb
sudo dpkg -i acsl_2.1_all.deb
sudo chmod a+x /usr/bin/acsl
rm -f acsl_2.1_all.deb
```

### Uninstall

```bash
sudo dpkg -r acsl
```

## Usage

Before you start, set up your device and SSH key to GitHub.

### Register your SSH key to Github desktop

Setup github

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

Copy and paste to <br>

```
account > Settings > SSH and GPG keys > New SSH key
```

### [Install docker](https://github.com/acsl-tcu/ros2?tab=readme-ov-file#setup)
  
### init

```bash
  mkdir work_dir && cd work_dir 
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
  acsl init {project_name} {project_RID}
```

Write several files

### Create/Update docker image

Make *dockerfile.PACKAGE* and ask to build the image by sending it to ACSL manager.

## For ACSL manager : Maintenance

```bash
  acsl/Debian> md5sum usr/bin/acsl | tee DEBIAN/md5sums
  acsl> fakeroot dpkg-deb --build Debian .
```

### build Docker image

***For project image***

```bash
git clone git@PROJECT.git
cd PROJECT
export PROJECT=PROJECT
bsbuild # require PROJECT 
build_project (ros_packages)
dpush image_PROJECT
```

***For package image : check its versatility first.***
Prepare dockerfile.PACKAGE in 3_dockerfiles

```bash
git clone git@PROJECT.git
cd PROJECT
export PROJECT=PROJECT
bsbuild base PACKAGE build
dpush PACKAGE
```

***Direct build image***

```bash
git clone git@PROJECT.git
cd PROJECT
export PROJECT=PROJECT
dupin dev
```

#### Direct build image from docker file

```bash
docker build . -f 3_dockerfiles/dockerfile.***
```

Develop your package in the container.
After complete the development, then exit the container and do follows.

```bash
docker commit dev kasekiguchi/acsl-common:PACKAGE
docker login -u kasekiguchi
dpush PACKAGE
```
