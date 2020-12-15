#ifndef TERMINATING_CHAR_CPP
#define TERMINATING_CHAR_CPP

#include <iostream>

#include "utils.h"

bool utils::terminating_char(int ch) {
    return static_cast<char>(ch) == '\n' ||
           static_cast<char>(ch) == '\r' ||
           static_cast<char>(ch) == EOF;
}

#endif
