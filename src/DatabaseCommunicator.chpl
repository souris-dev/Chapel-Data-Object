module DatabaseCommunicator {
    use DatabaseCommunicationObjects;

    class ConnectionHandler {
        var _connection: IConnection;

        /*
        Initializes a connection handler for the given database management system.
        */
        proc init(type className, connectionString: string, autocommit: bool = true) {
            if (!isSubtype(classsName, IConnection)) {
                writeln("[Error] The class specified in the constructor of ConnectionHandler should inherit IConnection.");
                throw new WrongConnectionClassError();
            }

            _connection = new className();
            _connection.connect(connectionString, autocommit);
        }

        forwarding _connection except init;
    }

    /*** Errors **/

    /*
    Thrown when the class type passed to the constructor of ConnectionHandler does not inherit IConnection.
    */
    class WrongConnectionClassError : Error {
        proc init() {}
    }
}