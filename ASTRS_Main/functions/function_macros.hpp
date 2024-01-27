#include "../config_macros.hpp"
#define LOG_BASE(level,msg) diag_log text format[QUOTE(ADDON[level]: %1), msg]
#define LOG(msg) LOG_BASE(DEBUG, LOG_FILENUMBER(msg))
#define LOGF_1(msg,arg0) LOG(format[ARR_2(msg,arg0)])
#define LOGF_2(msg,arg0,arg1) LOG(format[ARR_3(msg,arg0,arg1)])
#define LOGF_3(msg,arg0,arg1,arg2) LOG(format[ARR_4(msg,arg0,arg1,arg2)])
#define LOG_ERROR(msg) LOG_BASE(ERR,LOG_FILENUMBER(msg))
#define LOG_ERRORF_1(msg,arg0) LOG_ERROR(format[ARR_2(msg,arg0)])
#define LOG_ERRORF_2(msg,arg0,arg1) LOG_ERROR(format[ARR_3(msg,arg0,arg1)])
#define LOG_FILENUMBER(msg) format [ARR_4('%1 at %2:%3',msg,__FILE__,__LINE__ + 1)]