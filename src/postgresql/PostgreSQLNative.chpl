// Generated with c2chapel version 0.1.0

// Header given to c2chapel:
require "libpq-fe.h";

// Note: Generated with fake std headers

use CPtr;
use SysCTypes;
extern proc PQconnectStart(conninfo : c_string) : c_ptr(PGconn);

extern proc PQconnectStartParams(ref keywords : c_string, ref values : c_string, expand_dbname : c_int) : c_ptr(PGconn);

extern proc PQconnectStartParams(keywords : c_ptr(c_string), values : c_ptr(c_string), expand_dbname : c_int) : c_ptr(PGconn);

extern proc PQconnectPoll(ref conn : PGconn) : PostgresPollingStatusType;

extern proc PQconnectPoll(conn : c_ptr(PGconn)) : PostgresPollingStatusType;

extern proc PQconnectdb(conninfo : c_string) : c_ptr(PGconn);

extern proc PQconnectdbParams(ref keywords : c_string, ref values : c_string, expand_dbname : c_int) : c_ptr(PGconn);

extern proc PQconnectdbParams(keywords : c_ptr(c_string), values : c_ptr(c_string), expand_dbname : c_int) : c_ptr(PGconn);

extern proc PQsetdbLogin(pghost : c_string, pgport : c_string, pgoptions : c_string, pgtty : c_string, dbName : c_string, login : c_string, pwd : c_string) : c_ptr(PGconn);

extern proc PQfinish(ref conn : PGconn) : void;

extern proc PQfinish(conn : c_ptr(PGconn)) : void;

extern proc PQconndefaults() : c_ptr(PQconninfoOption);

extern proc PQconninfoParse(conninfo : c_string, ref errmsg : c_string) : c_ptr(PQconninfoOption);

extern proc PQconninfoParse(conninfo : c_string, errmsg : c_ptr(c_string)) : c_ptr(PQconninfoOption);

extern proc PQconninfo(ref conn : PGconn) : c_ptr(PQconninfoOption);

extern proc PQconninfo(conn : c_ptr(PGconn)) : c_ptr(PQconninfoOption);

extern proc PQconninfoFree(ref connOptions : PQconninfoOption) : void;

extern proc PQconninfoFree(connOptions : c_ptr(PQconninfoOption)) : void;

extern proc PQresetStart(ref conn : PGconn) : c_int;

extern proc PQresetStart(conn : c_ptr(PGconn)) : c_int;

extern proc PQresetPoll(ref conn : PGconn) : PostgresPollingStatusType;

extern proc PQresetPoll(conn : c_ptr(PGconn)) : PostgresPollingStatusType;

extern proc PQreset(ref conn : PGconn) : void;

extern proc PQreset(conn : c_ptr(PGconn)) : void;

extern proc PQgetCancel(ref conn : PGconn) : c_ptr(PGcancel);

extern proc PQgetCancel(conn : c_ptr(PGconn)) : c_ptr(PGcancel);

extern proc PQfreeCancel(ref cancel : PGcancel) : void;

extern proc PQfreeCancel(cancel : c_ptr(PGcancel)) : void;

extern proc PQcancel(ref cancel : PGcancel, errbuf : c_string, errbufsize : c_int) : c_int;

extern proc PQcancel(cancel : c_ptr(PGcancel), errbuf : c_string, errbufsize : c_int) : c_int;

extern proc PQrequestCancel(ref conn : PGconn) : c_int;

extern proc PQrequestCancel(conn : c_ptr(PGconn)) : c_int;

extern proc PQdb(ref conn : PGconn) : c_string;

extern proc PQdb(conn : c_ptr(PGconn)) : c_string;

extern proc PQuser(ref conn : PGconn) : c_string;

extern proc PQuser(conn : c_ptr(PGconn)) : c_string;

extern proc PQpass(ref conn : PGconn) : c_string;

extern proc PQpass(conn : c_ptr(PGconn)) : c_string;

extern proc PQhost(ref conn : PGconn) : c_string;

extern proc PQhost(conn : c_ptr(PGconn)) : c_string;

extern proc PQhostaddr(ref conn : PGconn) : c_string;

extern proc PQhostaddr(conn : c_ptr(PGconn)) : c_string;

extern proc PQport(ref conn : PGconn) : c_string;

