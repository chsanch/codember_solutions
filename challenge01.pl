use v5.34.0;
use warnings;
use strict;

open my $fh, '<', 'users.txt' or die "Can't open file: $!";
my %usr;
my $total     = 0;
my $user_name = '';

while ( my $line = <$fh> ) {
    chomp $line;

    #split the line into an array using space
    my @fields = split ' ', $line;

    #for each element in @fields, split the element by :
    for my $field (@fields) {
        my ( $key, $value ) = split ':', $field;
        $usr{$key} = $value;
    }

    #if line is empty, skip it
    if ( $line eq '' ) {
        my @total_fields = keys %usr;
        if ( @total_fields >= 6 ) {
            $total++;
            $user_name = $usr{'usr'};
        }

        undef %usr;
        next;
    }

}

say "Total number of users: $total";
say "Last user name: $user_name";
