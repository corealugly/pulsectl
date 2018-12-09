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
    say "Usage: $0 
          list (cards|profiles -c <card>)       list stuff
          set (profile -c <card> -p <profile>)  set stuff
          --help,-h                 Print this help";
    exit 0;
}

sub PrintCards() {
  my @cards = SortedCards();
  while(my($i, $desc) = each(@cards)) {
    printf("%2i: %s\n", $i, $desc->[1]);
  }
}

sub PrintProfiles($) {
  my $cardn = $_[0];
  my @profiles = SortedProfiles($cardn);
  while(my($i, $profile) = each(@profiles)) {
    printf("%2i: %s\t\t%s\n", $i, $profile->[0], $profile->[1])
  }
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
}
else {
  HelpMessage();
}