extern proc PQport(conn : c_ptr(PGconn)) : c_string;

extern proc PQtty(ref conn : PGconn) : c_string;

extern proc PQtty(conn : c_ptr(PGconn)) : c_string;

extern proc PQoptions(ref conn : PGconn) : c_string;

extern proc PQoptions(conn : c_ptr(PGconn)) : c_string;

extern proc PQstatus(ref conn : PGconn) : ConnStatusType;

extern proc PQstatus(conn : c_ptr(PGconn)) : ConnStatusType;

extern proc PQtransactionStatus(ref conn : PGconn) : PGTransactionStatusType;

extern proc PQtransactionStatus(conn : c_ptr(PGconn)) : PGTransactionStatusType;

extern proc PQparameterStatus(ref conn : PGconn, paramName : c_string) : c_string;

extern proc PQparameterStatus(conn : c_ptr(PGconn), paramName : c_string) : c_string;

extern proc PQprotocolVersion(ref conn : PGconn) : c_int;

extern proc PQprotocolVersion(conn : c_ptr(PGconn)) : c_int;

extern proc PQserverVersion(ref conn : PGconn) : c_int;

extern proc PQserverVersion(conn : c_ptr(PGconn)) : c_int;

extern proc PQerrorMessage(ref conn : PGconn) : c_string;

extern proc PQerrorMessage(conn : c_ptr(PGconn)) : c_string;

extern proc PQsocket(ref conn : PGconn) : c_int;

extern proc PQsocket(conn : c_ptr(PGconn)) : c_int;

extern proc PQbackendPID(ref conn : PGconn) : c_int;

extern proc PQbackendPID(conn : c_ptr(PGconn)) : c_int;

extern proc PQconnectionNeedsPassword(ref conn : PGconn) : c_int;

extern proc PQconnectionNeedsPassword(conn : c_ptr(PGconn)) : c_int;

extern proc PQconnectionUsedPassword(ref conn : PGconn) : c_int;

extern proc PQconnectionUsedPassword(conn : c_ptr(PGconn)) : c_int;

extern proc PQclientEncoding(ref conn : PGconn) : c_int;

extern proc PQclientEncoding(conn : c_ptr(PGconn)) : c_int;

extern proc PQsetClientEncoding(ref conn : PGconn, encoding : c_string) : c_int;

extern proc PQsetClientEncoding(conn : c_ptr(PGconn), encoding : c_string) : c_int;

extern proc PQsslInUse(ref conn : PGconn) : c_int;

extern proc PQsslInUse(conn : c_ptr(PGconn)) : c_int;

extern proc PQsslStruct(ref conn : PGconn, struct_name : c_string) : c_void_ptr;

extern proc PQsslStruct(conn : c_ptr(PGconn), struct_name : c_string) : c_void_ptr;

extern proc PQsslAttribute(ref conn : PGconn, attribute_name : c_string) : c_string;

extern proc PQsslAttribute(conn : c_ptr(PGconn), attribute_name : c_string) : c_string;

extern proc PQsslAttributeNames(ref conn : PGconn) : c_ptr(c_string);

extern proc PQsslAttributeNames(conn : c_ptr(PGconn)) : c_ptr(c_string);

extern proc PQgetssl(ref conn : PGconn) : c_void_ptr;

extern proc PQgetssl(conn : c_ptr(PGconn)) : c_void_ptr;

extern proc PQinitSSL(do_init : c_int) : void;

extern proc PQinitOpenSSL(do_ssl : c_int, do_crypto : c_int) : void;

extern proc PQgssEncInUse(ref conn : PGconn) : c_int;

extern proc PQgssEncInUse(conn : c_ptr(PGconn)) : c_int;

extern proc PQgetgssctx(ref conn : PGconn) : c_void_ptr;

extern proc PQgetgssctx(conn : c_ptr(PGconn)) : c_void_ptr;

extern proc PQsetErrorVerbosity(ref conn : PGconn, verbosity : PGVerbosity) : PGVerbosity;

extern proc PQsetErrorVerbosity(conn : c_ptr(PGconn), verbosity : PGVerbosity) : PGVerbosity;

extern proc PQsetErrorContextVisibility(ref conn : PGconn, show_context : PGContextVisibility) : PGContextVisibility;

