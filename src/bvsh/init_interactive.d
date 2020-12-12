/**
 * Author: Alex Enrique Crispim, alexenriquecrispim@gmail.com
 * Date: November 25, 2020
 * Version: 0.2
 *
 * History:
 *      V0.2 - implemented NCURSES stdscr initializer
 */
module bvsh.init_interactive;

import deimos.ncurses.ncurses;

void initializeInteractiveMode() {
    initscr();
    cbreak();
    noecho();
    keypad(stdscr, true);
}
