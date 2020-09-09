#! /usr/bin/env perl

# Takes a list of files and returns the directories for each dataset that should be kept with the most files
# and the directories with fewer files that should be removed.

use strict;
use warnings;
use v5.10;

use File::Basename;
use Data::Dumper;


my %sample_dir_counts;


while (<>) {

    if (m|/store/group/phys_higgs/hbb/ntuples/VHbbPostNano/(201\d)/V13/([^/]+)/RunII|) {

        $sample_dir_counts{$1}{$2}{dirname (dirname $_)} += 1;

    }

}


foreach my $year (keys %sample_dir_counts) {

    my %year_hash = %{$sample_dir_counts{$year}};

    my @year_keep;
    my @year_remove;

    foreach my $sample (keys %year_hash) {

        my %sample_hash = %{$year_hash{$sample}};

        my @remove;
        my $keep;
        my $files = 0;

        for (keys %sample_hash) {
            my $this_dir = $sample_hash{$_};

            if ($this_dir > $files || ($this_dir == $files && (basename $_) gt (basename $keep))) {
                if ($files) {
                    push @remove, "$keep => $files";
                }
                $files = $this_dir;
                $keep = $_;
            }
            else {
                push @remove, "$_ => $this_dir";
            }
        }

        push @year_keep, "$keep => $files";
        push @year_remove, @remove;

    }

    say "Year $year:";

    say "\nKeep:\n";
    for (sort @year_keep) {
        say;
    }

    say "";

    say "\nRemove:\n";

    for (sort @year_remove) {
        say;
    }

    say "";

}
