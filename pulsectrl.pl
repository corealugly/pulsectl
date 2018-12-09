#!/usr/bin/env perl
use strict;
use warnings;# FATAL => 'all';
use utf8;
# binmode(STDOUT,':utf8');
# $|=1;

use Cwd 'abs_path';
use Getopt::Long qw(GetOptions);
use Data::Dumper;

use File::Basename;
require  (dirname(__FILE__) . "/func.pl");

# my $fileExample = dirname(__FILE__) . "/" . "example.txt";
# if (open(my $fd, '<:encoding(UTF-8)', $fileExample)) {
#   while (my $row = <$fd>) {
#     my $test_input .= "$row";
#     #print  "$row\n";
#   }
# } else {
#   warn "Could not open file '$fileExample' $!";
# }

sub HelpMessage() {
    print "Usage: $0 
          --cards,-c                list cards
          --profiles,-p <card n>    list profiles for card
          --activate,-a <profile n> activate profile
          --help,-h                 Print this help" . "\n";
    exit 0;
}

GetOptions(
    'cards|c' => \&PrintCards,
    'help|?' => sub { HelpMessage(); },
# ) or HelpMessage();
) or die HelpMessage();

# HelpMessage() unless defined $card;
my $cardn = 0;

sub PrintCards() {
  my $cards = ListCards();
  my @result;
  while(my($card, $props) = each(%$cards)) {
    push(@result, $props->{"Properties"}->{"alsa.card_name"}->{"value"});
  }
  @result = sort(@result);
  while(my($i, $name) = each(@result)) {
    printf("%2i: %s\n", $i, $name);
  }
}

# my $profiles_hash = ProfilesWithDevices($cardn);
# my @profiles;
# while(my @pair = each %$profiles_hash) {
#   push(@profiles, \@pair);
# }
# @profiles = sort @profiles;
# while(my($i, $profile) = each(@profiles)) {
#   printf("%2i: %s\t\t%s", $i, $profile->[0], $profile->[1])
# }