#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
radarWidget <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
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
