#' @title radarWidget
#' @import htmlwidgets
#' @export
radarWidget <- function(
  df,
  legendCol = 1,
  firstColData = ifelse(is.null(legendCol),1, 2),
  legend.title = ifelse(is.null(legendCol), "Legend", colnames(df)[legendCol]),
  legend.text = df[, legendCol],
  showLegend = ifelse(is.null(legendCol), FALSE, TRUE),
  showTitle = showLegend,
  width = NULL, height = NULL) {

  if (is.null(legend.title)) legend.title = ""
  if (is.null(legend.text) || is.null(legendCol) || !showLegend) legend.text = ""

  o = list()
  for (i in 1:nrow(df)) {
    oT = list()
    for (k in firstColData:ncol(df)) {
      oT[[1+k-firstColData]] = list(axis=colnames(df)[k],value=df[i,k], label=legend.text[i])
    }
    o[[i]] = oT
  }

  # forward options using x
  x = list(
    data = o,
    showTitle = showTitle,
    showLegend = showLegend,
    title = legend.title,
    legend = legend.text
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'radarWidget',
    x,
    width = width,
    height = height,
    package = 'radarWidget'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
radarWidgetOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'radarWidget', width, height, package = 'radarWidget')
}

#' Widget render function for use in Shiny
#'
#' @export
renderRadarWidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, radarWidgetOutput, env, quoted = TRUE)
}
