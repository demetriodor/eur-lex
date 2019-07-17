### Download the files

#construct a vector of urls
letter = "R" #use L, R, and D
year0 = 2019 #choose start year
year1 = 2019 #choose end year
start = 1 #choose starting number 
end = 1210 #choose end number


urls<-NA
for (i in year0:year1){
  for (j in start:end){
    urls[j+(i-year0)*end]<-paste0("http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:3",i,letter,add.zeros(j))
  }
}

#download the files
for (i in 1: length(urls)){
  if (url.exists(urls[i], .header=TRUE)['statusMessage']=='Not Found')
    print (urls[i])
  #next
  else
    download.file(urls[i], destfile=paste0("./legal_acts/",substr(urls[i],nchar(urls[i])-9, nchar(urls[i])),".html"), 
                  method='libcurl', mode='w', cacheOK=TRUE, quiet=T, Sys.sleep(1))
}  


### this is only needed for celex nubmers with brackets
celex_b<-read.table('celex_brackets.txt', header=T)
urls<-NA
for (i in 1:length(celex_b$celex)){
  urls[i]<-paste0("http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:",celex_b$celex[i])
}
urls<-urls[is.na(urls)==F]

##########################################################################################
# alternative version that downloads all files and only then removes empty ones
for (i in 1: length(urls)){
  tryCatch(
    download.file(urls[i], destfile=paste0("./legal_acts/",substr(urls[i],nchar(urls[i])-9, nchar(urls[i])),".html"), 
                  method='libcurl', mode='w', cacheOK=TRUE, quiet=T, Sys.sleep(1)), 
    warning=function(w){print (urls[i])},
    error=function(e){print (urls[i])})
}  

#delete empty files: this only works once the files are downloaded and R Studio is restarted. Otherwise the files are kept open for some reason.
docs <- list.files(path= './legal_acts/', pattern = "*.html", full.names=TRUE)  
inds <- file.size(docs) == 0 
file.remove(docs[inds])