extern proc PQsetErrorContextVisibility(conn : c_ptr(PGconn), show_context : PGContextVisibility) : PGContextVisibility;

extern proc PQtrace(ref conn : PGconn, ref debug_port : _file) : void;

extern proc PQtrace(conn : c_ptr(PGconn), debug_port : c_ptr(_file)) : void;

extern proc PQuntrace(ref conn : PGconn) : void;

extern proc PQuntrace(conn : c_ptr(PGconn)) : void;

extern proc PQsetNoticeReceiver(ref conn : PGconn, proc_arg : PQnoticeReceiver, arg : c_void_ptr) : PQnoticeReceiver;

extern proc PQsetNoticeReceiver(conn : c_ptr(PGconn), proc_arg : PQnoticeReceiver, arg : c_void_ptr) : PQnoticeReceiver;

extern proc PQsetNoticeProcessor(ref conn : PGconn, proc_arg : PQnoticeProcessor, arg : c_void_ptr) : PQnoticeProcessor;

extern proc PQsetNoticeProcessor(conn : c_ptr(PGconn), proc_arg : PQnoticeProcessor, arg : c_void_ptr) : PQnoticeProcessor;

extern proc PQregisterThreadLock(newhandler : pgthreadlock_t) : pgthreadlock_t;

extern proc PQexec(ref conn : PGconn, query : c_string) : c_ptr(PGresult);

extern proc PQexec(conn : c_ptr(PGconn), query : c_string) : c_ptr(PGresult);

extern proc PQexecParams(ref conn : PGconn, command : c_string, nParams : c_int, ref paramTypes : Oid, ref paramValues : c_string, ref paramLengths : c_int, ref paramFormats : c_int, resultFormat : c_int) : c_ptr(PGresult);

extern proc PQexecParams(conn : c_ptr(PGconn), command : c_string, nParams : c_int, paramTypes : c_ptr(Oid), paramValues : c_ptr(c_string), paramLengths : c_ptr(c_int), paramFormats : c_ptr(c_int), resultFormat : c_int) : c_ptr(PGresult);

extern proc PQprepare(ref conn : PGconn, stmtName : c_string, query : c_string, nParams : c_int, ref paramTypes : Oid) : c_ptr(PGresult);

extern proc PQprepare(conn : c_ptr(PGconn), stmtName : c_string, query : c_string, nParams : c_int, paramTypes : c_ptr(Oid)) : c_ptr(PGresult);

extern proc PQexecPrepared(ref conn : PGconn, stmtName : c_string, nParams : c_int, ref paramValues : c_string, ref paramLengths : c_int, ref paramFormats : c_int, resultFormat : c_int) : c_ptr(PGresult);

extern proc PQexecPrepared(conn : c_ptr(PGconn), stmtName : c_string, nParams : c_int, paramValues : c_ptr(c_string), paramLengths : c_ptr(c_int), paramFormats : c_ptr(c_int), resultFormat : c_int) : c_ptr(PGresult);

extern proc PQsendQuery(ref conn : PGconn, query : c_string) : c_int;

extern proc PQsendQuery(conn : c_ptr(PGconn), query : c_string) : c_int;

extern proc PQsendQueryParams(ref conn : PGconn, command : c_string, nParams : c_int, ref paramTypes : Oid, ref paramValues : c_string, ref paramLengths : c_int, ref paramFormats : c_int, resultFormat : c_int) : c_int;

extern proc PQsendQueryParams(conn : c_ptr(PGconn), command : c_string, nParams : c_int, paramTypes : c_ptr(Oid), paramValues : c_ptr(c_string), paramLengths : c_ptr(c_int), paramFormats : c_ptr(c_int), resultFormat : c_int) : c_int;

extern proc PQsendPrepare(ref conn : PGconn, stmtName : c_string, query : c_string, nParams : c_int, ref paramTypes : Oid) : c_int;

extern proc PQsendPrepare(conn : c_ptr(PGconn), stmtName : c_string, query : c_string, nParams : c_int, paramTypes : c_ptr(Oid)) : c_int;

extern proc PQsendQueryPrepared(ref conn : PGconn, stmtName : c_string, nParams : c_int, ref paramValues : c_string, ref paramLengths : c_int, ref paramFormats : c_int, resultFormat : c_int) : c_int;

