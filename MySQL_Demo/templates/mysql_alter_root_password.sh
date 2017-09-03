#!/bin/sh
mysql -u root -p$(cat /var/log/mysqld.log | grep "temporary password" | rev | cut -d " " -f 1 | rev) -e "SET PASSWORD FOR root@localhost = '{{ mysql_users.root }}'" --connect-expired-password && touch /home/vagrant/root_pw_reset.success;
