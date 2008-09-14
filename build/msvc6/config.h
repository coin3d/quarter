#ifndef QUARTER_DEBUG
#error The define QUARTER_DEBUG needs to be defined to true or false
#endif

#ifndef QUARTER_INTERNAL
#error this is a private header file
#endif

#if QUARTER_DEBUG
#include "config-debug.h"
#else /* !QUARTER_DEBUG */
#include "config-release.h"
#endif /* !QUARTER_DEBUG */
