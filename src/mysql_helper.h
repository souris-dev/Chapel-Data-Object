#ifndef __MYSQL_HELPER_H
    #define __MYSQL_HELPER_H
    #include <myglobal.h>
    #include <mysql.h>

    const char* __get_mysql_field_val_by_number(MYSQL_ROW row, int idx);
    const char* __get_mysql_field_name_by_number(MYSQL_FIELD *fields, int idx);
#endif