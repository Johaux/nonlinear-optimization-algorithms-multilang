# -*- coding: utf-8 -*-
# =============================================================================
# nlp-unconstrained-core/hooke-jeeves/python/src/nlpuccorehooko/funevals.py
# =============================================================================
# Nonlinear Optimization Algorithms Multilang. Version 0.1
# =============================================================================
# Nonlinear programming algorithms as the (un-)constrained minimization
# problems with the focus on their numerical expression using various
# programming languages.
#
# This is the Hooke and Jeeves nonlinear unconstrained minimization algorithm.
# =============================================================================

class FunEvals:
    """The FunEvals class is a helper class. It holds the only property --
    the number of objective function evaluations (and corresponding
    accessor methods).
    """

    ## The number of function evaluations.
    funevals = 0

    def get_funevals(self):
        """Getter for funevals.

        Returns:
            The number of function evaluations.
        """

        return self.funevals

    def set_funevals(self, __funevals):
        """Setter for funevals.

        Args:
            __funevals: The number of function evaluations.
        """

        self.funevals = __funevals

        return None

    def __init__(self):
        """Default constructor."""

        self = []

        return None

# =============================================================================
# vim:set nu:et:ts=4:sw=4:
# =============================================================================