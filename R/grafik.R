#' Grafik
#'
#' Fungsi pembungkus sederhana untuk ggplot2::ggplot()
#'
#' @param data Dataset (data frame atau tibble)
#' @param mapping Aesthetic mapping, gunakan ggplot2::aes()
#' @return Objek ggplot2
#' @export
grafik <- function(data, mapping = NULL) {
  ggplot2::ggplot(data = data, mapping = mapping)
}

