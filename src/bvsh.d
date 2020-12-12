/**
 * Author: Alex Enrique Crispim, alexenriquecrispim@gmail.com
 * Date: November 25, 2020
 * Version: 0.2
 *
 * History:
 *      V0.1 - initial development version
 *      V0.2 - preliminar version using NCURSES
 */
module main;

import std.range;
import std.algorithm;
import std.array;
import std.conv : to;
import std.string;
import std.stdio;

/* move this maybe */
import core.stdc.stdlib : exit;
import core.sys.posix.unistd : fork, pid_t, execvp;
import core.sys.posix.sys.wait;

import core.stdc.stdlib : malloc; // remove latter
import core.stdc.stdio : printf;

import deimos.ncurses.ncurses;

import utils.c_str;
/* import utils.c_str_to_d_str; */
/* import utils.c_args; */

import bvsh.read_line;
import bvsh.split_line;
import bvsh.init_interactive;

immutable string PATH = "./bin/"; // path to compiled subprograms

void main() {
    initializeInteractiveMode();

    string userInput;

    while (true) {
        printw("prompt>> ");

        userInput = readLine(stdscr);
        string[] arguments = userInput.splitLine();

        if (arguments[0] == "exit") {
            endwin();
            return;
        }

        printw("You have typed: %s", userInput.c_str());
        writefln("\n\rBy chuncks: %s", arguments);


        printw("\n");
        refresh();
    }

    getch();


    endwin();
}



/*
alias Functions = void delegate();
Functions[string] bvshCommands = [
    "exit" : {
        exit(0);
    },
    `clear` : {
        writeln("\033[H\033[J");
    }
];

string[] programs = [
    "pwd", `der`
];

pid_t pid;

char* subprogram;
char** args;


char* line;

while((line = linenoise("bvsh>> ")) !is null) {
    /* Do something with the string.
    linenoiseHistoryAdd(line); /* Add to the history.
    linenoiseHistorySave("./tmp/history.txt"); /* Save the history on disk.
    userInput = line.c_str_to_d_str()
                    .strip()
                    .splitter(' ')
                    .array();

    command = userInput[0];

    if (command in bvshCommands) {
        auto funcCommand = bvshCommands[command];
        funcCommand();
        continue;
    }

    if (!programs.canFind(command)) {
        stderr.writefln("\aError: '%s' is not a valid command.\n", command);
        continue;
    }

    // Run command
    pid = fork();

    if (pid < 0) {
        stderr.writeln("Error: fork failed");
        return;
    }
    else if (pid == 0) {
        subprogram = (PATH ~ userInput[0]).c_str();
        args = ((PATH ~ userInput[0]) ~ userInput[1 .. $]).c_args();

        execvp(subprogram, args);
    }

    wait(null);

    free(line);
}

free(subprogram);
free(args);
*/