extern proc PQsendQueryPrepared(conn : c_ptr(PGconn), stmtName : c_string, nParams : c_int, paramValues : c_ptr(c_string), paramLengths : c_ptr(c_int), paramFormats : c_ptr(c_int), resultFormat : c_int) : c_int;

extern proc PQsetSingleRowMode(ref conn : PGconn) : c_int;

extern proc PQsetSingleRowMode(conn : c_ptr(PGconn)) : c_int;

extern proc PQgetResult(ref conn : PGconn) : c_ptr(PGresult);

extern proc PQgetResult(conn : c_ptr(PGconn)) : c_ptr(PGresult);

extern proc PQisBusy(ref conn : PGconn) : c_int;

extern proc PQisBusy(conn : c_ptr(PGconn)) : c_int;

extern proc PQconsumeInput(ref conn : PGconn) : c_int;

extern proc PQconsumeInput(conn : c_ptr(PGconn)) : c_int;

extern proc PQnotifies(ref conn : PGconn) : c_ptr(PGnotify);

extern proc PQnotifies(conn : c_ptr(PGconn)) : c_ptr(PGnotify);

extern proc PQputCopyData(ref conn : PGconn, buffer : c_string, nbytes : c_int) : c_int;

extern proc PQputCopyData(conn : c_ptr(PGconn), buffer : c_string, nbytes : c_int) : c_int;

extern proc PQputCopyEnd(ref conn : PGconn, errormsg : c_string) : c_int;

extern proc PQputCopyEnd(conn : c_ptr(PGconn), errormsg : c_string) : c_int;

extern proc PQgetCopyData(ref conn : PGconn, ref buffer : c_string, async : c_int) : c_int;

extern proc PQgetCopyData(conn : c_ptr(PGconn), buffer : c_ptr(c_string), async : c_int) : c_int;

extern proc PQgetline(ref conn : PGconn, string : c_string, length : c_int) : c_int;

extern proc PQgetline(conn : c_ptr(PGconn), string : c_string, length : c_int) : c_int;

extern proc PQputline(ref conn : PGconn, string : c_string) : c_int;

extern proc PQputline(conn : c_ptr(PGconn), string : c_string) : c_int;

extern proc PQgetlineAsync(ref conn : PGconn, buffer : c_string, bufsize : c_int) : c_int;

extern proc PQgetlineAsync(conn : c_ptr(PGconn), buffer : c_string, bufsize : c_int) : c_int;

extern proc PQputnbytes(ref conn : PGconn, buffer : c_string, nbytes : c_int) : c_int;

extern proc PQputnbytes(conn : c_ptr(PGconn), buffer : c_string, nbytes : c_int) : c_int;

extern proc PQendcopy(ref conn : PGconn) : c_int;

extern proc PQendcopy(conn : c_ptr(PGconn)) : c_int;

extern proc PQsetnonblocking(ref conn : PGconn, arg : c_int) : c_int;

extern proc PQsetnonblocking(conn : c_ptr(PGconn), arg : c_int) : c_int;

extern proc PQisnonblocking(ref conn : PGconn) : c_int;

extern proc PQisnonblocking(conn : c_ptr(PGconn)) : c_int;

extern proc PQisthreadsafe() : c_int;

extern proc PQping(conninfo : c_string) : PGPing;

extern proc PQpingParams(ref keywords : c_string, ref values : c_string, expand_dbname : c_int) : PGPing;

extern proc PQpingParams(keywords : c_ptr(c_string), values : c_ptr(c_string), expand_dbname : c_int) : PGPing;

extern proc PQflush(ref conn : PGconn) : c_int;

extern proc PQflush(conn : c_ptr(PGconn)) : c_int;

extern proc PQfn(ref conn : PGconn, fnid : c_int, ref result_buf : c_int, ref result_len : c_int, result_is_int : c_int, ref args : PQArgBlock, nargs : c_int) : c_ptr(PGresult);

extern proc PQfn(conn : c_ptr(PGconn), fnid : c_int, result_buf : c_ptr(c_int), result_len : c_ptr(c_int), result_is_int : c_int, args : c_ptr(PQArgBlock), nargs : c_int) : c_ptr(PGresult);

extern proc PQresultStatus(ref res : PGresult) : ExecStatusType;

extern proc PQresultStatus(res : c_ptr(PGresult)) : ExecStatusType;

