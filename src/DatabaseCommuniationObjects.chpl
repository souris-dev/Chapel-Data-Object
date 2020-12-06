module DatabaseCommunicationObjects {
    use Map;

    /*** Intefaces: ***/

    /*
    The base class for a row  of the returned result.
    This class needs to be implemented by all row classes.
    */
    class IRow {
        // Let's have a JDBC approach here
        // because we can't have heterogenous types in a map
        
        proc getValAsType(fieldNumber: int(32), type t) {}
        proc getValAsType(fieldName: string, type t) {}

        proc getVal(fieldNumber: int(32)): string {}
        proc getVal(fieldName: string): string {}
    }

    /*
    The base class for a field of the returned result.
    This class needs to be implemented by all field info classes.
    */
    class IField {
        proc getFieldType(): string {}
        proc getFieldNumber(): int(32) {} // TODO: rename to getFieldIndex() ?
        proc getFieldName(): string {}
    }

    /*
    The `ICursor` class provides an interface that needs to be
    implemented by all database cursor classes.
    */
    class ICursor {
        proc execute(statement: Statement) {}
        proc executeBatch(statements: [?D] Statement) {}
        proc query(statement: Statement) {}
        proc fetchone() {}
        proc fetchall() {}
        proc close() {}

        proc __resetFields() {}
        proc __addField() {}
        proc getFieldInfo(fieldNumberInResult: int(32)): IField {}
        proc hasColumnWithName(name: string): bool {}
    }

    /*
    The `IConnection` class provides an interface that needs to be
    implemented by all database connector classes.
    */
    class IConnection {
        proc connect(connectionString: string, autocommit: bool = true) {}
        proc cursor(): ICursor {}
        proc close() {}
        proc setAutoCommit(autocommit: bool) {}
        proc isAutocommit(): bool {}
        proc rollback(): bool {}

        proc getNativeConnection(): opaque {
            // TODO: ref intent instead of opaque?
            return nil;
        }

        proc beginTransaction() {}
        proc commit() {}
        proc rollback() {}
    }

    
    /*** Quey Building ***/

    /* 
    This class helps in the creation of SQL queries and statements,
    something like `PreparedStatement` used by the JDBC in Java.
    Useful for ensuring proper data types and prevention of SQL injection.

    For example: `SELECT id FROM USERS WHERE name = ?1 and address = ?2`
    The `?1` and `?2` placeholders can be replaced with setValue.
    Note that there must be atleast one space before
    the placeholder to be recognized as one.
    Hence, for `SELECT id FROM USERS WHERE name =?1 and address = ?2`
    `?1` will not be recognized as a placeholder but `?2` will be.
    */
    class Statement {
        var _statementUnformatted: string;
        var _toSubstitute: bool;
        var _finalStatement: string;

        /*
        Initialize an SQL statement.
            :arg statement: The SQL statement
            :type statement: string
            :arg toSubstitue: True if the arg `statement` contains placeholder question marks to be substituted
            :type toSubstitue: bool
        */
        
        proc init(statement: string, toSubstitute: bool) {
            this._toSubstitute = toSubstitute;
            this._statementUnformatted = unsubstitutedStatement;
            if (!toSubstitute) {
                this._finalStatement = statement;
            }
            else {
                this._finalStatement = "";
            }
        }

        /*
        Set the value of a placeholder.
            :arg at: The placeholder index to substitute the value at (e.g.: for `?2`, the value of `at` is 2)
            :type at: int
            :arg value: The value to substitute at the placeholder index `at`
        */

        proc setValue(at: int, value: ?t) {
            var toBeReplacedWith: string;

            // TODO: add tests for SQL injection
            if (t == int) {
                toBeReplacedWith = value: string;
            }
            else if (t == bool) {
                toBeReplacedWith = value: string;
            }
            else {
                toBeReplacedWith = "'" + value: string + "'";
            }
            // TODO add more types like date

            // conserve the space
            this._finalStatement = this._statementUnformatted.replace(" ?" + at: string, " " + toBeReplacedWith);

            // TODO: add escapes for symbols
        }

        /*
        Checks if any placeholder remains to be substituted in the SQL statement.
            :return: if any placeholders are yet to be substituted
            :rtype: bool
        */

        proc isPlaceholderRemaining(): bool {
            // TODO: to be implemented
            return true;
        }

        /*
        Returns the substituted, final SQL statement/query.
            :return: final substituted SQL statement/query
            :rtype: string
        */
        proc getSubstitutedStatement(): string {
            // TODO: Add a check to ensure no placeholders are unsubstituted
            // If so, warn the user or throw an error.

            if (this.isPlaceholderRemaining()) {
                throw new IncompleteStatementError();
            }
            return this._finalStatement;
        }
    }

    
    /*** Errors ***/

    /*
    Thrown when user tries to perform an operation on a
    connection that is not connected.
    */
    class NotConnectedError : Error {
        proc init() {}
    }

    /*
    Class for wrong connection string format or parameters.
    */
    class ConnectionStringFormatError : Error {
        proc init() {}
    }

    /*
    Class for connection errors.
    */
    class DBConnectionFailedError : Error {
        proc init() {}
    }

    /*
    Class for failure of SQL statement execution.
    */
    class QueryExecutionError : Error {
        proc init() {}
    }

    /*
    This is the base class for al SQL statement errors.
    */
    class SQLStatementError : Error {
        proc init() {}
    }

    /*
    This error is thrown when a `Statement` still contains atleast one
    unsubstituted placeholder and the user attempts to retrieve the final
    SQL statement or query, or tries to use it somewhere else.
    */
    class IncompleteStatementError : SQLStatementError {
        proc init() {}
    }
}