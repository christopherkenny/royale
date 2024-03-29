% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_global_tournaments.R
\name{cr_get_global_tournaments}
\alias{cr_get_global_tournaments}
\title{Get Global Tournament details}
\usage{
cr_get_global_tournaments(
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
}
\arguments{
\item{limit}{number of items returned in the response.}

\item{after}{return only items that occur after this marker.}

\item{before}{return only items that occur before this marker.}

\item{key}{Required. API key. See \url{https://developer.clashroyale.com/#/documentation}
Default: \code{cr_get_key()}}
}
\value{
tibble of card info
}
\description{
Get Global Tournament details
}
\examples{
\dontshow{if (royale::cr_has_key()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
cr_get_global_tournaments()
\dontshow{\}) # examplesIf}
}
\concept{globaltournaments}
