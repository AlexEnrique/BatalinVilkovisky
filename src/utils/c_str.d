module utils.c_str;

import core.stdc.stdlib;

@nogc char* c_str(string dstr) {
	import core.stdc.stdlib : malloc;
    char* cstr = cast(char*) malloc((dstr.length + 1) * char.sizeof);

    for (int i = 0; i < dstr.length; ++i) {
        cstr[i] = dstr[i];
    }
    cstr[dstr.length] = '\0';

    return cstr;
}
