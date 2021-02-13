module IRow {

    /*
    The base class for a row  of the returned result.
    This class needs to be implemented by all row classes.
    */
    class IRow {
        // A single function can't return different types of values
        // hence the first two methods
        
        proc getValAsType(fieldNumber: int(32), type t) {}
        proc getValAsType(fieldName: string, type t) {}

        proc getVal(fieldNumber: int(32)): string {}
        proc getVal(fieldName: string): string {}
    }
}