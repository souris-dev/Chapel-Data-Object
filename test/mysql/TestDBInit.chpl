module Main {
    use DatabaseCommunicator;
    use DatabaseCommunicator.DatabaseCommunicationObjects.QueryBuilder;
    use MySQL;

    proc main() throws {
        var conHandler = ConnectionHandlerWithConfig(MySQLConnection, "../example/dbinfo.toml");
        var cursor = conHandler.cursor();

        cursor.execute(new Statement("CREATE TABLE IF NOT EXISTS sample (Field1 int primary key, Field2 varchar, Field3 boolean)"));
        cursor.execute(new Statement("INSERT INTO sample VALUES (1, 'P1', true)"));

        conHandler.commit();
        cursor.close();
        conHandler.close();
    }
}