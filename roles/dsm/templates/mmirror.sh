#!/bin/bash

mkdir -p repo/centos/7/os/x86_64
rsync -ahv rsync://mirror.bytemark.co.uk/centos/7/os/x86_64/  repo/centos/7/os/x86_64

#http://mirror.yandex.ru/centos/7/os/x86_64/ repo/centos/7/os/x86_64

