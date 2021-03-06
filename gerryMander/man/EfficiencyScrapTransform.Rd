% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EfficiencyScrapTransform.R
\name{EfficiencyScrapTransform}
\alias{EfficiencyScrapTransform}
\title{A Gerrymandering Function}
\usage{
EfficiencyScrapTransform(scrapDF)
}
\arguments{
\item{scrapDF}{This is the output data frame from the EfficiencyScrapping function.}
}
\description{
This script will be used to rearrange the data into a format that is workable with
the efficiency gap function. It will also be removing all unconstested districts from
data. I realize that this is not the most accurate way to measure a state, but as of
this time I have not determined a good way to repersent those districts.
}
\examples{
EfficiencyScrapTransform(scrapOutput)
}
\keyword{cleaning}
\keyword{data}
\keyword{gerrymandering,}