extern proc PQresStatus(status : ExecStatusType) : c_string;

extern proc PQresultErrorMessage(ref res : PGresult) : c_string;

extern proc PQresultErrorMessage(res : c_ptr(PGresult)) : c_string;

extern proc PQresultVerboseErrorMessage(ref res : PGresult, verbosity : PGVerbosity, show_context : PGContextVisibility) : c_string;

extern proc PQresultVerboseErrorMessage(res : c_ptr(PGresult), verbosity : PGVerbosity, show_context : PGContextVisibility) : c_string;

extern proc PQresultErrorField(ref res : PGresult, fieldcode : c_int) : c_string;

extern proc PQresultErrorField(res : c_ptr(PGresult), fieldcode : c_int) : c_string;

extern proc PQntuples(ref res : PGresult) : c_int;

extern proc PQntuples(res : c_ptr(PGresult)) : c_int;

extern proc PQnfields(ref res : PGresult) : c_int;

extern proc PQnfields(res : c_ptr(PGresult)) : c_int;

extern proc PQbinaryTuples(ref res : PGresult) : c_int;

extern proc PQbinaryTuples(res : c_ptr(PGresult)) : c_int;

extern proc PQfname(ref res : PGresult, field_num : c_int) : c_string;

extern proc PQfname(res : c_ptr(PGresult), field_num : c_int) : c_string;

extern proc PQfnumber(ref res : PGresult, field_name : c_string) : c_int;

extern proc PQfnumber(res : c_ptr(PGresult), field_name : c_string) : c_int;

extern proc PQftable(ref res : PGresult, field_num : c_int) : Oid;

extern proc PQftable(res : c_ptr(PGresult), field_num : c_int) : Oid;

extern proc PQftablecol(ref res : PGresult, field_num : c_int) : c_int;

extern proc PQftablecol(res : c_ptr(PGresult), field_num : c_int) : c_int;

extern proc PQfformat(ref res : PGresult, field_num : c_int) : c_int;

extern proc PQfformat(res : c_ptr(PGresult), field_num : c_int) : c_int;

extern proc PQftype(ref res : PGresult, field_num : c_int) : Oid;

extern proc PQftype(res : c_ptr(PGresult), field_num : c_int) : Oid;

extern proc PQfsize(ref res : PGresult, field_num : c_int) : c_int;

extern proc PQfsize(res : c_ptr(PGresult), field_num : c_int) : c_int;

extern proc PQfmod(ref res : PGresult, field_num : c_int) : c_int;

extern proc PQfmod(res : c_ptr(PGresult), field_num : c_int) : c_int;

extern proc PQcmdStatus(ref res : PGresult) : c_string;

extern proc PQcmdStatus(res : c_ptr(PGresult)) : c_string;

extern proc PQoidStatus(ref res : PGresult) : c_string;

extern proc PQoidStatus(res : c_ptr(PGresult)) : c_string;

extern proc PQoidValue(ref res : PGresult) : Oid;

extern proc PQoidValue(res : c_ptr(PGresult)) : Oid;

extern proc PQcmdTuples(ref res : PGresult) : c_string;

extern proc PQcmdTuples(res : c_ptr(PGresult)) : c_string;

extern proc PQgetvalue(ref res : PGresult, tup_num : c_int, field_num : c_int) : c_string;

extern proc PQgetvalue(res : c_ptr(PGresult), tup_num : c_int, field_num : c_int) : c_string;

extern proc PQgetlength(ref res : PGresult, tup_num : c_int, field_num : c_int) : c_int;

extern proc PQgetlength(res : c_ptr(PGresult), tup_num : c_int, field_num : c_int) : c_int;

extern proc PQgetisnull(ref res : PGresult, tup_num : c_int, field_num : c_int) : c_int;

extern proc PQgetisnull(res : c_ptr(PGresult), tup_num : c_int, field_num : c_int) : c_int;

extern proc PQnparams(ref res : PGresult) : c_int;

extern proc PQnparams(res : c_ptr(PGresult)) : c_int;

extern proc PQparamtype(ref res : PGresult, param_num : c_int) : Oid;

extern proc PQparamtype(res : c_ptr(PGresult), param_num : c_int) : Oid;

extern proc PQdescribePrepared(ref conn : PGconn, stmt : c_string) : c_ptr(PGresult);

