#include "../config_macros.hpp"
#define LOG_BASE(level,msg) diag_log text format[QUOTE(ADDON[level]: %1), msg]
#define LOG(msg) LOG_BASE(DEBUG,msg)
#define LOG_ERROR(msg) LOG_BASE(ERR,msg)
#define LOG_FILENUMBER(level,msg) format [ARR_4('%1 %2:%3',msg,__FILE__,__LINE__ + 1)]