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
          --card,-c       list cards;
          --help,-h       Print this help" . "\n";
    exit 0;
}

# GetOptions(
#     'card|c=i' => \(my $cardn=undef),
#     'help|?' => sub { HelpMessage(); },
# # ) or HelpMessage();
# ) or die HelpMessage();

# HelpMessage() unless defined $card;
my $cardn = 0;

my $activprofile = ProfilePrint($cardn);

# print Dumper %result;
while(my($pr, $dev) = each %$activprofile) {
  printf "%s\t%s\n", $pr, $dev
}
