# Current version: V0.2

BVSH = bvsh
DEPENDENCIES = $(UTILS)*.d $(BVSHFUNCS)*.d 
COMPILEFLAGS = -of$(TMP)$@.o -c -I=$(SRC):$(LIB)
LINKFLAGS = -of$(BIN)$@ -L--no-as-needed -L-O1 -L--sort-common -L--as-needed\
 						-L-z -Lrelro -L-z -Lnow -L-lncursesw -L-llinenoise -g

# Paths
SRC = ./src/
UTILS = ./src/utils/
BVSHFUNCS = ./src/bvsh/
LIB = ./lib/
BIN = ./bin/
TMP = ./tmp/

# Libraries files
LIBFILE = libncurses-d.a

CC_D = /usr/bin/dmd

all: clean $(UTILS) $(BVSH)

$(BVSH):
	$(CC_D) $(COMPILEFLAGS) $(SRC)$@.d $(DEPENDENCIES)
	$(CC_D) $(TMP)$@.o $(LIB)$(LIBFILE) $(LINKFLAGS)
	rm -rf $(TMP)$(BVSH).o

clean:
	rm -rf $(BIN)$(BVSH)
