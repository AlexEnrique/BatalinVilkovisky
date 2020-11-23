/** This is the main file
 *  Author: Alex Enrique Crispim, alexenriquecrispim@gmail.com
 *  Date: November 23, 2020
 *  License: Use freely for any purpose
 */
module main;

/**
 * Macros:
 *      FOO =   now is the time for
 *              all good men
 *      BAR =   bar
 *      MAGENTA =   <font color="magenta">$0</font>
 */


/***********************************
 * Brief summary of what
 * myfunc does, forming the summary section.
 *
 * First paragraph of synopsis description.
 *
 * Second paragraph of
 * synopsis description.
 */
 /**
 * Examples:
 * --------------------
 * writeln("3"); // writes '3' to stdout
 * --------------------
 */
void myfunc() { }


/**
    Deprecated: superseded by function myfunc()
*/
void bar() { }

/**
 * Read the file.
 * Returns: The contents of the file.
 */
 /**
 * See_Also:
 *    foo, bar, http://www.digitalmars.com/d/phobos/index.html
 */
void[] readFile(const(char)[] filename);


/**
 * Write the file.
 * Throws: WriteException on failure.
 */

void writeFile(string filename);


/***********************************
 * foo does this.
 * Params:
 *      x =     is for this
 *              and not for that
 *      y =     is for that
 */

void foo(int x, int y)
{
}

int a; /// documentation for a; b has no documentation
int b;

/** documentation for c and d */
/** more documentation for c and d */
int c;
/** ditto */
int d;

/** documentation for e and f */ int e;
int f; /// ditto

/** documentation for g */
int g; /// more documentation for g

/// documentation for C and D
class C {
    int x; /// documentation for C.x

    /** documentation for C.y and C.z */
    int y;
    int z; /// ditto
}

/// ditto
class D { }


import std.stdio;

void main(string[] args) {
    if (args.length > 1)
        writeln(args[1..$]);
}
