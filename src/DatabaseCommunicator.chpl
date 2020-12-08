module DatabaseCommunicator {
    use DatabaseCommunicationObjects;

    class ConnectionHandler {
        var _connection;

        /*
        Initializes a connection handler for the given database management system.
        */
        proc init(type className, connectionString: string, autocommit: bool = true) {
            if (!isSubtype(className, IConnection)) {
                halt("[Error] The class specified in the constructor of ConnectionHandler should inherit IConnection.");
            }

            _connection = new className();
            _connection.connect(connectionString, autocommit);
        }

        forwarding _connection except init;
    }
}