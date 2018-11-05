use Data::Dumper;
use strict;
use warnings;

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

my $test_input =
"card #1
\tkey: value
\tke2: valu2

card #2
\tke3: valu3
\tke4: valu4"
;

my @val = (1,2);
my %di = (1 => "123");
my $p = \@val;
$p = \%di;

sub ReadValue() {
  my ($dict, $value) = @_;

}

sub ReadAtribute ($$$) {
  my ($dict, $depth, $lines) = @_;
  while(@$lines > 0) {
    my $line = shift(@$lines);
    my ($name, $value) = split(/: /, $line, 1);
    $name = trim($name);
    if(defined($value)) {
      $value = trim($value);
      print "'" . $name . "' -> '" . $value . "'\n";
    }
    else {
      # might be divided by '='
      ($name, $value) = split(/ = /, $line);
      $name = trim($name);
      if(defined($value)) {
        $value = trim($value);
        print "'" . $name . "' -> '" . $value . "'\n";
      }
      else {
        print "Root element '" . $name . "'\n";
        # my %inner_dict = 
        # %$dict[]
      }
    }
  }
}

sub ListCards() {
  my $output = `pactl list cards`;
  # my $output = $test_input;
  my @cards = split(/\n\n/, $output);
  my @tmp = split(/\n/, $cards[0]);
  my %d;
  ReadAtribute(\%d, 0, \@tmp);

  return \@cards;
}

# print Dumper ListCards()
ListCards()
