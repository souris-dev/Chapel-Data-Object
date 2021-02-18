# Chapel Data Object
Database connector for the Chapel programming language.
This `mason` package aims to provide database connectivity for some
relational database management systems. 
Currently, support is planned for MySQL, PostgreSQL and SQLite.
Support for other database management systems can be easily added by
implementing the required interfaces.

## Usage examples:

### MySQL

```chapel
module Main {
    use DatabaseCommunicator;
    use DatabaseCommunicator.DatabaseCommunicationObjects.QueryBuilder; // for Statement class
    use MySQL;

    proc main() throws {
        var conHandler = new ConnectionHandler(MySQLConnection, "localhost;testdb;username;password");
        var cursor = conHandler.cursor();

        var createStmt = "CREATE TABLE CONTACTS (id INT PRIMARY KEY, name VARCHAR(10));";
        cursor.execute(new Statement(createStmt));
        cursor.execute(new Statement("INSERT INTO CONTACTS VALUES (6, 'B');"));

        var stmt: Statement = new Statement("SELECT * FROM CONTACTS WHERE name = ?1", true);
        stmt.setValue(1, "B");
        
        cursor.execute(stmt);

        for row in cursor.fetchall() {
            writeln(row![0], "\t", row![1]);
        }

        cursor.close();
        conHandler.commit();
        conHandler.close();
    }
}
```

(For more about the `Statement` class, please see the documentation.)