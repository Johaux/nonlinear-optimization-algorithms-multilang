/*
 * nlp-unconstrained-core/hooke-jeeves/objc/src/rosenbrock.m
 * ============================================================================
 * Nonlinear Optimization Algorithms Multilang. Version 0.1
 * ============================================================================
 * Nonlinear programming algorithms as the (un-)constrained minimization
 * problems with the focus on their numerical expression using various
 * programming languages.
 *
 * This is the Hooke and Jeeves nonlinear unconstrained minimization algorithm.
 * ============================================================================
 */

#import "rosenbrock.h"
#import "funevals.h"

// Helper constant.
const CGFloat ONE_HUNDRED_POINT_ZERO = 100.0;

// The Rosenbrock class.
@implementation Rosenbrock
// The user-supplied objective function f(x,n).
+ (CGFloat) f : (CGFloat *) x n__ : (NSUInteger) n fClsPtr__ : (id) fClsPtr {
    CGFloat a;
    CGFloat b;
    CGFloat c;

    [(FunEvals *) fClsPtr setFunEvals : [(FunEvals *) fClsPtr funEvals] + 1];

    a = x[INDEX_ZERO];
    b = x[INDEX_ONE];

    c = ONE_HUNDRED_POINT_ZERO * (b - (a * a)) * (b - (a * a));

    return (c + ((ONE_POINT_ZERO - a) * (ONE_POINT_ZERO - a)));
}

@end

// ============================================================================
// vim:set nu:et:ts=4:sw=4:
// ============================================================================
