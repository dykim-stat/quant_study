---
title: "Chatper3 API를 이용한 데이터 수집"
output: html_document
editor_options: 
  chunk_output_type: console
---

# 3.1 API를 이용한 Quandl데이터 다운로드
```{r}
url.aapl = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.csv?api_key=xw3NU3xLUZ7vZgrz5QnG"
data.aapl = read.csv(url.aapl)

head(data.aapl)
```

# 3.2 getSymbols() 함수를 이용한 API 다운로드
## 3.2.1 주가 다운로드
```{r}
quantmod::getSymbols('AAPL')
head(AAPL)
quantmod::chart_Series(AAPL$AAPL.Close)

## 기간정해서 불러오기
data = quantmod::getSymbols('AAPL',
                            from='2000-01-01',to='2018-12-31',
                            auto.assign=F)
head(data)

ticker = c('FB','NVDA')
quantmod::getSymbols(ticker)

```

## 3.2.2 국내 종목 주가 다운로드
- 코스피 상장 종목의 경우 티커.KS, 코스닥 상장 종목의 경우 티커.KQ
```{r}
data = quantmod::getSymbols('005930.KS',
                     from='2000-01-01',to='2018-12-31',
                     auto.assign = F)
data$`005930.KS.Close`
quantmod::getSymbols("068760.KQ",
           from = '2000-01-01', to = '2018-12-31')
```


## 3.2.3 FRED 데이터 다운로드
미국 연방준비은행에서 관리하는 Federal Reserve Economic Data(FRED)는 미국 및 각국의 중요 경제지표 데이터를 살펴볼 때 가장 많이 참조되는 곳 중 하나.
```{r}
getSymbols('DGS10', src='FRED')
chart_Series(DGS10)
```
https://fred.stlouisfed.org/
여기가서 원하는거 검색해서 뒤에 붙은 코드 찾으면 됨. 509000여개의 방대한 데이터 다운 가능
