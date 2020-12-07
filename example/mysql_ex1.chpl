module Main {
    use DatabaseCommunicator;
    use MySQL;
    use Map;

    proc main() {
        var conHandler = new ConnectionHandler(MySQL, "localhost;testdb;root;root");
        var cursor = conHandler.cursor();

        cursor.execute("SELECT * FROM CONTACTS");

        for row in cursor.fetchall() {
            writeln(row[0]);
        }

        // add other methods
    }
}