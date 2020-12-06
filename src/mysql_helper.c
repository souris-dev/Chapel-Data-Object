#include "mysql_helper.h"

const char* __get_mysql_field_val_by_number(MYSQL_ROW row, int idx) {
    return (const char*) row[idx];
}

const char* __get_mysql_field_name_by_number(MYSQL_FIELD *fields, int idx) {
    return (const char*) fields[i].name;
}

int __get_mysql_field_number_by_name(MYSQL_FIELD *fields, const char* field_name) {
    int fieldNumber = 0;
    while (strcpy(fields[fieldNumber].name, field_name) != 0) {
        fieldNumber++;
    }
    return fieldNumber;
}

const char* __get_mysql_field_val_by_name(MYSQL_ROW row, MYSQL_FIELD *fields, const char* field_name) {
    int fieldNumber = __get_mysql_field_number_by_name(fields, field_name);
    return (const char*) row[fieldNumber];
}