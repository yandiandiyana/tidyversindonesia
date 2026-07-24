# ============================================================================
# BAGIAN 2: MERAPIKAN DATA (Tidy)
# ============================================================================

#' Merapikan data menjadi format memanjang (menambah baris)
#'
#' Padanan fungsi `tidyr::pivot_longer()`
#'
#' @param data Data frame.
#' @param cols Kolom yang diputar.
#' @param names_to Nama kolom baru.
#' @param values_to Nama kolom nilai.
#' @param ... Argumen tambahan.
#'
#' @return Data frame dalam format memanjang.
#'
#' @examples
#' df <- data.frame(a = 1:3, jan = 1:3, feb = 4:6)
#' rapi_pivot_memanjang(df, cols = c(jan, feb), names_to = "bulan", values_to = "nilai")
#'
#' @export
#' @seealso [tidyr::pivot_longer()]
#' @family rapi
rapi_pivot_memanjang <- function(data, cols, names_to = "name", values_to = "value", ...) {
  tidyr::pivot_longer(data = data, cols = {{cols}}, names_to = names_to, values_to = values_to, ...)
}

#' Merapikan data menjadi format melebar (menambah kolom)
#'
#' Padanan fungsi `tidyr::pivot_wider()`
#'
#' @param data Data frame
#' @param names_from Kolom untuk nama variabel
#' @param values_from Kolom untuk nilai
#' @param ... Argumen tambahan
#'
#' @return Data frame dalam format lebar
#'
#' @examples
#' df <- data.frame(bulan = c("jan","feb"), nilai = c(10, 20))
#' rapi_pivot_melebar(df, names_from = bulan, values_from = nilai)
#'
#' @export
#' @family rapi
rapi_pivot_melebar <- function(data, names_from, values_from, ...) {
  tidyr::pivot_wider(data = data, names_from = {{names_from}}, values_from = {{values_from}}, ...)
}

#' Mengekstrak angka dari teks
#'
#' Padanan fungsi `readr::parse_number()`
#'
#' @param x Vektor karakter yang mengandung angka dan teks.
#' @param locale Lokasi numerik (opsional), mengikuti parameter `readr::parse_number()`.
#' @param na Pasangan teks tertentu yang dianggap sebagai `NA`.
#' @param trim_ws Logika: apakah spasi kosong di awal/akhir dihapus sebelum parsing.
#'
#' @return Vektor numerik hasil ekstraksi angka dari teks.
#'
#' @examples
#' kolom_ekstrak_angka("Rp 1.500.000")
#' kolom_ekstrak_angka("Diskon 20%")
#' kolom_ekstrak_angka(c("abc123", "45kg"))
#'
#' @export
#' @seealso [readr::parse_number()]
#' @family rapi
kolom_ekstrak_angka <- function(x, locale = readr::locale(), na = c("", "NA"), trim_ws = TRUE) {
  readr::parse_number(x, locale = locale, na = na, trim_ws = trim_ws)
}

#' Memisahkan satu kolom menjadi beberapa kolom
#'
#' Padanan fungsi `tidyr::separate()`.
#'
#' @param data Data frame.
#' @param col Kolom yang ingin dipisah.
#' @param into Nama kolom hasil.
#' @param sep Pola pemisah.
#' @param ... Argumen tambahan.
#'
#' @return Data frame dengan kolom baru hasil pemisahan.
#'
#' @examples
#' df <- data.frame(tanggal = c("2020-01", "2020-02"))
#' rapi_pisah_kolom(df, tanggal, into = c("tahun", "bulan"), sep = "-")
#'
#' @export
#' @seealso [tidyr::separate()]
#' @family rapi
rapi_pisah_kolom <- function(data, col, into, sep, ...) {
  tidyr::separate(data = data, col = {{col}}, into = into, sep = sep, ...)
}

#' Menggabungkan beberapa kolom menjadi satu
#'
#' Padanan fungsi `tidyr::unite()`.
#'
#' @param data Data frame.
#' @param col Kolom baru.
#' @param ... Kolom yang digabungkan.
#' @param sep Pemisah.
#'
#' @return Data frame dengan kolom baru hasil penggabungan.
#'
#' @examples
#' df <- data.frame(tahun = 2020, bulan = "01")
#' rapi_gabung_kolom(df, tanggal, tahun, bulan, sep = "-")
#'
#' @export
#' @seealso [tidyr::unite()]
#' @family rapi
rapi_gabung_kolom <- function(data, col, ..., sep = "_") {
  tidyr::unite(data = data, col = {{col}}, ..., sep = sep)
}

#' Menghapus baris dengan nilai hilang (NA)
#'
#' Padanan fungsi `tidyr::drop_na()`
#'
#' @param data Data frame.
#' @param ... Kolom opsional untuk diperiksa.
#'
#' @return Data frame tanpa baris NA.
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3))
#' rapi_hapus_na(df)
#'
#' @export
#' @seealso [tidyr::drop_na()]
#' @family rapi
rapi_hapus_na <- function(data, ...) {
  tidyr::drop_na(data = data, ...)
}

#' Mengisi nilai hilang (NA)
#'
#' Padanan fungsi `tidyr::fill()`
#'
#' @param data Data frame.
#' @param ... Kolom untuk diisi.
#' @param .direction Arah pengisian.
#'
#' @return Data frame dengan NA yang sudah diisi.
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3))
#' rapi_isi_na(df, a, .direction = "down")
#'
#' @export
#' @seealso [tidyr::fill()]
#' @family rapi
rapi_isi_na <- function(data, ..., .direction = "down") {
  tidyr::fill(data = data, ..., .direction = .direction)
}
