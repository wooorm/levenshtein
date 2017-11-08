# levenshtein(1) [![Build Status][badge]][status]

Vladimir Levenshtein’s edit distance algorithm<sup>[1][wiki]</sup> as a UNIX
command. There’s also a C library: [levenshtein(3)][lib], and a
[JavaScript version][js].

## Installation

Git clone, and then:

```bash
$ make install
```

Or with CLib:

```bash
$ clib install wooorm/levenshtein
```

## Usage

```text
  Usage: levenshtein <words...>

  Levenshtein algorithm CLI

  Options:

    -h, --help           output usage information
    -v, --version        output version number

  Usage:

  # output distance
  $ levenshtein sitting kitten
  # 3
```

## License

[MIT][] © [Titus Wormer][author]

[badge]: https://img.shields.io/travis/wooorm/levenshtein.svg

[status]: https://travis-ci.org/wooorm/levenshtein

[wiki]: http://en.wikipedia.org/wiki/Levenshtein_distance

[lib]: https://github.com/wooorm/levenshtein.c

[js]: https://github.com/words/levenshtein-edit-distance

[mit]: LICENSE

[author]: http://wooorm.com
