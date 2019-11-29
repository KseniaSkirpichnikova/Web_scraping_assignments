library(rvest)
library(data.table)
library(tidyverse)

get_one_page <- function(my_url) {

t<-read_html(url)
write_html(t, "t.html")

my_titles<-
  t%>%
  html_nodes('.result-list .title')%>%
  html_text()

my_titles

my_summary<-
  t%>%
  html_nodes('.dek')%>%
  html_text()%>%
  trimws()

my_summary


my_topics<-
  t%>%
  html_nodes('.topic')%>%
  html_text()

my_topics


my_date<-
  t%>%
  html_nodes('.date')%>%
  html_text()

return(data.frame('title'=my_titles, 'summary'=my_summary, 'topics'=my_topics, 'date'=my_date))
}

my_urls <- paste0('https://www.cbsnews.com/search/?q=big+data&p=',seq(from=1, to=10, by=1) )

my_res <- lapply(my_urls, get_one_page)

res_df <- rbindlist(my_res)

write_csv(res_df, "cbsnews.com_big_data_news.csv")

my_authors<-
  t%>%
  html_nodes('.author')%>%
  html_text()

my_authors

links
