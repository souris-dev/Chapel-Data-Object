#include "mysql_helper.h"

const char* __get_mysql_field_val_by_number(MYSQL_ROW row, int idx) {
    return (const char*) row[idx];
}

const char* __get_mysql_field_name_by_number(MYSQL_FIELD *fields, int idx) {
    return (const char*) fields[i].name;
}