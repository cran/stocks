% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prices_rate.R
\name{prices_rate}
\alias{prices_rate}
\title{Calculate Growth Rate From a Vector of Prices}
\usage{
prices_rate(prices, units.rate = NULL)
}
\arguments{
\item{prices}{Numeric matrix with 1 column of prices for each investment (can 
be a vector if there is only one).}

\item{units.rate}{Numeric value specifying the number of units for growth 
rate calculation, if you want something other than total growth. For 
annualized growth rate, set to 252 if \code{prices} has daily prices, 12 if 
\code{prices} has monthly prices, etc.}
}
\value{
Numeric value if \code{prices} is a vector, numeric matrix if 
\code{prices} is a matrix.
}
\description{
The formula is simply: \code{prices[length(prices)] / prices[1] - 1}. If 
\code{units.rate} is specified, then it converts to x-unit growth rate.
}
\examples{
# Create vector of daily closing prices for a hypothetical stock
prices <- c(100.4, 98.7, 101.3, 101.0, 100.9)

# Overall growth is 0.50\%
prices_rate(prices)

# Average daily growth is 0.12\%
prices_rate(prices, 1)

# Corresponds to 36.7\% annualized growth
prices_rate(prices, 252)


}
