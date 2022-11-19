use v5.34.0;
use warnings;
use strict;

my @result;

for my $code ( 11098 .. 98123 ) {
    my @matches = $code =~ /(5)/g;

    next if @matches < 2;

    my @digits   = split //, $code;
    my $is_valid = 1;

    for my $i ( 0 .. ( $#digits - 1 ) ) {
        if ( $digits[ $i + 1 ] < $digits[$i] ) {
            $is_valid = 0;
            last;
        }
    }

    push @result, $code if $is_valid;
}

#say "Total values: ", scalar @result, ", result: ", $result[55];
