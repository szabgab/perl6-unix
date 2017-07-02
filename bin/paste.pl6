#!/usr/bin/env perl6
use v6;

sub MAIN(
        *@files where { .elems > 0 },
        Bool :s($s),
        Str :d($d),
    ) {
    say @files.perl;
}


