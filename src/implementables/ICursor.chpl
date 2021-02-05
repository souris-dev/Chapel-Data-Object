module DatabaseCommunicationObjects {
    /*
    The `ICursor` class provides an interface that needs to be
    implemented by all database cursor classes.
    */
    class ICursor {
        proc execute(statement: Statement) throws {}
        proc executeBatch(statements: [?D] Statement) {}
        proc query(statement: Statement) {}
        proc fetchone() {}
        iter fetchsome(howManyRows: int(32)) {}
        iter fetchall() {}
        proc close() {}

        proc __resetFields() {}
        proc __addField() {}
        proc getFieldsInfo() {}
    }
}