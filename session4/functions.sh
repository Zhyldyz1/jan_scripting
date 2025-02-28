#!/bin/bash

_createUser() {
    useradd $1
    usermod -aG $2 $1
    
    user=$(id $1)
    echo $user
}

_createUser esen wheel
