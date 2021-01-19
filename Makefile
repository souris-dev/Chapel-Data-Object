tests: statements_test

mysql_ex1:
	chpl -o ./bin/mysql_ex1 ./example/mysql_ex1.chpl ./src/mysql_helper.h ./src/mysql_helper.c -M ./src -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

mysql_ex2:
	chpl -o ./bin/mysql_ex2 ./example/mysql_ex2.chpl ./src/mysql_helper.h ./src/mysql_helper.c -M ./src -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

statements_test:
	chpl -o ./bin/statements_test ./test/statements_test.chpl -M ./src