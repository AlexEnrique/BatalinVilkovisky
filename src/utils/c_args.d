module utils.c_args;

import core.stdc.stdlib;
import utils.c_str;

@nogc char** c_args(string[] array) {
	char** c_array;

	c_array = cast(char**) malloc((array.length + 1) * char.sizeof);

	foreach (n; 0 .. array.length) {
		c_array[n] = cast(char*) malloc((array[n].length + 1) * char.sizeof);
		c_array[n] = array[n].c_str();
	}

	c_array[array.length] = null;

	return c_array;
}
