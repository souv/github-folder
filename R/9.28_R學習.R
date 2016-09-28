#寫函數的技巧:用到的參數在{}裡面都要有
add <- function(a, b){a + b}

add(1,3)

#資料表的資料就有種迴圈的感覺

#製作時間的序列，自動生成日期的序列
date2=seq(as.Date('105-7-1'),by='days',length=30)

#strftime用來抓取日期中的年份.月份.日期等資料
#個別取出i日期裡面的年份、月份、日期去做爬蟲
year<-strftime(date2[1],"%Y")
year=as.numeric(year)
year=year-1911
month<- strftime(date2[1],"%m")
month=as.numeric(month)
day<-strftime(date2[1],"%d")
day=as.numeric(day)

#製作日期的迴圈集，一定要寫1:length不然會變成日期會變成數字
for (i in 1:length(date2)){
  str(date2[i])
  k=(paste0(date2[i], ":", is.numeric(date2[i])))
  year<-strftime(k,"%Y")
  print(year)
}

#使用date.table可以把變數轉到資料表，在r裡面轉成資料表一定會比較好
dt <- data.table(x = c("date1","date2"),
                 scrapy.date = date2,year=year,month=month,day=day)

for (i  in 1:length(unique(dt$scrapy.date))) {
  str(i)
  str(dt[i, scrapy.date]) 
  #  print(paste0(dt[i, max.date], ":", is.numeric(dt[i, max.date]) ))
}

# 利用apply做迴圈
apply(iris[,1:3], 1, mean)
apply(dt,2,add)#第2個參數用1或2會被轉置，我只放一個變數時就可以跑

#製作爬蟲的函數(可以用資料表抓多個日期)
#製作多個日期的資料表
dt <- data.table(scrapy.date = date2)
dt2=dt[1:3]#抓1-3筆紀錄出來

apply(dt2,1,web)

web<-function(time2){
  
  webElem1<-remDr$findElement("xpath","//*[@id=\"year\"]")
  
  y=strftime(time2,"%Y")
  y=gsub("(^|[^0-9])0+", "\\1", y, perl = TRUE)
  y1=as.character(y)
  webElem1$sendKeysToElement(list(y1))
  
  
  webElem1<-remDr$findElement("xpath","//*[@id=\"month\"]")
  
  m=strftime(time2,"%m")
  m=gsub("(^|[^0-9])0+", "\\1", m, perl = TRUE)
  m1=as.character(m)
  webElem1$sendKeysToElement(list(m1))
  
  webElem1<-remDr$findElement("xpath","//*[@id=\"day\"]")
  
  d=strftime(time2,"%d")
  d=gsub("(^|[^0-9])0+", "\\1", d, perl = TRUE)
  d1=as.character(d)
  webElem1$sendKeysToElement(list(d1))
  
  button<-remDr$findElement(using="xpath","//*[@id=\"search_bar1\"]/div/input[@type=\"button\"]")
  
  button$clickElement()
  Sys.sleep(5)
  
}

#可以將某個字串轉換成日期
a=as.Date("105-8-8")
a





