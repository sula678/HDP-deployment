tmp_pass=`grep 'temporary password' /var/log/mysqld.log | awk -F'root@localhost: ' '{print $2}'`
tmp_file=~/.tmp.my.cnf
umask 0077
cat > $tmp_file <<EOF
[client]
user=root
password='$tmp_pass'
connect-expired-password
EOF
