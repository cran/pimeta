% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/i2h-.r
\name{i2h}
\alias{i2h}
\title{\eqn{I^2} heterogeneity measure}
\usage{
i2h(se, tau2h)
}
\arguments{
\item{se}{the within studies standard errors vector}

\item{tau2h}{the estimate of \eqn{\tau^2}}
}
\value{
\itemize{
\item \code{i2h}: the estimate for \eqn{I^2}.
}
}
\description{
Returns the estimator for
(Higgins & Thompson, 2002).
}
\examples{
data(sbp, package = "pimeta")
tau2h <- pimeta::tau2h(sbp$y, sbp$sigmak)
pimeta::i2h(sbp$sigmak, tau2h$tau2h)
}
\references{
Higgins, J. P. T., and Thompson, S. G. (2002).
Quantifying heterogeneity in a meta-analysis.
\emph{Stat Med.}
\strong{21}(11): 1539-1558.
\url{https://doi.org/10.1002/sim.1186}
}
