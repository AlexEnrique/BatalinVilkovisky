#ifndef COMMANDS_CPP
#define COMMANDS_CPP

#include <sstream>

#include "commands.h"
#include "../utils/utils.h"

using utils::Args;
using commands::Command;

std::unordered_map<std::string, Command> commands::commands = {
    {
        "exit", Command([](const Args& args) {
            endwin();
            exit(0);
        })
    },
    {
        "clear", Command([](const Args& args) {
            clear();
            refresh();
        })
    },
    {
         "invalid cmd", Command([](const Args& text_arg) {
			std::ostringstream str_stream;
            str_stream << "Error: \'" << text_arg[0] << "\': ";
            str_stream << "invalid command.";

            beep();
            printw("\n%s", str_stream.str().c_str());
            refresh();
        })
    }
};

#endif
