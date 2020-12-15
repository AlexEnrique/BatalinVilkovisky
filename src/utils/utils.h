#ifndef UTILS_H
#define UTILS_H

#include <string>
#include <vector>

namespace utils {
    extern bool terminating_char(int);
    using Args = std::vector<std::string>;
    extern Args split(const std::string&, char ch = ' ');
}

#endif
