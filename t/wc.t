use v6;
use Test;

plan 1;

my $proc = run "perl6", "bin/wc.pl6", "t/files/empty.txt", :out;
my $output = $proc.out.slurp: :close;
is $output, "       0      0      0 t/files/empty.txt\n";

#my $out = qx{perl6 bin/wc.pl6 t/files/a.txt}
#is $out, "       2      10      49 t/files/a.txt\n";
#diag $out;
