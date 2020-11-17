#!/bin/bash
echo "create mysql db"
mysql -u admin -e "CREATE DATABASE IF NOT EXISTS wordpress"
mysql -u admin -D wordpress < mysql.sql
echo "created worpress db"