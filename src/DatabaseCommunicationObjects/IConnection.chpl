module IConnection {
    /*
    The `IConnection` class provides an interface that needs to be
    implemented by all database connector classes.
    */
    class IConnection {
        proc connect(connectionString: string, autocommit: bool = true) throws {}
        proc type getRequiredConnectionParameters(): string {return nil;}
        proc cursor(): ICursor {return nil;}
        proc close() {}
        proc setAutocommit(autocommit: bool) {}
        proc isAutocommit(): bool {return nil;}
        proc rollback(): bool {return nil;}

        proc getNativeConnection(): opaque {
            // TODO: ref intent instead of opaque?
            return nil;
        }

        proc beginTransaction() {}
        proc commit() {}
        proc rollback() {}
    }
}