extern proc PQdescribePrepared(conn : c_ptr(PGconn), stmt : c_string) : c_ptr(PGresult);

extern proc PQdescribePortal(ref conn : PGconn, portal : c_string) : c_ptr(PGresult);

extern proc PQdescribePortal(conn : c_ptr(PGconn), portal : c_string) : c_ptr(PGresult);

extern proc PQsendDescribePrepared(ref conn : PGconn, stmt : c_string) : c_int;

extern proc PQsendDescribePrepared(conn : c_ptr(PGconn), stmt : c_string) : c_int;

extern proc PQsendDescribePortal(ref conn : PGconn, portal : c_string) : c_int;

extern proc PQsendDescribePortal(conn : c_ptr(PGconn), portal : c_string) : c_int;

extern proc PQclear(ref res : PGresult) : void;

extern proc PQclear(res : c_ptr(PGresult)) : void;

extern proc PQfreemem(ptr : c_void_ptr) : void;

extern proc PQmakeEmptyPGresult(ref conn : PGconn, status : ExecStatusType) : c_ptr(PGresult);

extern proc PQmakeEmptyPGresult(conn : c_ptr(PGconn), status : ExecStatusType) : c_ptr(PGresult);

extern proc PQcopyResult(ref src : PGresult, flags : c_int) : c_ptr(PGresult);

extern proc PQcopyResult(src : c_ptr(PGresult), flags : c_int) : c_ptr(PGresult);

extern proc PQsetResultAttrs(ref res : PGresult, numAttributes : c_int, ref attDescs : PGresAttDesc) : c_int;

extern proc PQsetResultAttrs(res : c_ptr(PGresult), numAttributes : c_int, attDescs : c_ptr(PGresAttDesc)) : c_int;

extern proc PQresultAlloc(ref res : PGresult, nBytes : size_t) : c_void_ptr;

extern proc PQresultAlloc(res : c_ptr(PGresult), nBytes : size_t) : c_void_ptr;

extern proc PQresultMemorySize(ref res : PGresult) : size_t;

extern proc PQresultMemorySize(res : c_ptr(PGresult)) : size_t;

extern proc PQsetvalue(ref res : PGresult, tup_num : c_int, field_num : c_int, value : c_string, len : c_int) : c_int;

extern proc PQsetvalue(res : c_ptr(PGresult), tup_num : c_int, field_num : c_int, value : c_string, len : c_int) : c_int;

extern proc PQescapeStringConn(ref conn : PGconn, to : c_string, from : c_string, length : size_t, ref error : c_int) : size_t;

extern proc PQescapeStringConn(conn : c_ptr(PGconn), to : c_string, from : c_string, length : size_t, error : c_ptr(c_int)) : size_t;

extern proc PQescapeLiteral(ref conn : PGconn, str : c_string, len : size_t) : c_string;

extern proc PQescapeLiteral(conn : c_ptr(PGconn), str : c_string, len : size_t) : c_string;

extern proc PQescapeIdentifier(ref conn : PGconn, str : c_string, len : size_t) : c_string;

extern proc PQescapeIdentifier(conn : c_ptr(PGconn), str : c_string, len : size_t) : c_string;

extern proc PQescapeByteaConn(ref conn : PGconn, ref from : c_uchar, from_length : size_t, ref to_length : size_t) : c_ptr(c_uchar);

extern proc PQescapeByteaConn(conn : c_ptr(PGconn), from : c_ptr(c_uchar), from_length : size_t, to_length : c_ptr(size_t)) : c_ptr(c_uchar);

extern proc PQunescapeBytea(ref strtext : c_uchar, ref retbuflen : size_t) : c_ptr(c_uchar);

extern proc PQunescapeBytea(strtext : c_ptr(c_uchar), retbuflen : c_ptr(size_t)) : c_ptr(c_uchar);

extern proc PQescapeString(to : c_string, from : c_string, length : size_t) : size_t;

extern proc PQescapeBytea(ref from : c_uchar, from_length : size_t, ref to_length : size_t) : c_ptr(c_uchar);

extern proc PQescapeBytea(from : c_ptr(c_uchar), from_length : size_t, to_length : c_ptr(size_t)) : c_ptr(c_uchar);

extern proc PQprint(ref fout : _file, ref res : PGresult, ref ps : PQprintOpt) : void;

