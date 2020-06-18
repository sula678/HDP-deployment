new_pass=$1
mysql --defaults-file=~/.tmp.my.cnf -e "SET GLOBAL validate_password_length=4"
mysql --defaults-file=~/.tmp.my.cnf -e "SET GLOBAL validate_password_policy=LOW"
mysql --defaults-file=~/.tmp.my.cnf -e "SET password for root@localhost=password('$new_pass')"
umask 0077
cat > /root/.my.cnf <<EOF
[client]
user=root
password=$new_pass
EOF
