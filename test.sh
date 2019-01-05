#!/bin/sh

tests=0

describe() {
  tests=$((tests+1))
  description="$1"
}

assert() {
  if [ "$1" = "$2" ]; then
    printf "\033[32m.\033[0m"
  else
    printf "\033[31m\nFAIL: %s\033[0m: '%s' != '%s'\n" "$description" "$1" "$2"
    exit 1
  fi
}

describe "Help"
  ./levenshtein --help > /dev/null 2>&1
  assert $? 0

describe "Help: short flag"
  ./levenshtein -h > /dev/null 2>&1
  assert $? 0

describe "Version"
  ./levenshtein --version > /dev/null 2>&1
  assert $? 0

describe "Version: short flag"
  ./levenshtein -v > /dev/null 2>&1
  assert $? 0

describe "Execute: one argument"
  ./levenshtein foo > /dev/null 2>&1
  assert $? 1

describe "Execute: more than two arguments"
  ./levenshtein foo bar baz > /dev/null 2>&1
  assert $? 1

describe "Execute: should work"
  assert "$(./levenshtein "" "a")" 1
  assert "$(./levenshtein "a" "")" 1
  assert "$(./levenshtein "" "")" 0
  assert "$(./levenshtein "levenshtein" "levenshtein")" 0
  assert "$(./levenshtein "sitting" "kitten")" 3
  assert "$(./levenshtein "gumbo" "gambol")" 2
  assert "$(./levenshtein "saturday" "sunday")" 3
  assert "$(./levenshtein "DwAyNE" "DUANE")" 2
  assert "$(./levenshtein "dwayne" "DuAnE")" 5
  assert "$(./levenshtein "aarrgh" "aargh")" 1
  assert "$(./levenshtein "aargh" "aarrgh")" 1
  assert "$(./levenshtein "a" "b")" 1
  assert "$(./levenshtein "ab" "ac")" 1
  assert "$(./levenshtein "ac" "bc")" 1
  assert "$(./levenshtein "abc" "axc")" 1
  assert "$(./levenshtein "xabxcdxxefxgx" "1ab2cd34ef5g6")" 6
  assert "$(./levenshtein "xabxcdxxefxgx" "abcdefg")" 6
  assert "$(./levenshtein "javawasneat" "scalaisgreat")" 7
  assert "$(./levenshtein "example" "samples")" 3
  assert "$(./levenshtein "sturgeon" "urgently")" 6
  assert "$(./levenshtein "levenshtein" "frankenstein")" 6
  assert "$(./levenshtein "distance" "difference")" 5

printf "\033[32m\n(✓) Passed %s assertions without errors\033[0m\n" "$tests"

exit 0
