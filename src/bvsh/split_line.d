/**
 * Author: Alex Enrique Crispim, alexenriquecrispim@gmail.com
 * Date: November 25, 2020
 * Version: 0.1
 *
 * History:
 *      V0.1 - initial development version
 *      V0.2 - preliminar version using NCURSES
 */
module bvsh.split_line;

import std.string : strip;
import std.algorithm : splitter;
import std.array : array;

string[] splitLine(string line) {
    return line.strip()
               .splitter(" ")
               .array();
}
