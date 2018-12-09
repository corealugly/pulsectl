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

# returns a list of (system name, human name) pairs eg. ('Card #1', '"B525 HD Webcam"'')
sub SortedCards() {
  my $cards = ListCards();
  my @result;
  while(my($card, $props) = each(%$cards)) {
    push(@result, [$card, $props->{"Properties"}->{"alsa.card_name"}->{"value"}]);
  }
  return sort(@result);
}

# returns a list of (profile name, device name) pairs eg. ('output:hdmi-stereo-extra1, '"FS2735')
sub SortedProfiles($) {
  my $cardn = $_[0];
  my $profiles_hash = ProfilesWithDevices($cardn);
  my @profiles;
  while(my @pair = each %$profiles_hash) {
    push(@profiles, \@pair);
  }
  return sort(@profiles);
}

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
    'profiles|p=i' => \&PrintProfiles,
    'help|?' => sub { HelpMessage(); },
# ) or HelpMessage();
) or die HelpMessage();

# HelpMessage() unless defined $card;

sub PrintCards() {
  my @cards = SortedCards();
  while(my($i, $desc) = each(@cards)) {
    printf("%2i: %s\n", $i, $desc->[1]);
  }
}

sub PrintProfiles($$) {
  my $cardn = $_[1];
  my @profiles = SortedProfiles($cardn);
  while(my($i, $profile) = each(@profiles)) {
    printf("%2i: %s\t\t%s\n", $i, $profile->[0], $profile->[1])
  }

}
