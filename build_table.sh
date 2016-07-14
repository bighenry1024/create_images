#!/bin/bash
mysqld_safe &
#mysqladmin -uroot password $MYSQL_ROOT_PASSWORD
sleep 10
mysql -e  "grant all on *.* to '$MYSQL_USER'@'%' identified by  '$MYSQL_PASS' with grant option;"
mysql -e "create database dbtest;"
mysql -e "create table dbtest.t_test(id int primary key,name varchar(30) not null) default charset=utf8;"
mysql -e "insert into dbtest.t_test values (1,'dfll'),(2,'df'),(3,'bwwg');"
#mysqladmin -uroot password $MYSQL_ROOT_PASSWORD
