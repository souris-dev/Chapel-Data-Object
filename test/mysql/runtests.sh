#!/usr/bin/bash

# ensure that $CHPL_HOME is set for this user for
# successful execution of this script

cd ../..

echo "[Info] Making tests..."
make tests
cp ./test/mysql/*.toml ./bin
cd ./bin

# start mysql server if not yet started
echo "[Info] Starting MySQL Server"
service mysql start

echo "[Info] Starting tests..."
./test_db_init
./mysql_connection_test
./mysql_cursor_test
./mysql_field_test
./mysql_row_test
./mysql_transaction_test