extern proc PQprint(fout : c_ptr(_file), res : c_ptr(PGresult), ps : c_ptr(PQprintOpt)) : void;

extern proc PQdisplayTuples(ref res : PGresult, ref fp : _file, fillAlign : c_int, fieldSep : c_string, printHeader : c_int, quiet : c_int) : void;

extern proc PQdisplayTuples(res : c_ptr(PGresult), fp : c_ptr(_file), fillAlign : c_int, fieldSep : c_string, printHeader : c_int, quiet : c_int) : void;

extern proc PQprintTuples(ref res : PGresult, ref fout : _file, printAttName : c_int, terseOutput : c_int, width : c_int) : void;

extern proc PQprintTuples(res : c_ptr(PGresult), fout : c_ptr(_file), printAttName : c_int, terseOutput : c_int, width : c_int) : void;

extern proc lo_open(ref conn : PGconn, lobjId : Oid, mode : c_int) : c_int;

extern proc lo_open(conn : c_ptr(PGconn), lobjId : Oid, mode : c_int) : c_int;

extern proc lo_close(ref conn : PGconn, fd : c_int) : c_int;

extern proc lo_close(conn : c_ptr(PGconn), fd : c_int) : c_int;

extern proc lo_read(ref conn : PGconn, fd : c_int, buf : c_string, len : size_t) : c_int;

extern proc lo_read(conn : c_ptr(PGconn), fd : c_int, buf : c_string, len : size_t) : c_int;

extern proc lo_write(ref conn : PGconn, fd : c_int, buf : c_string, len : size_t) : c_int;

extern proc lo_write(conn : c_ptr(PGconn), fd : c_int, buf : c_string, len : size_t) : c_int;

extern proc lo_lseek(ref conn : PGconn, fd : c_int, offset : c_int, whence : c_int) : c_int;

extern proc lo_lseek(conn : c_ptr(PGconn), fd : c_int, offset : c_int, whence : c_int) : c_int;

extern proc lo_lseek64(ref conn : PGconn, fd : c_int, offset : pg_int64, whence : c_int) : pg_int64;

extern proc lo_lseek64(conn : c_ptr(PGconn), fd : c_int, offset : pg_int64, whence : c_int) : pg_int64;

extern proc lo_creat(ref conn : PGconn, mode : c_int) : Oid;

extern proc lo_creat(conn : c_ptr(PGconn), mode : c_int) : Oid;

extern proc lo_create(ref conn : PGconn, lobjId : Oid) : Oid;

extern proc lo_create(conn : c_ptr(PGconn), lobjId : Oid) : Oid;

extern proc lo_tell(ref conn : PGconn, fd : c_int) : c_int;

extern proc lo_tell(conn : c_ptr(PGconn), fd : c_int) : c_int;

extern proc lo_tell64(ref conn : PGconn, fd : c_int) : pg_int64;

extern proc lo_tell64(conn : c_ptr(PGconn), fd : c_int) : pg_int64;

extern proc lo_truncate(ref conn : PGconn, fd : c_int, len : size_t) : c_int;

extern proc lo_truncate(conn : c_ptr(PGconn), fd : c_int, len : size_t) : c_int;

extern proc lo_truncate64(ref conn : PGconn, fd : c_int, len : pg_int64) : c_int;

extern proc lo_truncate64(conn : c_ptr(PGconn), fd : c_int, len : pg_int64) : c_int;

extern proc lo_unlink(ref conn : PGconn, lobjId : Oid) : c_int;

extern proc lo_unlink(conn : c_ptr(PGconn), lobjId : Oid) : c_int;

extern proc lo_import(ref conn : PGconn, filename : c_string) : Oid;

extern proc lo_import(conn : c_ptr(PGconn), filename : c_string) : Oid;

extern proc lo_import_with_oid(ref conn : PGconn, filename : c_string, lobjId : Oid) : Oid;

extern proc lo_import_with_oid(conn : c_ptr(PGconn), filename : c_string, lobjId : Oid) : Oid;

extern proc lo_export(ref conn : PGconn, lobjId : Oid, filename : c_string) : c_int;

extern proc lo_export(conn : c_ptr(PGconn), lobjId : Oid, filename : c_string) : c_int;

extern proc PQlibVersion() : c_int;

extern proc PQmblen(s : c_string, encoding : c_int) : c_int;

