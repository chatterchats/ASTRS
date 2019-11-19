#include "../config_macros.hpp"
#define LOG_BASE(level,msg) diag_log format[QUOTE(ADDON[level]: %1), msg]
#define LOG(msg) LOG_BASE(DEBUG,msg)
#define LOG_F(fmt,args) LOG_BASE(DEBUG,format[fmt, args])
#define LOG_ERROR(msg) LOG_BASE(ERR,msg)