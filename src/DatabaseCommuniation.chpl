module DatabaseCommunication {

    /* 
    This class helps in the creation of SQL queries and statements.
    Something like `PreparedStatement` used by the JDBC in Java.
    Useful for ensuring proper datatypes and prevention of SQL injection.

    For example: SELECT name FROM USERS WHERE name = ?1 and address = ?2
    The `?1` and `?2` placeholders can be replaced with setValue.
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
        :arg t: The type of value to substitute in the statement
        :type t: type
        :arg at: The placeholder index to substitute the value at (e.g.: for `?2`, the value of `at` is 2)
        :type at: int
        :arg value: The value to substitute at the placeholder index `at`
        */

        proc setValue(t: type, at: int, value: t) {

        }

        proc getSubstitutedStatement(): string {
            // TODO: Add a check to ensure no placeholders are unsibstituted
            // If so, warn the user or throw an error.
            return this._finalStatement;
        }

        proc writeThis() {
            writeln(this._finalStatement);
        }
    }

    /*** Intefaces: ***/

    /*
    The `Cursor` class provides an interface that needs to be
    implemented by all database cursor classes.
    */
    class Cursor {
        proc execute(stmt: Statement) {}
        proc executeBatch(stmts: [?D] Statement) {}
        proc query(stmt: Statement) {}
        proc fetchone() {}
        proc fetchall() {}
        proc fetchManyIter() {}
    }

    /*
    The `Connection` class provides an interface that needs to be
    implemented by all database connector classes.
    */
    class Connection {
        proc cursor(): Cursor {}
        proc commit() {}
        proc rollback() {}
        proc close() {}
        proc setAutocommit(autoCommit: bool) {}
    }
}