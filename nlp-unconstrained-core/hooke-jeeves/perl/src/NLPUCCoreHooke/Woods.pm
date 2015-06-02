# =============================================================================
# nlp-unconstrained-core/hooke-jeeves/perl/src/NLPUCCoreHooke/Woods.pm
# =============================================================================
# Nonlinear Optimization Algorithms Multilang. Version 0.1
# =============================================================================
# Nonlinear programming algorithms as the (un-)constrained minimization
# problems with the focus on their numerical expression using various
# programming languages.
#
# This is the Hooke and Jeeves nonlinear unconstrained minimization algorithm.
# =============================================================================

=head1 NAME

NLPUCCoreHooke::Woods - The Hooke-Jeeves nonlinear minimization algorithm
in application to the Woods test problem

=head1 DESCRIPTION

The C<Woods> class is responsible for solving a nonlinear optimization problem
using the algorithm of Hooke and Jeeves (Woods test problem).

The objective function in this case is so called I<Woods> function.

=cut

package NLPUCCoreHooke::Woods;

use strict;
use warnings;
use v5.10;

use NLPUCCoreHooke::Hooke;

## Helper constant.
use constant INDEX_TWO => 2;

## Helper constant.
use constant INDEX_THREE => 3;

## Helper constant.
use constant ONE_HUNDRED => 100;

## Helper constant.
use constant NINETY => 90;

## Helper constant.
use constant TEN => 10;

## Helper constant.
use constant TEN_POINT => 10.;

## Helper constant.
use constant FOUR => 4;

## Helper constant.
use constant MINUS_THREE => -3;

## Helper constant.
use constant MINUS_ONE => -1;

=head1 ATTRIBUTES

=head2 RHO_WOODS

Constant. The stepsize geometric.

 The Hooke & Jeeves algorithm works reasonably well on Rosenbrock's
 function, but can fare worse on some standard test functions,
 depending on rho. Here is an example that works well when rho = 0.5,
 but fares poorly with rho = 0.6, and better again with rho = 0.8.

=cut

use constant RHO_WOODS => 0.6;

=head1 METHODS

=head2 f

The user-supplied objective function f(x,n).

Woods -- a la More, Garbow & Hillstrom (TOMS algorithm 566).

 @param   {Number[]} x - The point at which f(x) should be evaluated.
 @param   {Number}   n - The number of coordinates of x.

 @returns {Number}       The objective function value.

=cut

sub f {
    my ($x, $n) = @_;

    my $s1;
    my $s2;
    my $s3;
    my $t1;
    my $t2;
    my $t3;
    my $t4;
    my $t5;

    $NLPUCCoreHooke::FUN_EVALS++;

    $s1 = $x->[INDEX_ONE] - $x->[INDEX_ZERO] * $x->[INDEX_ZERO];
    $s2 = 1 - $x->[INDEX_ZERO];
    $s3 = $x->[INDEX_ONE] - 1;
    $t1 = $x->[INDEX_THREE] - $x->[INDEX_TWO] * $x->[INDEX_TWO];
    $t2 = 1 - $x->[INDEX_TWO];
    $t3 = $x->[INDEX_THREE] - 1;
    $t4 = $s3 + $t3;
    $t5 = $s3 - $t3;

    return (ONE_HUNDRED * ($s1 * $s1) + $s2 * $s2
               + NINETY * ($t1 * $t1) + $t2 * $t2
                  + TEN * ($t4 * $t4) + $t5 * $t5 / TEN_POINT);
}

=head2 main

Main program function.

 @param {String[]} args - The array of command-line arguments.

=cut

sub main {
    my $self = shift();
    my ($args) = @_;

    my $n_vars;
    my $iter_max;
    my $jj;
    my $i;

    my @start_pt = (0)x(VARS);
    my $rho;
    my $epsilon;
    my @end_pt   = (0)x(VARS);

    # Starting guess test problem "Woods".
    $n_vars                = FOUR;
    $start_pt[INDEX_ZERO]  = MINUS_THREE;
    $start_pt[INDEX_ONE]   = MINUS_ONE;
    $start_pt[INDEX_TWO]   = MINUS_THREE;
    $start_pt[INDEX_THREE] = MINUS_ONE;
    $iter_max              = IMAX;
    $rho                   = RHO_WOODS;
    $epsilon               = EPSMIN;

    # Instantiating the Hooke class.
    my $hk = NLPUCCoreHooke::Hooke->new();

    $jj = $hk->hooke(
        $n_vars, \@start_pt, \@end_pt, $rho, $epsilon, $iter_max, \&f
    );

    print("\n\n\nHOOKE USED $jj ITERATIONS, AND RETURNED\n");

    for ($i = 0; $i < $n_vars; $i++) {
        printf("x[%3d] = %15.7le \n", $i, $end_pt[$i]);
    }

    print("True answer: f(1, 1, 1, 1) = 0.\n");

    return 1;
}

=head2 new

The Woods class constructor.

 @returns {Object} The object instance of the class.

=cut

sub new {
    my $class = shift();
    my $self  = [];

    bless($self, $class);

    return $self;
}

1;

# =============================================================================
# vim:set nu:et:ts=4:sw=4:
# =============================================================================
