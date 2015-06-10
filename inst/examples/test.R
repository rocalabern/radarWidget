htmlwidgets::scaffoldWidget("radarWidget")
devtools::install()



radarWidget("Jordi esta escoltant")


library(RJSONIO)
df <- data.frame(COL1=c("A", "B"), COL2=c(1,2))
l <- list()
l$A <- df
l$B <- c(LETTERS[1:10])
cat(toJSON(l))
