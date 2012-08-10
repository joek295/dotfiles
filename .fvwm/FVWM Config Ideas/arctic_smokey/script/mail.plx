#!/usr/bin/perl
use strict;
use Net::POP3;
use Env qw(HOME);
open(POP3FILE, $HOME . "/.secret_pop3") or print "file!" and exit;
my $var; my $varVal; my %allVar;
while (<POP3FILE>) {
    chomp;
    ($var,$varVal) = split(/ /);
    $allVar{$var} = $varVal;
}
my $pop = Net::POP3->new($allVar{server}, Timeout=>5) or print "net!" and exit;
$pop->apop($allVar{login}, $allVar{passwd}) or print "account!" and exit;
my ($undeleted) = $pop->popstat;
print $undeleted;
$pop->quit;
