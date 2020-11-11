module DatabaseCommunication {

    /* 
    This class helps in the creation of SQL queries and statements.
    Something like `PreparedStatement` used by the JDBC in Java.
    Useful for ensuring proper datatypes and prevention of SQL injection.

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
            // TODO add more types

            // conserve the space
            this._finalStatement = this._statementUnformatted.replace(" ?" + at: string, " " + toBeReplacedWith);
        }

        /*
        Checks if any placeholder remains to be substituted in the SQL statement.
        */

        proc isPlaceholderRemaining(): bool {
            // TODO: to be implemented
            return true;
        }

        proc getSubstitutedStatement(): string {
            // TODO: Add a check to ensure no placeholders are unsubstituted
            // If so, warn the user or throw an error.

            if (this.isPlaceholderRemaining()) {
                throw new IncompleteStatementError();
            }
            return this._finalStatement;
        }
    }

    /*** Intefaces: ***/

    /*
    The `ICursor` class provides an interface that needs to be
    implemented by all database cursor classes.
    */
    class ICursor {
        proc execute(stmt: Statement) {}
        proc executeBatch(stmts: [?D] Statement) {}
        proc query(stmt: Statement) {}
        proc fetchone() {}
        proc fetchall() {}
        proc fetchManyIter() {}
    }

    /*
    The `IConnection` class provides an interface that needs to be
    implemented by all database connector classes.
    */
    class IConnection {
        proc cursor(): Cursor {}
        proc commit() {}
        proc rollback() {}
        proc close() {}
        proc setAutocommit(autoCommit: bool) {}
    }

    /*** Errors ***/

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