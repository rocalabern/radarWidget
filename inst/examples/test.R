# htmlwidgets::scaffoldWidget("radarWidget")
# devtools::install()

library(radarWidget)

n = 3
d = 6
df = data.frame(Label = paste("Class", toupper(letters[1:n])))
for (i in 1:d) df[, paste0("Eje_",i)] = runif(n)
df = df[, c(colnames(df)[1], colnames(df)[2], rev(colnames(df)[3:(d+1)]))]

DT::datatable(df, rownames=FALSE, options =
                list(ordering=FALSE, searching=FALSE, paging=FALSE, info=FALSE))

radarWidget(df)

radarWidget(df[,-1], legendCol=NULL)

radarWidget(df, showLegend = FALSE)

radarWidget(df, showTitle = FALSE)

radarWidget(df, showTitle = TRUE, showLegend = FALSE)
