#ifndef INIT_TERMINAL_CPP
#define INIT_TERMINAL_CPP

#include <ncurses.h>

#include "config.h"

void config::init_terminal() {
    initscr();
    cbreak();
    noecho();
    keypad(stdscr, true);
}

#endif
