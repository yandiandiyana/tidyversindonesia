#' Lokasi berkas contoh
#'
#' Paket ini menyertakan berkas CSV contoh yang dibuat sendiri (orisinal) untuk
#' berlatih mengimpor data. Isinya meniru keanehan data nyata yang dibahas di
#' bab impor data buku *R for Data Science*: judul kolom ber-spasi, nilai
#' `N/A`, sel kosong, angka yang ditulis dengan huruf, dan data yang terbagi
#' ke beberapa berkas. Dengan berkas ini pelajar tidak perlu mengunduh apa pun.
#'
#' @param nama Nama berkas contoh. Bila `NULL`, fungsi mengembalikan daftar
#'   nama berkas yang tersedia.
#'
#' @return Lokasi berkas (teks), atau vektor nama berkas bila `nama = NULL`.
#'
#' @section Berkas yang tersedia:
#' * `siswa.csv`: enam siswa dengan judul kolom ber-spasi, nilai `N/A`, satu
#'   sel kosong, dan satu usia yang ditulis `lima`.
#' * `01-penjualan.csv`, `02-penjualan.csv`, `03-penjualan.csv`: data
#'   penjualan tiga bulan yang dipecah ke tiga berkas.
#'
#' @section Perbedaan dengan buku:
#' Buku mengunduh `students.csv` dan `01-sales.csv` dari internet; isinya
#' berbeda dari berkas contoh di sini. Strukturnya sengaja dibuat setara
#' sehingga kode yang sama dapat dilatih.
#'
#' @examples
#' imp_berkas_contoh()
#' siswa <- imp_berkas_contoh("siswa.csv")
#' imp_baca_csv(siswa, na = c("N/A", ""), tampilkan_tipe_kolom = FALSE)
#' @export
imp_berkas_contoh <- function(nama = NULL) {
  folder <- system.file("extdata", package = "tidyversindonesia")
  if (is.null(nama)) {
    return(list.files(folder))
  }
  berkas <- file.path(folder, nama)
  if (!file.exists(berkas)) {
    stop(
      "Berkas contoh `", nama, "` tidak ditemukan. ",
      "Jalankan `imp_berkas_contoh()` untuk melihat daftar yang tersedia.",
      call. = FALSE
    )
  }
  berkas
}
