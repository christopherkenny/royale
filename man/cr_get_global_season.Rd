% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_global_season.R
\name{cr_get_global_season}
\alias{cr_get_global_season}
\title{Get Global Season}
\usage{
cr_get_global_season(
  season,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = cr_get_key()
)
}
\arguments{
\item{season}{Required. Season ID, such as '2022-09'}

\item{limit}{number of items returned in the response.}

\item{after}{return only items that occur after this marker.}

\item{before}{return only items that occur before this marker.}

\item{key}{Required. API key. See \url{https://developer.clashroyale.com/#/documentation}
Default: \code{cr_get_key()}}
}
\value{
tibble of global seasons
}
\description{
This returns the current season if it's a valid season.
}
\examples{
\dontshow{if (royale::cr_has_key()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
cr_get_global_season('2022-09')
\dontshow{\}) # examplesIf}
}
\concept{locations}
