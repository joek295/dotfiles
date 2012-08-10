#!/usr/bin/perl
use strict;
use LWP::Simple;
my $content = get("http://www.w3.weather.com/weather/print/FRXX0076");
$content =~ s/.*<!-- begin loop -->(.*)<!-- end loop -->.*/$1/s;
my @day = split /<TR>/, $content;
shift @day;
my ($day, $date, $img, $temp, $precip);
my $tomorrow;
foreach $_ (@day) {
	($day) = /(\w+)<\/A>/s;
	($date) = /<BR> (.+?)</s;
	($img) = /(\d+)\.gif/s;
	$img = $ARGV[0] . $img . '.png';
	($temp) = /<B>(.*?)<\/B>/s;
	$temp =~ s/&deg;/chr(186)/eg;
	$temp =~ s|(\d+)|sprintf "%d", ($1 - 32) * 5 / 9|eg;
	($precip) = /(\d+ %)/;
	print $img . "\n" . $temp . "C\n" . $precip . "\n";
}
