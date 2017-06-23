#include <stdio.h>
#include <string.h>
#include "levenshtein.h"

/* CLI. */
int
main(int argc, char **argv) {
  char *a = argv[1];
  char *b = argv[2];

  if (argc == 2) {
    if (!strcmp(a, "-v") || !strcmp(a, "--version")) {
      printf("%s", "0.1.1\n");
      return 0;
    }

    if (!strcmp(a, "-h") || !strcmp(a, "--help")) {
      printf("%s", "\n");
      printf("%s", "  Usage: levenshtein <words...>\n");
      printf("%s", "\n");
      printf("%s", "  Levenshtein algorithm CLI\n");
      printf("%s", "\n");
      printf("%s", "  Options:\n");
      printf("%s", "\n");
      printf("%s", "    -h, --help           output usage information\n");
      printf("%s", "    -v, --version        output version number\n");
      printf("%s", "\n");
      printf("%s", "  Usage:\n");
      printf("%s", "\n");
      printf("%s", "  # output distance\n");
      printf("%s", "  $ levenshtein sitting kitten\n");
      printf("%s", "  # 3\n");
      printf("%s", "\n");
      return 0;
    }
  }

  if (argc != 3) {
    fprintf(stderr, "\033[31mLevenshtein expects two arguments\033[0m\n");
    return 1;
  }

  printf("%d\n", levenshtein(a, b));

  return 0;
}