extern proc PQdsplen(s : c_string, encoding : c_int) : c_int;

extern proc PQenv2encoding() : c_int;

extern proc PQencryptPassword(passwd : c_string, user : c_string) : c_string;

extern proc PQencryptPasswordConn(ref conn : PGconn, passwd : c_string, user : c_string, algorithm : c_string) : c_string;

extern proc PQencryptPasswordConn(conn : c_ptr(PGconn), passwd : c_string, user : c_string, algorithm : c_string) : c_string;

extern proc pg_char_to_encoding(name : c_string) : c_int;

extern proc pg_encoding_to_char(encoding : c_int) : c_string;

extern proc pg_valid_server_encoding_id(encoding : c_int) : c_int;

// ==== c2chapel typedefs ====

// ConnStatusType enum
extern type ConnStatusType = c_int;
extern const CONNECTION_OK :ConnStatusType;
extern const CONNECTION_BAD :ConnStatusType;
extern const CONNECTION_STARTED :ConnStatusType;
extern const CONNECTION_MADE :ConnStatusType;
extern const CONNECTION_AWAITING_RESPONSE :ConnStatusType;
extern const CONNECTION_AUTH_OK :ConnStatusType;
extern const CONNECTION_SETENV :ConnStatusType;
extern const CONNECTION_SSL_STARTUP :ConnStatusType;
extern const CONNECTION_NEEDED :ConnStatusType;
extern const CONNECTION_CHECK_WRITABLE :ConnStatusType;
extern const CONNECTION_CONSUME :ConnStatusType;
extern const CONNECTION_GSS_STARTUP :ConnStatusType;


// ExecStatusType enum
extern type ExecStatusType = c_int;
extern const PGRES_EMPTY_QUERY :ExecStatusType;
extern const PGRES_COMMAND_OK :ExecStatusType;
extern const PGRES_TUPLES_OK :ExecStatusType;
extern const PGRES_COPY_OUT :ExecStatusType;
extern const PGRES_COPY_IN :ExecStatusType;
extern const PGRES_BAD_RESPONSE :ExecStatusType;
extern const PGRES_NONFATAL_ERROR :ExecStatusType;
extern const PGRES_FATAL_ERROR :ExecStatusType;
extern const PGRES_COPY_BOTH :ExecStatusType;
extern const PGRES_SINGLE_TUPLE :ExecStatusType;


extern type Oid = c_uint;

// PGContextVisibility enum
extern type PGContextVisibility = c_int;
extern const PQSHOW_CONTEXT_NEVER :PGContextVisibility;
extern const PQSHOW_CONTEXT_ERRORS :PGContextVisibility;
extern const PQSHOW_CONTEXT_ALWAYS :PGContextVisibility;


// PGPing enum
extern type PGPing = c_int;
extern const PQPING_OK :PGPing;
extern const PQPING_REJECT :PGPing;
extern const PQPING_NO_RESPONSE :PGPing;
extern const PQPING_NO_ATTEMPT :PGPing;


// PGTransactionStatusType enum
extern type PGTransactionStatusType = c_int;
extern const PQTRANS_IDLE :PGTransactionStatusType;
extern const PQTRANS_ACTIVE :PGTransactionStatusType;
extern const PQTRANS_INTRANS :PGTransactionStatusType;
extern const PQTRANS_INERROR :PGTransactionStatusType;
extern const PQTRANS_UNKNOWN :PGTransactionStatusType;


// PGVerbosity enum
extern type PGVerbosity = c_int;
extern const PQERRORS_TERSE :PGVerbosity;
extern const PQERRORS_DEFAULT :PGVerbosity;
extern const PQERRORS_VERBOSE :PGVerbosity;
extern const PQERRORS_SQLSTATE :PGVerbosity;


// Opaque struct?
extern record PGcancel {};

// Opaque struct?
extern record PGconn {};

extern record PGnotify {
  var relname : c_string;
  var be_pid : c_int;
  var extra : c_string;
  var next : c_ptr(pgNotify);
}

extern record PGresAttDesc {
  var name : c_string;
  var tableid : Oid;
  var columnid : c_int;
  var format : c_int;
  var typid : Oid;
  var typlen : c_int;
  var atttypmod : c_int;
}

// Opaque struct?
extern record PGresult {};