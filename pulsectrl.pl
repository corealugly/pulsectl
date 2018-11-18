#!/usr/bin/env perl
use Data::Dumper;
use strict;
use warnings;
use File::Basename;

my $fileExample = dirname(__FILE__) . "/" . "example.txt";
if (open(my $fd, '<:encoding(UTF-8)', $fileExample)) {
  while (my $row = <$fd>) {
    my $test_input .= "$row";
    #print  "$row\n";
  }
} else {
  warn "Could not open file '$fileExample' $!";
}

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
  return %result;
}

# ListCards()
print Dumper ListCards()
