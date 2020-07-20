#!/bin/bash

setsebool -P httpd_can_network_connect_db=1 allow_httpd_anon_write=1
chcon -R -t public_content_rw_t /mnt/koji/*
