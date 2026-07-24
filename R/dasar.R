# ============================================================================
# BAGIAN 0: FUNGSI DASAR R (R Base)
# ============================================================================

#' Menggabungkan nilai menjadi sebuah vektor
#'
#' Padanan fungsi `c()`
#'
#' @param ... Nilai-nilai yang ingin digabungkan menjadi vektor.
#'
#' @return Sebuah vektor (numeric, character, logical, atau jenis lainnya
#'         tergantung input).
#'
#' @examples
#' input_vektor(1, 2, 3)
#' input_vektor("a", "b", "c")
#'
#' @family input
#' @seealso [base::c()]
#' @export
input_vektor <- function(...) {
  c(...)
}

#' Menjumlahkan nilai vektor
#'
#' Padanan fungsi `sum()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan untuk `sum()`
#'
#' @return Sebuah nilai numerik hasil penjumlahan
#'
#' @examples
#' dasaR_jumlah(c(1, 2, 3))  # 6
#'
#' @family dasaR
#' @seealso [base::sum()]
#' @export
dasaR_jumlah <- function(x, ...) {
  sum(x, ...)
}

#' Menghitung nilai rata-rata
#'
#' Padanan fungsi `mean()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan untuk `mean()`
#'
#' @return Nilai rata-rata
#'
#' @examples
#' dasaR_rata_rata(c(1, 2, 3))  # 2
#'
#' @family dasaR
#' @seealso [base::mean()]
#' @export
dasaR_rata_rata <- function(x, ...) {
  mean(x, ...)
}

#' Menghitung nilai median
#'
#' Padanan fungsi `median()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan untuk `median()`
#'
#' @return Nilai median
#'
#' @examples
#' dasaR_median(c(10, 2, 5))  # 5
#'
#' @family dasaR
#' @seealso [stats::median()]
#' @export
dasaR_median <- function(x, ...) {
  median(x, ...)
}

#' Mengambil nilai minimum
#'
#' Padanan fungsi `min()`
#'
#' @param x Vektor numerik.
#' @param ... Argumen tambahan untuk `min()`
#'
#' @return Nilai minimum
#'
#' @examples
#' dasaR_minimum(c(3, 1, 6))  # 1
#'
#' @family dasaR
#' @seealso [base::min()]
#' @export
dasaR_minimum <- function(x, ...) {
  min(x, ...)
}

#' Mengambil nilai maksimum
#'
#' Padanan fungsi `max()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan
#'
#' @return Nilai maksimum
#'
#' @examples
#' dasaR_maksimum(c(3, 1, 6))  # 6
#'
#' @family dasaR
#' @seealso [base::max()]
#' @export
dasaR_maksimum <- function(x, ...) {
  max(x, ...)
}

#' Menghitung standar deviasi
#'
#' Padanan fungsi `sd()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan
#'
#' @return Nilai standar deviasi
#'
#' @examples
#' dasaR_standar_deviasi(c(1, 2, 3))
#'
#' @family dasaR
#' @seealso [stats::sd()]
#' @export
dasaR_standar_deviasi <- function(x, ...) {
  sd(x, ...)
}

#' Menghitung variansi
#'
#' Padanan fungsi `var()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan
#'
#' @return Nilai variansi
#'
#' @examples
#' dasaR_variansi(c(1, 2, 3))
#'
#' @family dasaR
#' @seealso [stats::var()]
#' @export
dasaR_variansi <- function(x, ...) {
  var(x, ...)
}

#' Menghitung nilai rentang
#'
#' Padanan fungsi `range()`
#'
#' @param x Vektor numerik
#' @param ... Argumen tambahan
#'
#' @return Vektor panjang 2 berisi nilai minimum dan maksimum
#'
#' @examples
#' dasaR_rentang(c(3, 1, 6))  # 1 6
#'
#' @family dasaR
#' @seealso [base::range()]
#' @export
dasaR_rentang <- function(x, ...) {
  range(x, ...)
}

#' Menghitung panjang vektor
#'
#' Padanan fungsi `length()`
#'
#' @param x Objek R (biasanya vektor)
#'
#' @return Bilangan bulat panjang objek
#'
#' @examples
#' dasaR_panjang(c(10, 20, 30))  # 3
#'
#' @family dasaR
#' @seealso [base::length()]
#' @export
dasaR_panjang <- function(x) {
  length(x)
}

#' Mengambil nilai unik
#'
#' Padanan fungsi `unique()`
#'
#' @param x Vektor
#'
#' @return Vektor berisi nilai unik
#'
#' @examples
#' dasaR_unik(c(1, 1, 2, 3))
#'
#' @family dasaR
#' @seealso [base::unique()]
#' @export
dasaR_unik <- function(x) {
  unique(x)
}
