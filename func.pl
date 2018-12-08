#!/usr/bin/env perl 
use strict;
use warnings FATAL => 'all';
use utf8;
binmode(STDOUT,':utf8');

#use DateTime;

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

sub depth($) {
  my $line = shift;
  my $depth = 0;
  for(; substr($line, $depth, 1) eq "\t"; $depth++) {}
  return $depth;
}

sub processColonSpace($$) {
  my($name, $value) = @_;
  if($value =~ /\s*(.*) \((.*)\)/) { # <name>: <value> (<attr1_name>: <attr1_val>, ...)
    my %dict = ("value" => trim("$1"));
    for my $attr (split(/, /, "$2")) {
      my($attr_name, $attr_val) = split(/: /, $attr);
      if(!defined $attr_val) {
        $attr_val = ''
      };
      $dict{trim($attr_name)} = trim($attr_val);
    }
    return (trim($name), %dict);
  }
  else {
    return (trim($name), ("value" => trim($value)));
  }
}

sub processEquals($$) {
  my($name, $value) = @_;
  return (trim($name), ("value" => trim($value)));
}

sub ProcessLine($) {
  my $line = shift;
  my $name, my $value;
  ($name, $value) = split(/: /, $line, 2);
  if($name ne $line) {
      return processColonSpace($name, $value);
  }
  ($name, $value) = split(/ = /, $line, 2);
  if($name ne $line) {
      return processEquals($name, $value);
  }
  if($line =~ /^\s*(\S+):$/) {
    return ("$1", ("value" => ""));
  }
  # error
  return
}

sub ProcessCard($) {
  my $lines = shift;
  my @stack;
  my $depth = 1;
  my %result = (value => '');
  
  push(@stack, \%result);
  while(@$lines > 0) {
    my $line = shift(@$lines);
    my($name, %dict) = ProcessLine($line);
    if(!defined $name) {
      print "Failed to process line '" . $line . "', skipping\n";
      next;
    }
    my $line_depth = depth($line);
    # print Dumper $line_depth;
    if($line_depth == $depth) {
      $stack[-1]{$name} = \%dict;
      push(@stack, \%dict);
      $depth++;
    }
    elsif($line_depth < $depth) {
      # print Dumper @stack;
      splice(@stack, -($depth - $line_depth));
      # print Dumper @stack;
      $stack[-1]{$name} = \%dict;
      push(@stack, \%dict);
      $depth = $line_depth + 1;
    }
    else {
      print "Sudden depth jump while processing line '" . $line . "', skipping\n"
    }
  }
  return %result;
}

sub ListCards() {
  my $output = `pactl list cards`;
  # my $output = $test_input;
  my %result;
  foreach my $card (split(/\n\n/, $output)) {
    my @lines = split(/\n/, $card);
    my $name = shift @lines;
    my %r = ProcessCard(\@lines);
    $result{$name} = \%r;
  }
  return \%result;
}


sub ProfilePrint($) {   ##name need change????
  my($cardn) = @_;
  my %always_show_profiles = ("output:analog-stereo+input:analog-stereo" => 1);  ### need change???;
  my %result;
  my $card = ListCards()->{"Card #$cardn"};
  my $profiles = $card->{"Profiles"};
  my $ports = $card->{"Ports"};
  while(my($portname, $portdesc) = each %$ports) {
    if($portname eq "value") {
      next;
    }
    my $profiles = $portdesc->{"Part of profile(s)"};
    for my $pr_name (split(/, /, $profiles->{"value"})) {
      if(defined $portdesc->{"Properties"}->{"device.product.name"}) {
        $result{$pr_name} = $portdesc->{"Properties"}->{"device.product.name"}->{"value"};
      }
      elsif(exists($always_show_profiles{$pr_name})) {
        $result{$pr_name} = "";
      }
    }
  }
  return \%result;
}

1;