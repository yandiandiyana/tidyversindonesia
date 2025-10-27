#' Titik
#'
#' Wrapper untuk ggplot2::geom_point()
#'
#' @param ... Argumen tambahan untuk geom_point()
#' @return Layer ggplot2
#' @export
titik <- function(...) {
  ggplot2::geom_point(...)
}

#' Garis
#'
#' Wrapper untuk ggplot2::geom_line()
#'
#' @param ... Argumen tambahan untuk geom_line()
#' @return Layer ggplot2
#' @export
garis <- function(...) {
  ggplot2::geom_line(...)
}

#' Batang
#'
#' Wrapper untuk ggplot2::geom_bar()
#'
#' @param ... Argumen tambahan untuk geom_bar()
#' @return Layer ggplot2
#' @export
batang <- function(...) {
  ggplot2::geom_bar(...)
}

#' Boxplot
#'
#' Wrapper untuk ggplot2::geom_boxplot()
#'
#' @param ... Argumen tambahan untuk geom_boxplot()
#' @return Layer ggplot2
#' @export
boxplot <- function(...) {
  ggplot2::geom_boxplot(...)
}

#' Histogram
#'
#' Wrapper untuk ggplot2::geom_histogram()
#'
#' @param ... Argumen tambahan untuk geom_histogram()
#' @return Layer ggplot2
#' @export
histogram <- function(...) {
  ggplot2::geom_histogram(...)
}

#' Semampai
#'
#' Wrapper untuk ggplot2::geom_smooth()
#'
#' @param ... Argumen tambahan untuk geom_smooth()
#' @return Layer ggplot2
#' @export
semampai <- function(...) {
  ggplot2::geom_smooth(...)
}
