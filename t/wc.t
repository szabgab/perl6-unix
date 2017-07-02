use v6;
use Test;


my @cases = (
    't/files/empty.txt'             => "       0      0      0 t/files/empty.txt\n",
    't/files/line_no_newline.txt'   => "       0      1      4 t/files/line_no_newline.txt\n",
    't/files/line_with_newline.txt' => "       1      1      5 t/files/line_with_newline.txt\n",
    't/files/line_and_half.txt'     => "       1      2      8 t/files/line_and_half.txt\n",
    't/files/a.txt'                 => "       2      10      49 t/files/a.txt\n",
);

plan @cases.elems;

for @cases -> $c {
    my $proc = run $*EXECUTABLE, 'bin/wc.pl6', $c.key, :out;
    my $output = $proc.out.slurp: :close;
    is $output, $c.value;
}

