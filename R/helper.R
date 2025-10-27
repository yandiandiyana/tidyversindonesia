#' Jumlah
#'
#' Wrapper untuk dplyr::n()
#' @return Jumlah baris di grup
#' @export
jumlah <- function() {
  dplyr::n()
}

#' Semua
#'
#' Wrapper untuk dplyr::everything()
#' @return Semua kolom
#' @export
semua <- function() {
  dplyr::everything()
}

#' Awal
#'
#' Wrapper untuk dplyr::starts_with()
#' @param match String yang dicari di awal nama kolom
#' @return Kolom yang sesuai
#' @export
awal <- function(match) {
  dplyr::starts_with(match)
}

#' Akhir
#'
#' Wrapper untuk dplyr::ends_with()
#' @param match String yang dicari di akhir nama kolom
#' @return Kolom yang sesuai
#' @export
akhir <- function(match) {
  dplyr::ends_with(match)
}

#' Mengandung
#'
#' Wrapper untuk dplyr::contains()
#' @param match String yang dicari di nama kolom
#' @return Kolom yang sesuai
#' @export
mengandung <- function(match) {
  dplyr::contains(match)
}
