PREFIX ?= /usr/local

SRC = levenshtein-cli.c deps/levenshtein.c/levenshtein.c

OBJ_SRC = $(SRC:.c=.o)

CFLAGS = -D_GNU_SOURCE -std=c99 -I deps/levenshtein.c/

LFLAGS = -Wall -Wno-format-y2k -W -Wstrict-prototypes \
	-Wpointer-arith -Wreturn-type -Wcast-qual -Wwrite-strings -Wswitch \
	-Wshadow -Wcast-align -Wbad-function-cast -Wchar-subscripts -Winline \
	-Wnested-externs -Wredundant-decls

levenshtein: $(OBJ_SRC)
	$(CC) $(OBJ_SRC) -o $@

.SUFFIXES: .c .o
.c.o:
	$(CC) $< $(CFLAGS) $(LFLAGS) -c -o $@

install: levenshtein
	cp -f levenshtein $(PREFIX)/bin/levenshtein

uninstall:
	rm -f $(PREFIX)/bin/levenshtein

run-test: levenshtein
	bash ./test.sh

clean:
	rm -f levenshtein *.o deps/**/*.o *.gc{ov,da,no}

.PHONY: clean run-test install uninstall
