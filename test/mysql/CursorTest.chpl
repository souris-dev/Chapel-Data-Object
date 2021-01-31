use DatabaseCommunicator;
use DatabaseCommunicationObjects;
use UnitTest;
use MySQL;

proc cursorOpenExecuteTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));

    cursor.close();
    conHandler.close();
}

proc cursorQueryTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithCOnfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.query(new Statement("SELECT * FROM sample"));

    cursor.close();
    conHandler.close();
}

proc fetchoneTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));
    var row = cursor.fetchone();

    test.assertTrue(row![0].isStringType());
    test.assertTrue(row![1].isStringType());
    test.assertTrue(row![2].isStringType());

    cursor.close();
    conHandler.close();
}

proc fetchallTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    cursor.execute(new Statement("SELECT * FROM sample"));

    for row in cursor.fetchall() {
        writeln(row![0], "\t", row![1]);
        test.assertTrue(row![0].isStringType());
        test.assertTrue(row![1].isStringType());
        test.assertTrue(row![2].isStringType());
    }

    cursor.close();
    conHandler.close();
}

proc executeBatchTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    var cursor = conHandler.cursor();

    var insertStatements = [new Statement("INSERT INTO sample VALUES (31, 'Person1', true)"),
                            new Statement("INSERT INTO sample VALUES (32, 'Person2', true)"),
                            new Statement("INSERT INTO sample VALUES (33, 'Person3', true)")];
    
    cursor.executeBatch(insertStatement);

    cursor.close();
    conHandler.close();
}