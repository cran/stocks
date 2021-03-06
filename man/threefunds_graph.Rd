% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/threefunds_graph.R
\name{threefunds_graph}
\alias{threefunds_graph}
\title{Graph One Performance Metric vs. Another for Three-Fund Portfolio as 
Allocation Varies}
\usage{
threefunds_graph(tickers = NULL, intercepts = NULL, slopes = NULL, ...,
  benchmark.tickers = NULL, reference.tickers = NULL,
  tickers.gains = NULL, benchmark.gains = NULL, reference.gains = NULL,
  step.data = 0.0025, step.points = 0.1, step.curves = 0.2,
  x.metric = "sd", y.metric = "mean", tickerlabel.offsets = NULL,
  reflabel.offsets = NULL, add.plot = FALSE, colors = NULL, lty = NULL,
  plot.list = NULL, points.list = NULL, text.list = NULL,
  pdf.list = NULL, bmp.list = NULL, jpeg.list = NULL, png.list = NULL,
  tiff.list = NULL)
}
\arguments{
\item{tickers}{Character vector of ticker symbols that Yahoo! Finance 
recognizes, if you want to download data on the fly.}

\item{intercepts}{Numeric vector of values to add to daily gains for each 
ticker.}

\item{slopes}{Numeric vector of values to multiply daily gains for each ticker 
by. Slopes are multiplied prior to adding intercepts.}

\item{...}{Arguments to pass along with \code{tickers} to 
\code{\link{load_gains}}.}

\item{benchmark.tickers}{Character vector of length 1 or 2 indicating ticker 
symbols for benchmark indexes. Only used if \code{x.metric} and/or 
\code{y.metric} require benchmark indexes to calculate. For example, to plot 
correlation with SPY on the x-axis and correlation with TLT on the y-axis, 
set \code{x.metric = "pearson"}, \code{y.metric = "pearson2"} (i.e. Pearson 
correlation with 2nd benchmark), and 
\code{benchmark.tickers = c("SPY", "TLT")}.}

\item{reference.tickers}{Character vector of ticker symbols to include on
graph as data points for comparative purposes.}

\item{tickers.gains}{Numeric matrix of gains, where each column has gains for 
a particular fund.}

\item{benchmark.gains}{Numeric vector or matrix of gains for 1 or 2 benchmark 
indexes. Only used if \code{x.metric} and/or \code{y.metric} require 
benchmark indexes to calculate. For example, to plot correlation with SPY on 
the x-axis and correlation with TLT on the y-axis, set 
\code{x.metric = "pearson"} and \code{y.metric = "pearson2"}, and 
input \code{benchmark.gains} as a 2-column matrix of gains for SPY and TLT.}

\item{reference.gains}{Numeric vector or matrix of gains for funds to 
include on graph as data points for comparative purposes.}

\item{step.data}{Numeric value specifying allocation increments for plotting 
curves.}

\item{step.points}{Numeric value specifying allocation increments for adding 
data points on top of curves. Set to \code{NULL} to suppress data points.}

\item{step.curves}{Numeric value specifying allocation increments for first 
fund in each set.}

\item{x.metric}{Character string specifying x-axis performance metric. 
Choices are: 

\code{"mean"} or \code{"sd"} for mean or standard deviation of gains 

\code{"growth"} or \code{"cagr"} for total or annualized growth 

\code{"mdd"} for maximum drawdown

\code{"sharpe"} or \code{"sortino"} for Sharpe or Sortino ratio 

\code{"alpha"}, \code{"beta"}, or \code{"r.squared"} for those metrics from a 
fitted linear regression on benchmark fund

\code{"pearson"} or \code{"spearman"} for Pearson or Spearman correlation 
with benchmark fund

\code{"alpha2"}, \code{"beta2"}, \code{"r.squared2"}, \code{"pearson2"}, or 
\code{"spearman2"} for same as previously described, but using the second 
benchmark index

\code{"auto.pearson"} or \code{"auto.spearman"} for Pearson or Spearman 
autocorrelation, defined as the correlation between subsequent gains

\code{"allocation"} for allocation to first fund in each pair.}

\item{y.metric}{Same as \code{x.metric}, but for the y-axis}

\item{tickerlabel.offsets}{Either a numeric vector of length 2 giving the 
x- and y-axis offsets for all ticker labels, or a 2-column matrix where each 
row gives the x- and y-axis offsets for a ticker.}

\item{reflabel.offsets}{Either a numeric vector of length 2 giving the x- and 
y-axis offsets for all reference ticker labels, or a 2-column matrix where 
each row gives the x- and y-axis offsets for a reference ticker.}

\item{add.plot}{Logical value for whether to add plot data to current plot 
frame rather than open a new one.}

\item{colors}{Character vector of colors for each curve.}

\item{lty}{Numeric vector specifying line types for each curve.}

\item{plot.list}{List of arguments to pass to \code{\link[graphics]{plot}}.}

\item{points.list}{List of arguments to pass to 
\code{\link[graphics]{points}}.}

\item{text.list}{List of arguments to pass to \code{\link[graphics]{text}}.}

\item{pdf.list}{List of arguments to pass to \code{\link[grDevices]{pdf}}.}

\item{bmp.list}{List of arguments to pass to \code{\link[grDevices]{bmp}}.}

\item{jpeg.list}{List of arguments to pass to \code{\link[grDevices]{jpeg}}.}

\item{png.list}{List of arguments to pass to \code{\link[grDevices]{png}}.}

\item{tiff.list}{List of arguments to pass to \code{\link[grDevices]{tiff}}.}
}
\value{
In addition to the graph, a list containing: 
\enumerate{
\item List named \code{portfolio.xy} where each element is a two-column 
matrix of x- and y-axis values for a curve.
\item Numeric vector named \code{means} with mean gains for each fund.
\item Numeric matrix named \code{corr.matrix} with a correlation matrix for 
gains for each fund.
}
}
\description{
Useful for visualizing performance of three-fund portfolios, typically by 
plotting a measure of growth vs. a measure of volatility. Only works for one 
three-fund set at a time.
}
\examples{
\dontrun{
# Plot mean vs. SD for UPRO/VBLTX/VWEHX portfolio, and compare to VFINX and 
# BRK-B
fig <- threefunds_graph(tickers = c("VWEHX", "VBLTX", "UPRO"), 
                        reference.tickers = c("VFINX", "BRK-B"))
}


}
\references{
Ryan, J.A. and Ulrich, J.M. (2017) quantmod: Quantitative Financial Modelling 
Framework. R package version 0.4-12, 
\url{https://CRAN.R-project.org/package=quantmod}.
}
