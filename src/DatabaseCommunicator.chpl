module DatabaseCommunicator {
    use DatabaseCommunicationObjects;
    use TOML;

    class ConnectionHandler {
        var _connection;

        /*
        Initializes a connection handler for the given database management system.
        The configuration information (like username, etc.) are supplied as a TOML file
        in this overload.
        */
        proc init(type className, configFile: string) throws {
            if (!isSubtype(className, IConnection)) {
                halt("[Error] The class specified in the constructor of ConnectionHandler should inherit IConnection.");
            }

            const tomlConfigFile = open(configFile, iomode.r);
            const configs = parseToml(tomlConfigFile);

            _connection = new className();
            var connParams: string = _connection.getRequiredConnectionParameters();
            var connString: string = "";

            // build the connection string by taking vaues from the config file
            for (i, str) in zip(0.., connParams.split(';')) {
                connString = connString + configs["dbconfig"][str].toString() + ";";
            }

            // eliminate the last ';'
            connString = connString.strip(";");
            // TODO: if autocommit is not mentioned then assume true
            bool autocommit = configs["dbconfig"]["autocommit"].toString();

            // connect to the db:
            _connection.connect(connString, autocommit);
        }

        /*
        Initializes a connection handler for the given database management system.
        */
        proc init(type className, connectionString: string, autocommit: bool = true) throws {
            if (!isSubtype(className, IConnection)) {
                halt("[Error] The class specified in the constructor of ConnectionHandler should inherit IConnection.");
            }

            _connection = new className();
            _connection.connect(connectionString, autocommit);
        }

        forwarding _connection except init;
    }
}