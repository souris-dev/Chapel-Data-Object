use DatabaseCommunicator;
use DatabaseCommunicationObjects;
use UnitTest;
use MySQL;

proc simpleConnectionTest(test: borrowed Test) throws {
    var conHandler = new ConnectionHandler(MySQLConnection, "localhost;testdb;root;password");
    var cursor = conHandler.cursor();

    cursor.close();
    conHandler.close();

    // Invalid connection string, should throw exception:
    conHandler = new ConnectionHandler(MySQLConnection, "localhost;");
}

proc configConnectionTest(test: borrowed Test) throws {
    var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml");
    conHandler.close();

    // different root element name in TOML file
    conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig2.toml", "dbconf");
    conHandler.close();

    // wrong root element in TOML file, should throw exception:
    conHandler = ConnectionHandlerWithConfig(MySQLConnection, "dbconfig.toml", "root");
    conHandler.close();

    // Invalid file, should throw exception
    conHandler = ConnectionHandlerWithConfig(MySQLConnection, "nofile");
}