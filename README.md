# acsl

## Install 

```bash
curl -L -O https://github.com/acsl-tcu/acsl/releases/download/v1.0/acsl_1.0_all.deb
sudo dpkg -i acsl_1.0_all.deb
```

## Uninstall 
```bash
sudo dpkg -r acsl
```

## Usage

### init
```bash
  cd work_dir
  acsl init PROJECT RID
```
PROJECT(string) : project name<br>
RID(integer) : ros domain id

### clean

Caution : All changes will be removed.
```bash
  cd work_dir
  acsl clean
```

### install package

```bash
  acsl install PACKAGE
```
PACKAGE : [package name]()

### remove

## Maintenance
```bash
  acsl/Debian> md5sum usr/bin/acsl | tee DEBIAN/md5sums
  acsl> fakeroot dpkg-deb --build Debian .
```
