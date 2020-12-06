module DatabaseCommunicator {
    use DatabaseCommunicationObjects;

    class ConnectionHandler {
        var _connection: IConnection;

        /*
        Initializes a connection handler for the given database management system.
        */
        proc init(type className, connectionString: string, autocommit: bool = true) {
            _connection = new className();
            _connection.connect(connectionString, autocommit);
        }

        forwarding _connection except init;
    }
}