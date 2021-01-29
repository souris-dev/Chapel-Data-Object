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
}