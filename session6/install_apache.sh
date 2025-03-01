#!/bin/bash

_install_package() {
dnf install httpd -y > /dev/null
if [ $? -eq 0 ]; then 
 echo "$1 installed"
 dnf list $1
else 
   dnf install guadftt
fi
}
_install_package httpd
_install_package git
_install_package sysstat