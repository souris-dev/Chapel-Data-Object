module DatabaseCommunicationObjects {
    /*
    The base class for a field of the returned result.
    This class needs to be implemented by all field info classes.
    */
    class IField {
        proc getFieldType() {} // returns an enum type specific to the implementation
        proc getFieldIdx(): int(32) {} // TODO: rename to getFieldIndex() ?
        proc getFieldName(): string {}
    }
}