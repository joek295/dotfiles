#!/usr/bin/perl
use strict;

my $file="$ENV{FVWM_USERDIR}/doit.txt";
my $count=shift || 1;
my $size=-s $file;

open(FILE,$file) || die "Can't open $file\n";

while ($count--) {
   seek(FILE,int(rand($size)),0);
   $_=readline(FILE);                         # ignore partial line
   redo unless defined ($_ = readline(FILE)); # catch EOF
   print $_;
}

# "doit.txt" should be a text file with the first line blank. The
# script will output a line randomly with probability proportional
# to the number of characters in the line.
