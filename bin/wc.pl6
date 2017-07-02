#!/usr/bin/env perl6
use v6;

my $*MAIN-ALLOW-NAMED-ANYWHERE = True;

sub MAIN(Bool :$c, Bool :$l, Bool :$m, Bool :$w, *@files) {
    if @files == 0 {
        say "TODO: read from STDIN";
        exit;
    }
    my $total-lines = 0;
    my $total-words = 0;
    my $total-chars = 0;
    my $total-bytes = 0;

    for @files -> $file {
        my $lines = 0;
        my $words = 0;
        my $chars = 0;
        my $bytes = 0;
        my $fh = $file.IO.open(:chomp(False));
        while my $line = $fh.get {
            $lines++ if $line ~~ /\n$/;
            $chars += $line.chars;
            $bytes += $line.encode('utf8').bytes;

            $line .= chomp;
            $words += $line.split(/\s+/).elems;
        }
        say "       $lines      $words      $chars $file";
        $total-lines += $lines;
        $total-words += $words;
        $total-chars += $chars;
        $total-bytes += $bytes;
    }
    if @files > 1 {
        say "       $total-lines      $total-words      $total-chars total";
    }
}
