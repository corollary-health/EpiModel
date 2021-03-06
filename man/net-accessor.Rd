% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/net.accessor.R
\name{net-accessor}
\alias{net-accessor}
\alias{get_attr_list}
\alias{get_attr}
\alias{add_attr}
\alias{set_attr}
\alias{append_attr}
\alias{get_epi_list}
\alias{get_epi}
\alias{add_epi}
\alias{set_epi}
\alias{get_param_list}
\alias{get_param}
\alias{add_param}
\alias{set_param}
\alias{get_control_list}
\alias{get_control}
\alias{add_control}
\alias{set_control}
\alias{get_init_list}
\alias{get_init}
\alias{add_init}
\alias{set_init}
\title{Functions to Access and Edit the Master List Object in Network Models}
\usage{
get_attr_list(dat, item = NULL)

get_attr(dat, item, indexes = NULL, override.null.error = FALSE)

add_attr(dat, item)

set_attr(dat, item, value, override.length.check = FALSE)

append_attr(dat, item, value, n.new)

get_epi_list(dat, item = NULL)

get_epi(dat, item, indexes = NULL, override.null.error = FALSE)

add_epi(dat, item)

set_epi(dat, item, at, value)

get_param_list(dat, item = NULL)

get_param(dat, item, override.null.error = FALSE)

add_param(dat, item)

set_param(dat, item, value)

get_control_list(dat, item = NULL)

get_control(dat, item, override.null.error = FALSE)

add_control(dat, item)

set_control(dat, item, value)

get_init_list(dat, item = NULL)

get_init(dat, item, override.null.error = FALSE)

add_init(dat, item)

set_init(dat, item, value)
}
\arguments{
\item{dat}{a Master list object of network models}

\item{item}{a character vector conaining the name of the element to access.
Can be of length > 1 for `get_*_list` functions}

\item{indexes}{for `get_epi` and `get_attr`, a numeric vector of indexes or
a logical vector to subset the desired `item`}

\item{override.null.error}{if TRUE, `get_` return NULL if the `item` does not
exist instead of throwing an error. (default = FALSE)}

\item{value}{new value to be attributed in the `set_` and `append_` functions}

\item{override.length.check}{if TRUE, `set_attr` allows the modification of
the `item` size. (default = FALSE)}

\item{n.new}{the number of new elements to append at the end of `item`}

\item{at}{timestep where to add the new value for the epi output `item`}
}
\value{
a vector or a list of vector for `get_` functions. And the Master
        list object for `set_` and `add_` functions
}
\description{
These `get_`, `set_`, `append_` and `add` functions allow a safe
             and efficient way to retrieve and mutate the Master list object
             of network models (`dat`).
}
\section{Mutability}{

The `set_`, `append_` and `add_` functions DO NOT mutate the dat object in
place. The result must be assigned back to `dat` in order to be registered
`dat <- set_*(dat, item, value)`
}

\section{`set_` vs `add_`}{

The `set_` functions edit a pre-existing element or create a new one if it
does not exist already by calling the `add_` functions internally.
}

\examples{
dat <- list(
  attr = list(
    active = rbinom(100, 1, 0.9)
  ),
  epi = list(),
  param = list(),
  init = list(),
  control = list(
    nsteps = 150
  )
)

dat <- add_attr(dat, "age")
dat <- set_attr(dat, "age", runif(100))
dat <- set_attr(dat, "status", rbinom(100, 1, 0.9))
dat <- set_attr(dat, "status", rep(1, 150), override.length.check = TRUE)
dat <- append_attr(dat, "status", 1, 10)
dat <- append_attr(dat, "age", NA, 10)
get_attr_list(dat)
get_attr_list(dat, c("age", "active"))
get_attr(dat, "status")
get_attr(dat, "status", c(1, 4))

dat <- add_epi(dat, "i.num")
dat <- set_epi(dat, "i.num", 150, 10)
dat <- set_epi(dat, "s.num", 150, 90)
get_epi_list(dat)
get_epi_list(dat, c("i.num", "s.num"))
get_epi(dat, "i.num")
get_epi(dat, "i.num", c(1, 4))
get_epi(dat, "i.num", rbinom(150, 1, 0.2) == 1)

dat <- add_param(dat, "x")
dat <- set_param(dat, "x", 0.4)
dat <- set_param(dat, "y", 0.8)
get_param_list(dat)
get_param_list(dat, c("x", "y"))
get_param(dat, "x")

dat <- add_init(dat, "x")
dat <- set_init(dat, "x", 0.4)
dat <- set_init(dat, "y", 0.8)
get_init_list(dat)
get_init_list(dat, c("x", "y"))
get_init(dat, "x")

dat <- add_control(dat, "x")
dat <- set_control(dat, "x", 0.4)
dat <- set_control(dat, "y", 0.8)
get_control_list(dat)
get_control_list(dat, c("x", "y"))
get_control(dat, "x")

}
