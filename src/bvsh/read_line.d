/**
 * Author: Alex Enrique Crispim, alexenriquecrispim@gmail.com
 * Date: December 11, 2020
 * Version: 0.2
 *
 * History:
 *      V0.1 - initial development version
 *      V0.2 - preliminar version using NCURSES
 */
module bvsh.read_line;

import core.stdc.stdio : EOF;
import std.algorithm.searching : canFind;
import deimos.ncurses.ncurses;

string readLine(WINDOW* win) {
    string userInput; // buffer
    int ch;

    while (!['\n', '\r', EOF].canFind(ch = wgetch(win)) /* not terminating */) {
        if (ch == 127 /* BACKSPACE ASCII */) {
            int y, x;
            getyx(win, y, x); // get current cursor position

            if (x > 0) {
                mvwaddch(win, y, x - 1, ' '); // erases the character on the screen
                wmove(win, y, x - 1); // put the cursor where the character has
                                // just been erased

                userInput = userInput[0 .. $-1]; // erasing character on buffer

                wrefresh(win);
            }
            continue;
        }

        userInput ~= cast(char) ch; // pushing character into the buffer
        waddch(win, ch);
        wrefresh(win);
    }

    return userInput;
}
