## siminf, a framework for stochastic disease spread simulations
## Copyright (C) 2015  Pavol Bauer
## Copyright (C) 2015  Stefan Engblom
## Copyright (C) 2015  Stefan Widgren
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

##' Run siminf stochastic simulation algorithms
##'
##' @rdname run-methods
##' @docType methods
##' @param model The siminf model to run.
##' @param verbose Level of siminf feeedback during simulation. Silent
##' if 0, progress if 1, progress and number of transition
##' events if 2. Default is 0.
##' @param seed Random number seed.
##' @return \code{siminf_model} with result from simulation.
setGeneric("run",
           signature = "model",
           function(model,
                    verbose = 0,
                    seed    = NULL) standardGeneric("run"))

##' @rdname run-methods
##' @include SISe3.r
##' @export
setMethod("run",
          signature(model = "SISe3"),
          function(model, verbose, seed)
          {
              ## check that siminf_model contains all data structures
              ## required by the siminf solver and that they make sense
              validObject(model);

              .Call(SISe3_run, model, 1L, verbose, seed)
          }
)

##' @rdname run-methods
##' @include SISe.r
##' @export
setMethod("run",
          signature(model = "SISe"),
          function(model, verbose, seed)
          {

              ## check that siminf_model contains all data structures
              ## required by the siminf solver and that they make sense
              validObject(model);

              .Call(SISe_run, model, 1L, verbose, seed)
          }
)
