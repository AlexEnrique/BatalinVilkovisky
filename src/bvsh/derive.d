module bvsh.derive;

import std.stdio : writeln;

/**
  Receives an array of strings of the form ["A", "B", ... "C"] and
  a string 'X'.
  Return an array of strings of the form ["A", ..., "C", "X"],
  where 'X' is the term with respect we are deriving to.
*/
string[] derive(string[] arg, string X) {
	return arg ~ X;
}

void test(string[] args) {
	string X = args[$-1];
	args = args[1 .. $-1];

	writeln(derive(args, X));
}
