use DatabaseCommunicator;
use DatabaseCommunicator.DatabaseCommunicationObjects.QueryBuilder;
use UnitTest;
use MySQL;

proc fieldTest(test: borrowed Test) throws {
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