#!/usr/bin/perl
# resets window activity status
#  by chent 
#    - http://www.thomaschen.org

#<scriptinfo>
use strict;
use warnings;
use Irssi;
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

our %stocks;

Irssi::command_bind 'stock' => sub { 

	my ($tick) = @_;

	my %data = $q->fetch('nyse', $tick);
    my $out = $tick . " Current Price: " . $data{$tick, 'price'};
    print $out;


    %stocks = (
        $tick => $data{$tick, 'price'}
    );

    #my $win = Irssi::active_win();
    #my $win_viewbuffer = $win->view()->{buffer};

     # The very first line in the buffer.
    #my $line = $win_viewbuffer->{first_line};
    #$win->print_after($line, Irssi::MSGLEVEL_CLIENTCRAP, $out);
}



