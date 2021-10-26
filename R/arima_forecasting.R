library(tseries)
library(forecast)
rm(list=ls())
data=read.csv('data.csv')
data$Date <- as.Date(data$Date)
data1=read.csv('testdata.csv')
data1$Date=as.Date(data1$Date)
head(data1)
head(data)
str(data)
final=rbind(data,data1)
tail(final)
str(final)
price=final$Close
log_return=diff(log(price),lag=1)
final=final[-1,]
head(final)
final['return']=log_return
plot(final$return,type="o")
tail(final)
y_train<- final[1:221, ]
tail(y_train)
y_test<-final[222:431,]
tail(y_test)
## Checking Stationary of log data (y)
adf.test(final$return, alternative = "stationary")
## ACF and PACF of the error
par(mfrow=c(1,2))
Acf(y_train$return, lag.max = 40, main='ACF')
Pacf(y_train$return, lag.max = 40, main = 'PACF')
# AR value to 35 is sufficient
## Fitting ARIMA Model
best.order = c(0, 0, 0)
best.aic = Inf
for (q in 1:33) for (p in 1:35) {
  fit.model= arima(y_train$return, order = c(p, 0, q), optim.control = list(maxit = 1000) )
  fit.aic = fit.model$aic
  if (fit.aic < best.aic) {
    best.order = c(p, 0, q)
    best.arima = fit.model
    best.aic = fit.aic
  }
}
best.order; best.aic
model.fit = best.arima
tsdisplay(residuals(model.fit), lag.max = 40,
main ="ARIMA (11,0,2) Model Residuals")
checkresiduals(model.fit, lag.max = 40)
library(astsa)
forecast1 = sarima.for(y_test$return, n.ahead =length(y_test$return), p=11, d=0, q=2);dev.off()
plot(y_test$return,type="l",col="red")
plot(forecast1$pred,type='l',col="green")
##MSE for forecasting
p1 = forecast1$pred
obs1 = y_test$return
MSE_foreast1 = mean((p1 - obs1)^2)
MSE_foreast1
