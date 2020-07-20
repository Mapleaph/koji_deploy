#!/bin/bash

mkdir -p /mnt/koji/{packages,repos,work,scratch,repos-dist}
cd /mnt/koji
chown apache.apache *
