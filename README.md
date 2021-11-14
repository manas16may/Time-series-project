# Time-series-project
> This repository is for a group projectfor the course *MTH517A: Time Series Analysis* during the academic session 2021-2022 (odd semester) at IIT Kanpur.

## Group Members:
  - Arghyamalya Biswas
  - Arkajyoti Bhattacharjee
  - Manas Mishra
  - Ritwik Vashistha
  - Shubha Sankar Banerjee

## Project Title:
`Effect of COVID-19 on the Indian Stock Market`


##  Notes:
Timeseries.csv: It is combined data of covid cases and nifty small cap
Timeseries1.csv: It is combined data of covid case and nifty 50
midcap.csv: combined data of covid case and nifty mid cap
causality.final = R markdown of casual effects we want to check
arima.final=R markdown of arima models on all the three stock indices


Results:
Arima results are not good because of non linearity if time series
For midcap arima is not a suitable model because the assumptions of errors are being violated
For small cap and nifty50 fitting arima does not violate any assumptions but results are very bad
Mean absolute error has been used so that error that does not look that bad


Results for causality:
There is no causality in any time intervals between the covid cases and the stock indices(all three)
Cointegration is there for some of the intervals in some stock indices but causality is not there
