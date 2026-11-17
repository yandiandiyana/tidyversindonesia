# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Tulis tabel ke berkas CSV
#'
#' Versi Bahasa Indonesia dari [readr::write_csv()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Hasilnya dikembalikan secara tak terlihat, sama seperti fungsi
#' asli.
#'
#' @param x Tabel data yang ditulis. Sama dengan asli: `x`.
#' @param berkas Lokasi berkas tujuan. Asli: `file`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param tambahkan Apakah data ditambahkan ke berkas yang sudah ada. Asli:
#'   `append`.
#' @param nama_kolom Apakah nama kolom ikut ditulis. Asli: `col_names`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param escape Cara melepaskan karakter kutip: `"double"`, `"backslash"`,
#'   atau `"none"`. Sama dengan asli: `escape`.
#' @param akhir_baris Karakter akhir baris. Asli: `eol`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::write_csv()].
#'
#' @return `x`, secara tak terlihat, sama seperti [readr::write_csv()].
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tulis_csv()` memanggil [readr::write_csv()].
#'
#' @examples
#' df <- inp_tibble(x = 1:2, y = c("a", "b"))
#' berkas <- tempfile(fileext = ".csv")
#' inp_tulis_csv(df, berkas)
#' readLines(berkas)
#'
#' # Setara dengan kode standar:
#' readr::write_csv(df, berkas)
#' @export
inp_tulis_csv <- function(x, berkas, na, tambahkan, nama_kolom, kutip, escape,
                          akhir_baris, jumlah_utas, kemajuan, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("inp_tulis_csv", .panggilan, .lingkungan))
}

#' Tulis tabel ke berkas TSV
#'
#' Versi Bahasa Indonesia dari [readr::write_tsv()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Hasilnya dikembalikan secara tak terlihat, sama seperti fungsi
#' asli.
#'
#' @param x Tabel data yang ditulis. Sama dengan asli: `x`.
#' @param berkas Lokasi berkas tujuan. Asli: `file`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param tambahkan Apakah data ditambahkan ke berkas yang sudah ada. Asli:
#'   `append`.
#' @param nama_kolom Apakah nama kolom ikut ditulis. Asli: `col_names`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param escape Cara melepaskan karakter kutip: `"double"`, `"backslash"`,
#'   atau `"none"`. Sama dengan asli: `escape`.
#' @param akhir_baris Karakter akhir baris. Asli: `eol`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::write_tsv()].
#'
#' @return `x`, secara tak terlihat, sama seperti [readr::write_tsv()].
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tulis_tsv()` memanggil [readr::write_tsv()].
#'
#' @examples
#' df <- inp_tibble(x = 1:2, y = c("a", "b"))
#' berkas <- tempfile(fileext = ".tsv")
#' inp_tulis_tsv(df, berkas)
#' readLines(berkas)
#'
#' # Setara dengan kode standar:
#' readr::write_tsv(df, berkas)
#' @export
inp_tulis_tsv <- function(x, berkas, na, tambahkan, nama_kolom, kutip, escape,
                          akhir_baris, jumlah_utas, kemajuan, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("inp_tulis_tsv", .panggilan, .lingkungan))
}

