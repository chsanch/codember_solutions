use v5.34.0;
use warnings;
use strict;

my $msg =
"11610497110107115 102111114 11210897121105110103 9911110010110998101114 11210810197115101 11510497114101";

my @words = split ' ', $msg;
my @deciphered_words;

for my $word (@words) {
    my @text;
    my @letters = split '', $word;
    push @deciphered_words, decipher(@letters);
}

say 'message deciphered: ', join ' ', @deciphered_words;

sub decipher {
    my $n = $_[0] == 1 ? 3 : 2;
    my @result;
    while ( my @next_n = splice @_, 0, $n ) {
        push @result, chr( join '', @next_n );
		$n = (defined $_[0] and $_[0] == 1) ? 3 : 2;
    }
    return join '', @result;
}
