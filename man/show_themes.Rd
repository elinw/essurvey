% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_funs.R
\name{show_themes}
\alias{show_themes}
\title{Return available themes in the European Social Survey}
\usage{
show_themes()
}
\value{
character vector with available themes
}
\description{
This function returns the available themes in the European Social Survey.
However, contrary to \code{\link{show_countries}} and \code{\link{show_country_rounds}},
themes can not be downloaded as separate datasets. This and
\code{\link{show_theme_rounds}} serve purely for informative purposes.
}
\examples{

show_themes()

}
