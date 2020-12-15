#ifndef COMMANDS_H
#define COMMANDS_H

#include <functional>
#include <unordered_map>
#include <ncurses.h>

#include "../utils/utils.h"

using utils::Args;

namespace commands {
    class Command {
    public:
        Command();

        Command(std::function<void (const Args&)>);

        static void execute(Command, Args);

    private:
        std::function<void (const Args&)> _func;
    };

    extern std::unordered_map<std::string, Command> commands;
}

#endif
