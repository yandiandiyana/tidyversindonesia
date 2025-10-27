#' Tahun
#'
#' Wrapper untuk lubridate::year()
#' @param x Tanggal / datetime
#' @return Tahun
#' @export
tahun <- function(x) {
  lubridate::year(x)
}

#' Bulan
#'
#' Wrapper untuk lubridate::month()
#' @param x Tanggal / datetime
#' @return Bulan
#' @export
bulan <- function(x) {
  lubridate::month(x)
}

#' Hari
#'
#' Wrapper untuk lubridate::day()
#' @param x Tanggal / datetime
#' @return Hari
#' @export
hari <- function(x) {
  lubridate::day(x)
}

#' Hari Minggu
#'
#' Wrapper untuk lubridate::wday()
#' @param x Tanggal / datetime
#' @return Hari dalam minggu (numeric)
#' @export
hari_minggu <- function(x) {
  lubridate::wday(x)
}

#' Jam
#'
#' Wrapper untuk lubridate::hour()
#' @param x Datetime
#' @return Jam
#' @export
jam <- function(x) {
  lubridate::hour(x)
}

#' Menit
#'
#' Wrapper untuk lubridate::minute()
#' @param x Datetime
#' @return Menit
#' @export
menit <- function(x) {
  lubridate::minute(x)
}

#' Detik
#'
#' Wrapper untuk lubridate::second()
#' @param x Datetime
#' @return Detik
#' @export
detik <- function(x) {
  lubridate::second(x)
}

#' thnblntgl
#'
#' Mengubah tanggal dari format "YYYY-MM-DD" menjadi objek Date.
#'
#' @param x Karakter yang berisi tanggal dalam format tahun-bulan-tanggal, misal "2025-10-27"
#' @return Objek Date
#' @export
thnblntgl <- function(x) {
  lubridate::ymd(x)
}

#' blntglthn
#'
#' Mengubah tanggal dari format "DD-MM-YYYY" menjadi objek Date.
#'
#' @param x Karakter yang berisi tanggal dalam format tanggal-bulan-tahun, misal "27-10-2025"
#' @return Objek Date
#' @export
blntglthn <- function(x) {
  lubridate::dmy(x)
}

#' tglblnthn
#'
#' Mengubah tanggal dari format "DD-MM-YYYY" menjadi objek Date.
#'
#' @param x Karakter yang berisi tanggal dalam format tanggal-bulan-tahun, misal "27-10-2025"
#' @return Objek Date
#' @export
tglblnthn <- function(x) {
  lubridate::dmy(x)
}
