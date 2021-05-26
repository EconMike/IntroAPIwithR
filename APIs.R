#Thank you Barret Schloerke from RStudio

#install.packages("plumber")
  library(plumber)

#setwd("F:/API's")
 
#function(text = "") {
#  list( 
#    message_echo = paste("The text is:", text)
#  )
#}
#plumber::plumb("plumber.R")$run(port = 5762)

#widelong_api <- plumber::plumb("plumber.R")
#widelong_api$run(host = '127.0.0.1', port = 8000)

data<-read.csv("cars.csv")

#write.csv(mtcars,"cars.csv")

#* Return the data
#* @serializer csv
#* @get /data

function( ) {
  data
}

#* Return the data
#* @serializer csv
#* @get /data2

function( ) {
  as_attachment(data,"mike.csv")
}

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="Hi") {
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @get /plot
function() {
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  as.numeric(a) + as.numeric(b)
}
