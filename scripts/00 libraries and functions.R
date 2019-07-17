library(stringr)
library(XML)
library(rvest)
library(xml2)
library(RCurl)
library(dplyr)
library(lubridate)
library(stringr)
library(tidyr)

#create function to add zeros
add.zeros<-function(x){
  ifelse (x<10, paste0("000",x),
          ifelse (x<100, paste0("00",x),
                  ifelse (x<1000, paste0("0",x),x)))}

#funcation to get the last n character of a string
substrLast <- function(x, n){
  substr(x, n, nchar(x))
}

#main function to get the text of certain ELI fields
get_content <- function(var_name, myxpath) {
  tryCatch(
    out[i,var_name] <<- str_c(html_text(html_nodes(h,xpath = myxpath)), sep = "", collapse = ', '),
    warning=function(w){out[i,var_name] <<- NA},
    error=function(e){out[i,var_name] <<- NA})
} 

### the libraries and settings below are only needed for the figures
# figures
library(extrafont)
library(sysfonts)
library(showtext)

#fonts
font_add_google('Cairo') #get the fonts 
font_add_google("Montserrat")
font_families() #check that the fonts are installed and available
showtext_auto() #this is to turn on the custom fonts availability
showtext_opts(dpi = 96) #set the resolution: 96 is default

#color settings
background.color=rgb(255, 246, 229, max=255) #color for the background
dark.color=rgb(45, 45, 68, max=255) # dark color
main.color=rgb(0, 102, 0, alpha=155, max=255) #main color
main.color2=rgb(255, 0, 51, alpha=155, max=255) #main color
main.color3=rgb(51, 0, 255, alpha=155, max=255) #main color