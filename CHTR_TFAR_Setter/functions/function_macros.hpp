#include "../config_macros.hpp"
#define LOG_BASE(level,msg) diag_log format[QUOTE(ADDON[level]: %1), msg]
#define LOG(msg) _dtmpstr = msg; \
LOG_BASE(DEBUG,_str)
#define LOG_ERROR(msg) LOG_BASE(ERR,msg)