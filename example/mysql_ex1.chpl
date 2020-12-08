module Main {
    use DatabaseCommunicator;
    use DatabaseCommunicationObjects;
    use MySQL;
    use Map;

    proc main() {
        var conHandler = new ConnectionHandler(MySQL, "localhost;testdb;root;root");
        var cursor = conHandler.cursor();

        var createStmt = "CREATE TABLE CONTACTS (id INT PRIMARY KEY, name VARCHAR(10));";
        cursor.execute(new Statement(createStmt));
        
        var insertStmts = ["INSERT INTO CONTACTS VALUES (1, 'A');", "INSERT INTO CONTACTS VALUES (2, 'B');"];
        cursor.executeBatch(insertStmts);

        var stmt: Statement = new Statement("SELECT * FROM VALUES WHERE id = ?1");
        stmt.setValue(1, 1);
        cursor.execute(stmt);

        for row in cursor.fetchall() {
            writeln(row[0], row[1]);
        }

        // add other methods
    }
}