#!/usr/bin/env perl

use Getopt::Long::Subcommand; # exports GetOptions
use Data::Dumper;

my %opts;
my $res = GetOptions(
 
    summary => 'Summary about your program ...',
 
    # common options recognized by all subcommands
    options => {
        'help|h|?' => {
            summary => 'Display help message',
            handler => sub {
                my ($cb, $val, $res) = @_;
		print "($cb, $val, $res" . "\n";
                if ($res->{subcommand}) {
                    print Dumper "Help message for $res->{subcommand} ...";
                } else {
                    print  "General help message ...";
                }
                exit 0;
            },
	},
        'version|v' => {
            summary => 'Display program version',
            handler => sub {
                print "Program version $main::VERSION";
                exit 0;
            },
	},
        'verbose' => {
            handler => \$opts{verbose},
        },
    },
 
    # list your subcommands here
    subcommands => {
        subcmd1 => {
            summary => 'The first subcommand',
            # subcommand-specific options
            options => {
                'foo=i' => {
                    handler => \$opts{foo},
                },
            },
        },
        subcmd2 => {
            summary => 'The second subcommand',
            options => {
                'bar=s' => \$opts{bar},
                'baz'   => \$opts{baz},
            },
        },
    },
 
    # tell how to complete option value and arguments. see
    # Getopt::Long::Complete for more details, the arguments are the same
    # except there is an additional 'subcommand' that gives the subcommand
    # name.
    completion => sub {
        my %args = @_;
	...
    },
 
);
die "GetOptions failed!\n" unless $res->{success};
print Dumper "Running subcommand $res->{subcommand} ...";
