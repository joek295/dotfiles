#!/usr/bin/perl
use strict;
open(FORECASTS, "/dev/shm/weather.log") or print '+ "No forecasts available"' and exit;
my $index; my $forecast; my $line;
while($line = <FORECASTS>) {
    chomp($line);
    if($index == 0) {
	print "+ %$line%";
	$index = 1;
    } elsif($index == 1) {
	if($forecast == 0) {
	    print "\"Today\tTemp $line   Hum ";
	} else {
	    print "\"Day $forecast\tTemp $line   Hum ";
	}
	$index = 2;
    } else {
	print "$line %%\"\n";
	$index = 0;
	$forecast++;
    }
}
