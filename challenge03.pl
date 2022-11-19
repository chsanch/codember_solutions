use v5.34.0;
use warnings;
use strict;

open my $fh, '<', 'colors.txt' or die "Can't open file: $!";
my @colors;
while ( my $line = <$fh> ) {
    chomp $line;
    next unless $line =~ /^[^\[\]]/;
    push @colors, split ',', $line;
}

my $total       = 0;
my $final_color = '';

my $last_color = '';
my $next_color = $colors[0];
my $count      = 1;

for my $color (@colors) {
    if ( $color ne $next_color || $color eq $last_color ) {
        $count = 1;
    }
    $count++;

    $next_color = $last_color;
    $last_color = $color;

    if ( $count > $total ) {
        $total       = $count;
        $final_color = $last_color;
    }
}

say "Total: $total, last color: $final_color";
