#ifndef COMMAND_CPP
#define COMMAND_CPP

#include "../utils/utils.h"
#include "commands.h"

using namespace commands;

Command::Command() {}

Command::Command(std::function<void (const utils::Args&)> func) {
    _func = func;
}

void Command::execute(Command cmd, utils::Args args) {
    return cmd._func(args);
}


#endif
