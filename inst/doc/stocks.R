## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

# Load packages
library("knitr")

# Other options
options(digits = 4)

## ------------------------------------------------------------------------
library("stocks")
library("printr")
prices <- load_prices(c("SPY", "TLT"), to = "2018-03-02")
head(prices)

gains <- load_gains(c("SPY", "TLT"), to = "2018-03-02")
head(gains)

## ------------------------------------------------------------------------
prices_rate(prices)
gains_rate(gains)

## ------------------------------------------------------------------------
prices_rate(prices, units.rate = 252)
gains_rate(gains, units.rate = 252)

## ------------------------------------------------------------------------
sharpe(prices = prices)
sharpe(gains = gains)

mdd(prices = prices)
mdd(gains = gains)

## ------------------------------------------------------------------------
bond.metrics <- metrics(gains = gains, perf.metrics = c("growth", "cagr", "sharpe", "mdd"))
bond.metrics$perf.metrics
bond.metrics$cor.mat

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- growth_graph(c("SPY", "FB", "AMZN", "NFLX", "GOOG"), from = "2015-03-02", 
                    to = "2018-03-02")

## ---- fig.width = 5, fig.height = 5--------------------------------------
fig <- gains_graph(c("SPY", "VBLTX"), from = "2013-03-02", to = "2018-03-02")

## ---- fig.width = 6.5, fig.height = 5------------------------------------
data(sector_spdr_etfs)
fig <- onemetric_graph(tickers = sector_spdr_etfs$ticker, 
                       from = "2017-03-02", to = "2018-03-02")

## ---- fig.width = 5, fig.height = 5--------------------------------------
fig <- twometrics_graph(tickers = sector_spdr_etfs$ticker, 
                        from = "2017-03-02", to = "2018-03-02", 
                        x.metric = "mdd", y.metric = "cagr")

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- onemetric_overtime_graph(tickers = c("SPY", "BRK-B"), 
                                from = "2003-03-02", to = "2018-03-02", 
                                window.units = 100, y.metric = "sharpe")

## ------------------------------------------------------------------------
apply(fig, 2, median)
mean(fig[, 2] > fig[, 1])

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- twofunds_graph(tickers = c("UPRO", "VBLTX"), reference.tickers = "SPY",  
                      to = "2018-03-02")

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- twofunds_graph(tickers = c("UPRO", "VBLTX", "UPRO", "VBMFX"), 
                      reference.tickers = "SPY",  
                      to = "2018-03-02", 
                      x.metric = "mdd", y.metric = "cagr")

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- twofunds_graph(tickers = c("UPRO", "VBLTX", "UPRO", "VBMFX", "UPRO", "TLT"), 
                      reference.tickers = "SPY",  
                      to = "2018-03-02", 
                      x.metric = "mean", y.metric = "sharpe", 
                      plot.list = list(ylim = c(0, 0.12)))

## ---- fig.width = 6, fig.height = 5--------------------------------------
fig <- threefunds_graph(tickers = c("VWEHX", "UPRO", "VBLTX"), 
                        reference.tickers = "SPY",  
                        to = "2018-03-02")

