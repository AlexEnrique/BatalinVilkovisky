module utils.c_str_to_d_str;

import std.conv : to;
import std.string : join;

string c_str_to_d_str(char* c_str) {
    string d_str;

    for (int i = 0; c_str[i] != '\0' ; ++i)
        d_str ~= c_str[i];

    return d_str;
}
