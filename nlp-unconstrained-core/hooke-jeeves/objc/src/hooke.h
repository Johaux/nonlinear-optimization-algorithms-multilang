/*
 * nlp-unconstrained-core/hooke-jeeves/objc/src/hooke.h
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

// (Not so dirty :-) hack: But we need double! Even on 32-bit systems.
#define CGFLOAT_DEFINED 1
typedef double          CGFloat;
#define CGFLOAT_MIN     DBL_MIN
#define CGFLOAT_MAX     DBL_MAX
#define CGFLOAT_IS_DBL  1

#import <Foundation/Foundation.h>

/** Constant. The maximum number of variables. */
extern const NSUInteger VARS;

/** Constant. The stepsize geometric shrink. */
extern const CGFloat RHO_BEGIN;

/**
 * Constant. The stepsize geometric shrink.
 * <br />
 * <br />The Hooke &amp; Jeeves algorithm works reasonably well
 * on Rosenbrock's function, but can fare worse on some standard
 * test functions, depending on rho. Here is an example that works well
 * when rho = 0.5, but fares poorly with rho = 0.6, and better again
 * with rho = 0.8.
 */
extern const CGFloat RHO_WOODS;

/** Constant. The ending value of stepsize. */
extern const CGFloat EPSMIN;

/** Constant. The maximum number of iterations. */
extern const NSUInteger IMAX;

/** Helper constant. */
extern const NSUInteger INDEX_ZERO;

/** Helper constant. */
extern const NSUInteger INDEX_ONE;

/** Helper constant. */
extern const NSUInteger INDEX_TWO;

/** Helper constant. */
extern const NSUInteger INDEX_THREE;

/** Helper constant. */
extern const NSUInteger TWO;

/** Helper constant. */
extern const NSUInteger FOUR;

/** Helper constant. */
extern const CGFloat MINUS_ONE_POINT_TWO;

/** Helper constant. */
extern const CGFloat ONE_POINT_ZERO;

/** Helper constant. */
extern const NSInteger MINUS_THREE;

/** Helper constant. */
extern const NSInteger MINUS_ONE;

/** Helper constant. */
extern const CGFloat ZERO_POINT_FIVE;

/** The number of function evaluations. */
extern NSUInteger funEvals;

/**
 * The <code>Hooke</code> class contains methods for solving a nonlinear
 * optimization problem using the algorithm of Hooke and Jeeves.
 *
 * @author  Radislav (Radic) Golubtsov
 * @version 0.1
 * @see     Rosenbrock
 * @see     Woods
 * @since   hooke-jeeves 0.1
 */
@interface Hooke : NSObject
{
@private
    /*
     * GCC kludge: Properties must be declared as ivars too
     *             to avoid compile-time errors like the following:
     *
     * error: ivar ‘funEvalsX’ used by ‘@synthesize’ declaration
     *        must be an existing ivar
     *
     * Effective at least for GCC 5.1.0.
     */
    NSUInteger funEvalsX;
}

/** The number of function evaluations. */
@property NSUInteger funEvalsX;

/**
 * Helper method.
 * <br />
 * <br />Given a point, look for a better one nearby, one coord at a time.
 *
 * @param delta    The delta between <code>prevBest</code>
 *                 and <code>point</code>.
 * @param point    The coordinate from where to begin.
 * @param prevBest The previous best-valued coordinate.
 * @param nVars    The number of variables.
 *
 * @returns The objective function value at a nearby.
 */
- (CGFloat) bestNearby : (CGFloat *) delta
               point__ : (CGFloat *) point
            prevBest__ : (CGFloat) prevBest
               nVars__ : (NSUInteger) nVars;

/**
 * Main optimization method.
 * <br />
 * <br />The hooke subroutine itself.
 *
 * @param nVars   The number of variables.
 * @param startPt The starting point coordinates.
 * @param endPt   The ending point coordinates.
 * @param rho     The rho value.
 * @param epsilon The epsilon value.
 * @param iterMax The maximum number of iterations.
 *
 * @returns The number of iterations used to find the local minimum.
 */
- (NSUInteger) hooke : (NSUInteger) nVars
           startPt__ : (CGFloat *) startPt
             endPt__ : (CGFloat *) endPt
               rho__ : (CGFloat) rho
           epsilon__ : (CGFloat) epsilon
           iterMax__ : (NSUInteger) iterMax;

@end

// ============================================================================
// vim:set nu:et:ts=4:sw=4:
// ============================================================================
