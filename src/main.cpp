#ifndef MAIN_CPP
#define MAIN_CPP

#include <ncurses.h>
#include <string>
#include <vector>
#include <functional>

#include "io/io.h"
#include "config/config.h"
#include "commands/commands.h"
#include "utils/utils.h"

int main() {
    using utils::Args;
    using commands::Command;
    using commands::commands;

    config::init_terminal();

    std::string prompt_text = "prompt>> ";
    std::string user_input = "";
    while (true) {
        printw(prompt_text.c_str());
        refresh();

        user_input = io::read_line(prompt_text);
        if (user_input.empty()) {
            printw("\n");
            continue;
        }

        Args args = utils::split(user_input);

        if (commands.contains(args[0])) {
            Command cmd = commands[args[0]];
            Command::execute(cmd, args);

            if (args[0] != "clear")
                printw("\n");
        }
        else {
			utils::Args text_arg = {args[0]};
            Command::execute(commands["invalid cmd"], text_arg);
			printw("\n");
        }
    }

    printw("\n");
    endwin();

    return 0;
}



#endif
