TARGETS = main
DEPS = config/init_terminal.cpp io/read_line.cpp utils/terminating_char.cpp\
			 utils/split.cpp commands/command.cpp commands/commands.cpp
CFLAGS = -Wall -g -lncurses -std=c++20 $(DEPS) #-Werror

CROSS_TOOL =
COMPILER = $(CROSS_TOOL)g++

all: clean $(TARGETS)

$(TARGETS):
	$(COMPILER) $(CFLAGS) $@.cpp -o $@

clean:
	rm -f $(TARGETS)
