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

    // assumes the returned record is (1, 'First', true)
    test.assertTrue(row[0] == 1);
    test.assertTrue(row[1] == 'First');
    test.assertTrue(row[2] == true);

    cursor.close();
    conHandler.close();
}

proc fetchallTest(test: borrowed Test) {
    var conHandler = ConnectionHandlerWithCOnfig(MySQLConnection, "dbconfig.toml");
}