/*
 * nlp-unconstrained-core/hooke-jeeves/go/src/rosenbrock.go
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

package main

/** Helper constant. */
const ONE_HUNDRED_POINT_ZERO float64 = 100.0

/**
 * The <code>Rosenbrock</code> structure is responsible for solving a nonlinear
 * optimization problem using the algorithm of Hooke and Jeeves.
 * <br />
 * <br />The objective function in this case
 * is the Rosenbrock's parabolic valley function.
 *
 * @author  Radislav (Radic) Golubtsov
 * @version 0.1
 * @see     Hooke (hooke.go)
 * @since   hooke-jeeves 0.1
 */
type Rosenbrock struct { }

/**
 * The user-supplied objective function F(x,n).
 * <br />
 * <br />Represents here the Rosenbrock's classic parabolic valley
 * (&quot;banana&quot;) function.
 *
 * @param x The point at which F(x) should be evaluated.
 * @param n The number of coordinates of <code>x</code>.
 *
 * @return The objective function value.
 */
func (r Rosenbrock) F(x []float64, n uint) float64 {
    var a float64
    var b float64
    var c float64

    fe := new(FunEvals)

    fe.SetFunEvals(fe.GetFunEvals() + 1)

    a = x[INDEX_ZERO]
    b = x[INDEX_ONE]

    c = ONE_HUNDRED_POINT_ZERO * (b - (a * a)) * (b - (a * a))

    return (c + ((ONE_POINT_ZERO - a) * (ONE_POINT_ZERO - a)))
}

// ============================================================================
// vim:set nu:et:ts=4:sw=4:
// ============================================================================
