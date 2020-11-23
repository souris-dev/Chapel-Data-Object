module MySQL {
    use DatabaseCommunication;
    use MySQLNative;
    require "mysql.h";
    require "stdio.h";
    require "mysql_helper.h";

    /*
    Class for a MySQL server connection. 
    Used to keep track of a MySQL server connection.
    */
    class MySQLConnection : IConnection {
        
        var _cptr_mysqlconn: c_ptr(MYSQL);
        var _autocommit: bool;
        var _prev_autocommit_state: bool;

        /*
        Initialize a MySQL database connection.
            :arg host: Host name/address
            :type host: string

            :arg username: username
            :type username: string

            :arg database: database name
            :type database: string

            :arg password: password
            :type password: string

            :arg autocommit: whether to enable autocommit (optional, true by default)
            :type autocommit: bool
        */

        // TODO: add init overload for one single connection string
        proc init(host: string, username: string, database: string, password: string, autocommit: bool = true) {
            this._cptr_mysqlconn = nil;
            this._autocommit = autocommit;
            this._prev_autocommit_state = autocommit;

            this._cptr_mysqlconn = mysql_init(this._cptr_mysqlconn);

            var conn_res: c_ptr(MYSQL) = mysql_real_connect(this._cptr_mysqlconn, 
                                                            host.localize().c_str(), 
                                                            username.localize().c_str(), 
                                                            password.localize().c_str(), 
                                                            database.localize().c_str(), 0, 
                                                            c_nil: c_string, 0);

            if (conn_res == c_nil) {
                writeln("Unable to connect to database!");
                mysql_close(this._cptr_mysqlconn);
                throw new DBConnectionFailedError();
            }

            this.setAutocommit(true);
        }

        /*
        Sets autocommit.
            :arg autocommit: whether autocommit should be enabled or not
            :type autocommit: bool
        */
        override proc setAutocommit(autocommit: bool) {
            this._prev_autocommit_state = this._autocommit;
            this._autocommit = autocommit;

            if (autocommit) {
                mysql_autocommit(this._cptr_mysqlconn, 1);
                mysql_query(this._cptr_mysqlconn, "SET autocommit = 1;");
            }
            else {
                mysql_autocommit(this._cptr_mysqlconn, 0);
                mysql_query(this._cptr_mysqlconn, "SET autocommit = 0;");
            }
        }

        /*
        Returns whether autocommit is enabled or not, for this connection.
            :return: true if autocommit is enabled, else false.
            :rtype: bool
        */
        override proc isAutocommit(): bool {
            return this._autocommit;
        }

        /*
        Returns a C pointer to the native SQL connection.
        In case of MySQL, it is a c_ptr(MYSQL).
            :return: C pointer to the native SQL connection.
            :rtype: c_ptr(MYSQL)
        */
        override proc getNativeConnection(): c_ptr(MYSQL) {
            return this._cptr_mysqlconn;
        }

        /*
        Closes the database connection.
        */
        override proc close() {
            mysql_close(this._cptr_mysqlconn);
        }

        /*
        Returns a :class:`MySQLCursor` object.
            :return: a MySQL cursor
            :rtype: MySQLCursor
        */
        override proc cursor() {
            return new MySQLCursor(this, this._cptr_mysqlconn);
        }

        /*
        Starts a transaction. 
        Note that after calling this method, autocommit is disabled until you call
        `commit()` or `rollback()`, so you must call `commit()` manually after
        statements that modify tables or data in them.
        After calling `commit()`, the current transaction is committed and autocommit is
        enabled again if it was previously enabled.
        */
        override proc beginTransaction() {
            this.setAutocommit(false);
            mysql_query(this._cptr_mysqlconn, "START TRANSACTION;");
        }

        /*
        Commits the current transaction.
        This method should be called to manually commit, if autocommit is disabled,
        and after `beginTransaction()` to commit the changes.
        After calling `commit()`, the current transaction is committed and autocommit is
        enabled again if it was enabled previously (that is, before the last call
        to `beginTransaction()`).
        */
        override proc commit() {
            mysql_commit(this._cptr_mysqlconn);

            // If autocommit was enabled previously and is now disabled, enable it
            // TODO: Check if it causes unintended consequences
            if (!this.isAutocommit() && (this._prev_autocommit_state == true)) {
                this.setAutocommit(true);
            }
        }

        /*
        Rolls back the current transaction.
        After calling `rollback()`, the current transaction is committed and autocommit is
        enabled again if it was enabled previously (that is, before the last call
        to `beginTransaction()`).
        */
        override proc rollback() {
            mysql_commit(this._cptr_mysqlconn);

            // If autocommit was enabled previously and is now disabled, enable it
            // TODO: Check if it causes unintended consequences
            if (!this.isAutocommit() && (this._prev_autocommit_state == true)) {
                this.setAutocommit(true);
            }
        }
    }

    class MySQLCursor : ICursor {

        var connection: MySQLConnection;
        var _cptr_mysqlconn: c_ptr(MYSQL);
        var _cptr_result: c_ptr(MYSQL_RES);
        var _cptr_fields: c_ptr(MYSQL_FIELD);
        var _curRow: int(32) = 0;
        var _nRows: int(32);
        var _nFields: int(32);

        pragma "no doc"
        proc init(connctn: MySQLConnection, mysqlconn: c_ptr(MYSQL)) {
            this._conn = connctn;
            this._cptr_mysqlconn = mysqlconn;
            this.complete();
        }

        /*
        Returns the number of rows retrieved for SELECT statements and
        the number of rows affected for DML statements like INSERT and UPDATE.

            :return: number of rows retrieved/affected
            :rtype: int(32)
        */

        proc getRowCount(): int(32) {
            this._nRows;
        }

        /*
        Closes the cursor: resets all results and frees memory allocated for results.
        */
        override proc close() {
            mysql_free_result(this._cptr_result);
        }
    }
}