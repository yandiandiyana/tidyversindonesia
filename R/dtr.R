# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Lihat sekilas isi data
#'
#' Versi Bahasa Indonesia dari [dplyr::glimpse()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Hasilnya dikembalikan secara tak terlihat, sama seperti fungsi asli.
#'
#' @param x Tabel data. Sama dengan asli: `x`.
#' @param lebar Lebar keluaran dalam karakter. Asli: `width`.
#' @param ... Argumen lain, diteruskan apa adanya ke [dplyr::glimpse()].
#'
#' @return `x`, secara tak terlihat, sama seperti [dplyr::glimpse()].
#'
#' @section Padanan dengan fungsi asli:
#' `dtr_sekilas()` memanggil [dplyr::glimpse()].
#'
#' @examples
#' df <- inp_tibble(x = 1:3, g = c("a", "b", "a"))
#' dtr_sekilas(df)
#'
#' # Setara dengan kode standar:
#' dplyr::glimpse(df)
#' @export
dtr_sekilas <- function(x, lebar, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("dtr_sekilas", .panggilan, .lingkungan))
}

#' Lihat bagian awal data
#'
#' Versi Bahasa Indonesia dari [utils::head()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. `n` adalah argumen metode `head()`, sehingga diteruskan fungsi asli
#' lewat `...`.
#'
#' @param x Tabel data atau vektor. Sama dengan asli: `x`.
#' @param ... Argumen lain, diteruskan apa adanya ke [utils::head()].
#' @param n Jumlah baris atau elemen yang diambil. Sama dengan asli: `n`.
#'
#' @return Bagian awal `x`, sama seperti [utils::head()].
#'
#' @section Padanan dengan fungsi asli:
#' `dtr_kepala()` memanggil [utils::head()].
#'
#' @examples
#' df <- inp_tibble(x = 1:10)
#' dtr_kepala(df, n = 3)
#'
#' # Setara dengan kode standar:
#' head(df, n = 3)
#' @export
dtr_kepala <- function(x, ..., n) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dtr_kepala", .panggilan, .lingkungan)
}

#' Lihat bagian akhir data
#'
#' Versi Bahasa Indonesia dari [utils::tail()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. `n`, `pertahankan_nomor`, dan `nomor_baris` adalah argumen metode
#' `tail()`, sehingga diteruskan fungsi asli lewat `...`.
#'
#' @param x Tabel data atau vektor. Sama dengan asli: `x`.
#' @param ... Argumen lain, diteruskan apa adanya ke [utils::tail()].
#' @param n Jumlah baris atau elemen yang diambil. Sama dengan asli: `n`.
#' @param pertahankan_nomor Apakah nomor baris atau kolom asli dipertahankan.
#'   Asli: `keepnums`.
#' @param nomor_baris Apakah nomor baris ditambahkan. Asli: `addrownums`.
#'
#' @return Bagian akhir `x`, sama seperti [utils::tail()].
#'
#' @section Padanan dengan fungsi asli:
#' `dtr_ekor()` memanggil [utils::tail()].
#'
#' @examples
#' df <- inp_tibble(x = 1:10)
#' dtr_ekor(df, n = 3)
#'
#' # Setara dengan kode standar:
#' tail(df, n = 3)
#' @export
dtr_ekor <- function(x, ..., n, pertahankan_nomor, nomor_baris) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dtr_ekor", .panggilan, .lingkungan)
}

#' Lihat data dalam penampil interaktif
#'
#' Versi Bahasa Indonesia dari [utils::View()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Hanya bekerja dalam sesi interaktif (misalnya RStudio).
#'
#' @param x Objek yang dilihat, biasanya tabel data. Sama dengan asli: `x`.
#' @param judul Judul jendela penampil. Asli: `title`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [utils::View()].
#'
#' @return Tidak ada nilai yang bermakna, sama seperti [utils::View()].
#'
#' @section Padanan dengan fungsi asli:
#' `dtr_lihat()` memanggil [utils::View()].
#'
#' @examples
#' if (interactive()) {
#'   dtr_lihat(inp_tibble(x = 1:3))
#' }
#' @export
dtr_lihat <- function(x, judul, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dtr_lihat", .panggilan, .lingkungan)
}
