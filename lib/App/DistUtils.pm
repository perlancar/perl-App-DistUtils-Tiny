package App::DistUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %dist_arg_single = (
    dist => {
        summary => 'Distribution name, defaults to "this dist"',
        schema => 'perl::distname::default_this_dist*',
        description => <<'_',

See the <prog:this-dist> utility for how to guess for "this distribution".

_
        pos => 0,
        completion => sub {
            require Complete::Dist;
            my %args = @_;
            Complete::Dist::complete_dist(word=>$args{word});
        },
    },
);

our %dist_arg_multiple = (
    dist => {
        schema => ['array*', of=>'perl::distname*', min_len=>1],
        req => 1,
        pos => 0,
        greedy => 1,
        element_completion => sub {
            require Complete::Dist;
            my %args = @_;
            Complete::Dist::complete_dist(word=>$args{word});
        },
    },
);

1;
# ABSTRACT: Collection of utilities related to Perl distributions

=head1 SYNOPSIS

This distribution provides the following command-line utilities related to Perl
distributions:

#INSERT_EXECS_LIST

The main feature of these utilities is tab completion.


=head1 FAQ

#INSERT_BLOCK: App::PMUtils faq


=head1 SEE ALSO

#INSERT_BLOCK: App::PMUtils see_also

=cut
