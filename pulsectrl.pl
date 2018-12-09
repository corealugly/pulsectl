#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;# FATAL => 'all';
use utf8;
# binmode(STDOUT,':utf8');
# $|=1;

use Cwd 'abs_path';
# use Getopt::Long qw(GetOptions);
use Data::Dumper;

use File::Basename;
require  (dirname(__FILE__) . "/func.pl");

use Getopt::Long::Subcommand; # exports GetOptions

sub HelpMessage() {
    say "Usage: $0 
          list (cards|profiles -c <card>)       list stuff
          set (profile -c <card> -p <profile>)  set stuff
          --help,-h                 Print this help";
    exit 0;
}

sub PrintCards() {
  my @cards = SortedCards();
  while(my($i, $desc) = each(@cards)) {
    printf("%2i: %s\n", $i, $desc->[1]->{"Properties"}->{"alsa.card_name"}->{"value"});
  }
}

sub PrintProfiles($) {
  my $cardn = $_[0];
  my @profiles = SortedProfiles($cardn);
  while(my($i, $profile) = each(@profiles)) {
    printf("%2i: %s\t\t%s\n", $i, $profile->[0], $profile->[1])
  }
}

sub SetCardProfile($$) {
  my ($cardn, $profilen) = @_;
  my @cards = SortedCards();
  my @profiles = SortedProfiles($cardn);
  my $card_name = $cards[$cardn][1]->{'Name'}->{'value'};
  my $profile_name = $profiles[$profilen][0];
  my $cmd = "pactl set-card-profile '$card_name' '$profile_name'";
  printf "calling \"%s\"..\n", $cmd;
  `$cmd`;
}
 
my %opts;
my $res = GetOptions(
 
    summary => 'Yet another pulseaudio control application',
 
    # common options recognized by all subcommands
    options => {
      'help|h|?' => {
        summary => 'Display help message',
        handler => sub {
          my ($cb, $val, $res) = @_;
          HelpMessage();
          exit 0;
        }
      }
    },
 
    subcommands => {
      list => {
        summary => 'list stuff',
        subcommands => {
          cards => {
            summary => 'list all cards',
          }, # cards
          profiles => {
            summary => 'list profiles with device names for card',
            options => {
              'card|c=i' => {
                handler => sub {$opts{card} = $_[1];}
              }
            }
          } # profiles
        }
      }, # list
      'set' => {
        summary => 'set stuff',
        subcommands => {
          profile => {
            summary => 'set profile for card',
            options => {
              'card|c=i' => {
                handler => sub {$opts{card} = $_[1];}
              },
              'profile|p=i' => {
                handler => sub {$opts{profile} = $_[1];}
              }
            }
          } # profile
        }
      } # set
    },
 
    # tell how to complete option value and arguments. see
    # Getopt::Long::Complete for more details, the arguments are the same
    # except there is an additional 'subcommand' that gives the subcommand
    # name.
    completion => sub {
        my %args = @_;
    }
);
die "GetOptions failed!\n" unless $res->{success};

my $cmd = join(' ', @{$res->{subcommand}});
if($cmd eq 'list cards') {
  PrintCards();
}
elsif($cmd eq 'list profiles') {
  die HelpMessage() unless defined $opts{card};
  PrintProfiles($opts{'card'});
}
elsif($cmd eq 'set profile') {
  die HelpMessage() unless defined $opts{card} && defined $opts{profile};
  SetCardProfile($opts{card}, $opts{profile});
}
else {
  HelpMessage();
}
