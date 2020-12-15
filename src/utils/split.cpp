#ifndef SPLIT_C
#define SPLIT_C

#include <string>
#include <vector>

#include "utils.h"

utils::Args utils::split(const std::string& text, char ch /* =' ' */) {
    std::vector<std::string> splited;

	size_t pos = text.find(ch);
    size_t initial_pos = 0;

    // Decompose statement
    while(pos != std::string::npos) {
        splited.push_back(text.substr(initial_pos, pos - initial_pos));
        initial_pos = pos + 1;

        pos = text.find(ch, initial_pos);
    }

    // Add the last one
    splited.push_back(text.substr(initial_pos,
        std::min(pos, text.size()) - initial_pos + 1));

    return splited;
}

#endif
