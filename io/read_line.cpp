#ifndef READ_LINE_CPP
#define READ_LINE_CPP

#include <iostream>
#include <ncurses.h>

#include "../utils/utils.h"
#include "io.h"

std::string io::read_line(std::string prompt_text /*= "prompt >>"*/) {
    int ch;
    std::string user_input = "";

    while (not utils::terminating_char((ch = getch()))) {
        if (ch == 127 /* BACKSPACE ASCII */) {
            if (user_input.length() == 0) {
                beep();
                refresh();
            }

            size_t y, x;
            getyx(stdscr, y, x); // get current cursor position

            if (x > prompt_text.length()) {
                mvaddch(y, x - 1, ' '); // erases the character on screen
                move(y, x - 1); // put the cursor where the character has
                                      // just been erased

                if (user_input.length() > 0)
                    user_input.pop_back(); // erasing char. on buffer

                refresh();
            }
            continue;
        }

        if (ch == KEY_UP) {
            printw("\nYou pressed KEY_UP");
            refresh();
            break;
        }
        else if (ch == KEY_DOWN) {
            printw("\nYou pressed KEY_DOWN");
            refresh();
            break;
        }
        else if ((ch == KEY_LEFT || ch == KEY_RIGHT) && user_input.empty()) {
            beep();
            refresh();
            continue;
        }

        // switch (ch) {
        //     case KEY_UP:
        //         printw("\nYou pressed KEY_UP");
        //         refresh();
        //         break;
        //     default:
        //         break;
        // }

        user_input += static_cast<char>(ch); // pushing character into the buffer
        addch(ch);
        refresh();
    }

    return user_input;
}

#endif
