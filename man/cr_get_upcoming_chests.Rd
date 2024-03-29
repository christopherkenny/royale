% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_upcoming_chests.R
\name{cr_get_upcoming_chests}
\alias{cr_get_upcoming_chests}
\title{Get Upcoming Chests}
\usage{
cr_get_upcoming_chests(tag = "JYJQC88", key = cr_get_key())
}
\arguments{
\item{tag}{Required. The player to return.
Default: JYJQC88}

\item{key}{Required. API key. See \url{https://developer.clashroyale.com/#/documentation}
Default: \code{cr_get_key()}}
}
\value{
tibble of player info
}
\description{
Get Upcoming Chests
}
\examples{
\dontshow{if (royale::cr_has_key()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
cr_get_upcoming_chests('JYJQC88')
\dontshow{\}) # examplesIf}
}
\concept{player}