#' Simpan objek R ke berkas RDS
#'
#' Versi Bahasa Indonesia dari [readr::write_rds()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Hasilnya dikembalikan secara tak terlihat, sama seperti fungsi
#' asli.
#'
#' @param x Objek R yang disimpan. Sama dengan asli: `x`.
#' @param berkas Lokasi berkas tujuan. Asli: `file`.
#' @param kompresi Metode kompresi. Asli: `compress`.
#' @param versi Versi format. Asli: `version`.
#' @param refhook Fungsi pengait referensi untuk serialisasi (lanjutan). Sama
#'   dengan asli: `refhook`.
#' @param teks Apakah data ditulis dalam bentuk teks ASCII. Asli: `text`.
#' @param ... Argumen lain, diteruskan apa adanya ke [readr::write_rds()].
#'
#' @return `x`, secara tak terlihat, sama seperti [readr::write_rds()].
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tulis_rds()` memanggil [readr::write_rds()].
#'
#' @examples
#' df <- inp_tibble(x = 1:3)
#' berkas <- tempfile(fileext = ".rds")
#' inp_tulis_rds(df, berkas)
#' imp_baca_rds(berkas)
#'
#' # Setara dengan kode standar:
#' readr::write_rds(df, berkas)
#' @export
inp_tulis_rds <- function(x, berkas, kompresi, versi, refhook, teks, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("inp_tulis_rds", .panggilan, .lingkungan))
}

#' Tulis tabel ke berkas Parquet
#'
#' Versi Bahasa Indonesia dari [arrow::write_parquet()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Fungsi ini memerlukan paket arrow, yang dipasang terpisah.
#'
#' @param x Tabel data yang ditulis. Sama dengan asli: `x`.
#' @param tujuan Lokasi berkas tujuan. Asli: `sink`.
#' @param ukuran_potongan Padanan argumen `chunk_size` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `chunk_size`.
#' @param versi Versi format. Asli: `version`.
#' @param kompresi Padanan argumen `compression` pada [arrow::write_parquet()];
#'   lihat dokumentasi fungsi asli. Asli: `compression`.
#' @param tingkat_kompresi Padanan argumen `compression_level` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `compression_level`.
#' @param pakai_kamus Padanan argumen `use_dictionary` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `use_dictionary`.
#' @param tulis_statistik Padanan argumen `write_statistics` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `write_statistics`.
#' @param ukuran_halaman_data Padanan argumen `data_page_size` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `data_page_size`.
#' @param pakai_stempel_waktu_int96 Padanan argumen
#'   `use_deprecated_int96_timestamps` pada [arrow::write_parquet()]; lihat
#'   dokumentasi fungsi asli. Asli: `use_deprecated_int96_timestamps`.
#' @param paksa_stempel_waktu Padanan argumen `coerce_timestamps` pada
#'   [arrow::write_parquet()]; lihat dokumentasi fungsi asli. Asli:
#'   `coerce_timestamps`.
#' @param izinkan_stempel_waktu_terpotong Padanan argumen
#'   `allow_truncated_timestamps` pada [arrow::write_parquet()]; lihat
#'   dokumentasi fungsi asli. Asli: `allow_truncated_timestamps`.
#' @param ... Argumen lain, diteruskan apa adanya ke [arrow::write_parquet()].
#'
#' @return `x`, secara tak terlihat, sama seperti [arrow::write_parquet()].
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tulis_parquet()` memanggil [arrow::write_parquet()]. Paket arrow tidak
#' otomatis terpasang; bila belum ada, fungsi ini memberi pesan yang
#' menjelaskan cara memasangnya.
#'
#' @examples
#' if (requireNamespace("arrow", quietly = TRUE)) {
#'   df <- inp_tibble(x = 1:3)
#'   berkas <- tempfile(fileext = ".parquet")
#'   inp_tulis_parquet(df, berkas)
#'
#'   # Setara dengan kode standar:
#'   arrow::write_parquet(df, berkas)
#' }
#' @export
inp_tulis_parquet <- function(x, tujuan, ukuran_potongan, versi, kompresi,
                              tingkat_kompresi, pakai_kamus, tulis_statistik,
                              ukuran_halaman_data, pakai_stempel_waktu_int96,
                              paksa_stempel_waktu,
                              izinkan_stempel_waktu_terpotong, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("inp_tulis_parquet", .panggilan, .lingkungan))
}

#' Buat tibble dari kolom
#'
#' Versi Bahasa Indonesia dari [tibble::tibble()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Kolom diberi nama oleh pengguna lewat `...`, dan kolom yang dibuat
#' belakangan boleh merujuk kolom sebelumnya, sama seperti fungsi asli.
#'
#' @param ... Kolom, ditulis `nama = nilai`. Nama kolom buatan Anda tidak
#'   pernah diterjemahkan.
#' @param .baris Jumlah baris. Asli: `.rows`.
#' @param .perbaikan_nama Cara memperbaiki nama kolom. Asli: `.name_repair`.
#'
#' @return Sebuah tibble.
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tibble()` memanggil [tibble::tibble()].
#'
#' @examples
#' inp_tibble(x = 1:3, y = x * 2)
#'
#' # Setara dengan kode standar:
#' tibble::tibble(x = 1:3, y = x * 2)
#' @export
inp_tibble <- function(..., .baris, .perbaikan_nama) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("inp_tibble", .panggilan, .lingkungan)
}

#' Buat tibble baris demi baris
#'
#' Versi Bahasa Indonesia dari [tibble::tribble()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Cocok untuk memasukkan data kecil secara manual: judul kolom ditulis
#' dengan `~`, lalu nilai diisi baris demi baris.
#'
#' @param ... Judul kolom (ditulis `~nama`) diikuti nilai-nilainya, baris demi
#'   baris.
#'
#' @return Sebuah tibble.
#'
#' @section Padanan dengan fungsi asli:
#' `inp_tribble()` memanggil [tibble::tribble()].
#'
#' @examples
#' inp_tribble(
#'   ~nama, ~nilai,
#'   "a", 1,
#'   "b", 2
#' )
#'
#' # Setara dengan kode standar:
#' tibble::tribble(
#'   ~nama, ~nilai,
#'   "a", 1,
#'   "b", 2
#' )
#' @export
inp_tribble <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("inp_tribble", .panggilan, .lingkungan)
}
