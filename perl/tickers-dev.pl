#!/usr/bin/perl
# resets window activity status
#  by chent 
#    - http://www.thomaschen.org

#<scriptinfo>
use strict;
#use Irssi;
use Finance::Quote;
use vars qw($VERSION %IRSSI);

$VERSION = "0.1";

%IRSSI = (
    authors	=> "chent",
    contact	=> "chent\@thomaschen.org",
    name	=> "Ticker",
    description	=> "Prints Current Price of NYSE Stock via Ticker Symbol",
    license	=> "Public Domain",
    url		=> "",
    changed	=> "Thu Mar 9 18:55:05 BST 2017",
);

our $q = Finance::Quote->new();
$q->timeout(60);
$q->require_labels(qw/price date high low volume/);
$q->failover(1);     # Set failover support (on by default).

our %stocks = ();


sub stock{ 
	my ($tick) = @_;
	my %data = $q->fetch('nyse', $tick);
    my $price = $data{$tick, 'price'};
    $stocks{$tick} = $price;
	print $tick . " Current Price: " . $data{$tick, 'price'} . "\n";
}







