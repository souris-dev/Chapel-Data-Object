tests: statements_test

mysql_ex1:
	chpl -o ./bin/mysql_ex1 ./example/mysql_ex1.chpl ./src/mysql_helper.h ./src/mysql_helper.c -M ./src -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient -lpthread -lz -lm -lrt -lssl -lcrypto -ldl -lresolv

statements_test:
	chpl -o ./bin/statements_test ./tests/statements_test.chpl -M ./src