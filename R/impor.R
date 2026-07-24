# ============================================================================
# BAGIAN 1: IMPOR DATA (Import)
# ============================================================================

#' Mengimpor data dari file Excel
#'
#' Padanan fungsi `readxl::read_excel()`
#'
#' @param path Jalur atau nama file Excel
#' @param sheet Nama atau nomor sheet (default: sheet pertama)
#' @param range Rentang sel (opsional)
#' @param col_types Jenis kolom (opsional)
#' @param na Nilai string yang dianggap sebagai `NA`. Default: `"NA"`
#'
#' @return Sebuah data frame berisi data dari file Excel
#'
#' @examples
#' # Contoh minimal (file harus tersedia)
#' \donttest{
#' # impor_baca_excel("data/penjualan.xlsx")
#' }
#'
#' @seealso [readxl::read_excel()]
#' @family impor
#' @importFrom readxl read_excel
#' @export
impor_baca_excel <- function(path, sheet = NULL, range = NULL, col_types = NULL, na = "NA") {
  readxl::read_excel(path = path, sheet = sheet, range = range, col_types = col_types, na = na)
}

#' Mengimpor data dari file CSV
#'
#' Padanan fungsi `readr::read_csv()`
#'
#' @param path Jalur atau nama file CSV
#' @param ... Argumen tambahan untuk `readr::read_csv()`
#'
#' @return Tibble hasil pembacaan CSV
#'
#' @examples
#' # Contoh menggunakan file CSV buatan
#' temp <- tempfile(fileext = ".csv")
#' write.csv(iris, temp, row.names = FALSE)
#' impor_baca_csv(temp)
#'
#' @seealso [readr::read_csv()]
#' @family impor
#' @export
impor_baca_csv <- function(path, ...) {
  readr::read_csv(path, ...)
}

#' Menyimpan data ke file Excel
#'
#' Padanan fungsi `writexl::write_xlsx()`
#'
#' @param data Sebuah data frame atau tibble yang akan disimpan
#' @param path Jalur atau nama file Excel tujuan
#' @param ... Argumen tambahan untuk `writexl::write_xlsx()`
#'
#' @return File Excel tersimpan ke lokasi yang ditentukan
#'
#' @examples
#' \donttest{
#' # contoh data
#' # input_tulis_excel(mtcars, "data/mtcars.xlsx")
#' }
#'
#' @seealso [writexl::write_xlsx()]
#' @family impor
#' @importFrom writexl write_xlsx
#' @export
input_tulis_excel <- function(data, path, ...) {
  writexl::write_xlsx(x = data, path = path, ...)
}

#' Menyimpan data ke file CSV
#'
#' Padanan fungsi `readr::write_csv()`
#'
#' @param data Sebuah data frame atau tibble yang akan disimpan
#' @param path Jalur atau nama file CSV tujuan
#' @param ... Argumen tambahan untuk `readr::write_csv()`
#'
#' @return File CSV tersimpan ke lokasi yang ditentukan
#'
#' @examples
#' \donttest{
#' # contoh data
#' # input_tulis_csv(mtcars, "data/mtcars.csv")
#' }
#'
#' @seealso [readr::write_csv()]
#' @family impor
#' @importFrom readr write_csv
#' @export
input_tulis_csv <- function(data, path, ...) {
  readr::write_csv(x = data, path = path, ...)
}
