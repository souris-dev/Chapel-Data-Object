use DatabaseCommunicator;
use DatabaseCommunicator.DatabaseCommunicationObjects.QueryBuilder;
use UnitTest;
use MySQL;

proc cursorOpenExecuteTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));

    cursor.close();
    conHandler.close();
}

proc cursorQueryTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.query(new Statement("SELECT * FROM sample"));

    cursor.close();
    conHandler.close();
}

proc fetchoneTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));
    var row = cursor.fetchone();

    test.assertTrue(isString(row![0]));
    test.assertTrue(isString(row![1]));
    test.assertTrue(isString(row![2]));

    cursor.close();
    conHandler.close();
}

proc fetchallTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));

    for row in cursor.fetchall() {
        writeln(row![0], "\t", row![1]);
        test.assertTrue(isString(row![0]));
        test.assertTrue(isString(row![1]));
        test.assertTrue(isString(row![2]));
    }

    cursor.close();
    conHandler.close();
}

proc executeBatchTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    var insertStatements = [new Statement("INSERT INTO sample VALUES (31, 'Person1', true)"),
                            new Statement("INSERT INTO sample VALUES (32, 'Person2', true)"),
                            new Statement("INSERT INTO sample VALUES (33, 'Person3', true)")];
    
    //ensure autocommit is on
    test.assertTrue(conHandler.isAutocommit());
    cursor.executeBatch(insertStatements);

    // ensure autocommit is on
    test.assertTrue(conHandler.isAutocommit());
    cursor.execute(new Statement("SELECT * from sample WHERE Field1 IN (31, 32, 33)"));

    var row1 = cursor.fetchone();
    test.assertTrue(row1![0] == '31');
    test.assertTrue(row1![1] == 'Person1');
    test.assertTrue(row1![2] == 'true');

    var row2 = cursor.fetchone();
    test.assertTrue(row2![0] == '32');
    test.assertTrue(row2![1] == 'Person2');
    test.assertTrue(row2![2] == 'true');

    var row3 = cursor.fetchone();
    test.assertTrue(row3![0] == '31');
    test.assertTrue(row3![1] == 'Person3');
    test.assertTrue(row3![2] == 'true');

    cursor.close();
    conHandler.close();
}

proc getFieldsInfoTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute("SELECT * FROM sample");

    var fieldInfo1 = cursor.getFieldsInfo();
    test.assertTrue(fieldInfo[0].getFieldIdx() == 0);
    test.assertTrue(fieldInfo[0].getFieldName() == "Field1");
    test.assertTrue(fieldInfo[0].getFieldType() == MySQLFieldType.MYSQL_TYPE_LONG);

    test.assertTrue(fieldInfo[1].getFieldIdx() == 1);
    test.assertTrue(fieldInfo[1].getFieldName() == "Field2");
    test.assertTrue(fieldInfo[1].getFieldType() == MySQLFieldType.MYSQL_TYPE_STRING);

    test.assertTrue(fieldInfo[2].getFieldIdx() == 2);
    test.assertTrue(fieldInfo[2].getFieldName() == "Field3");
    test.assertTrue(fieldInfo[2].getFieldType() == MySQLFieldType.MYSQL_TYPE_TINYINT);

    cursor.close();
    conHandler.close();
}

UnitTest.main();