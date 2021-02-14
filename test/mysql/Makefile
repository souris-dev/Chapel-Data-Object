mysql_tests: test_db_init mysql_connection_test mysql_cursor_test mysql_field_test mysql_row_test mysql_transaction_test

mysql_connection_test:
	chpl -o ./bin/mysql_connection_test ./test/mysql/ConnectionTest.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

mysql_cursor_test:
	chpl -o ./bin/mysql_cursor_test ./test/mysql/CursorTest.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

mysql_field_test:
	chpl -o ./bin/mysql_field_test ./test/mysql/FieldTest.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

mysql_row_test:
	chpl -o ./bin/mysql_row_test ./test/mysql/RowTest.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

mysql_transaction_test:
	chpl -o ./bin/mysql_transaction_test ./test/mysql/TransactionTest.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

test_db_init:
	chpl -o ./bin/test_db_init ./test/mysql/TestDBInit.chpl ./src/mysql/helpers/mysql_helper.h ./src/mysql/helpers/mysql_helper.c -M ./src -M ./src/mysql -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv