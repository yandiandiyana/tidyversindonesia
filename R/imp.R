# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Baca berkas CSV
#'
#' Versi Bahasa Indonesia dari [readr::read_csv()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Teks CSV langsung harus dibungkus `I()`, sama seperti fungsi asli
#' pada readr 2.2.0.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param id Nama kolom untuk menyimpan asal berkas. Sama dengan asli: `id`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param na_berkutip Apakah teks berkutip yang cocok dengan `na` dianggap
#'   hilang. Asli: `quoted_na`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param perbaikan_nama Cara memperbaiki nama kolom. Asli: `name_repair`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param tunda_baca Apakah berkas dibaca secara malas. Asli: `lazy`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_csv()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_csv()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_csv()` memanggil [readr::read_csv()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("nama,nilai", "a,1", "b,2"), berkas)
#' imp_baca_csv(berkas, tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_csv(berkas, show_col_types = FALSE)
#' @export
imp_baca_csv <- function(berkas, nama_kolom, tipe_kolom, pilih_kolom, id,
                         lokal, na, na_berkutip, kutip, komentar,
                         pangkas_spasi, lewati, maks_baris, maks_tebakan,
                         perbaikan_nama, jumlah_utas, kemajuan,
                         tampilkan_tipe_kolom, lewati_baris_kosong,
                         tunda_baca, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_csv", .panggilan, .lingkungan)
}

#' Baca berkas CSV bertitik koma
#'
#' Versi Bahasa Indonesia dari [readr::read_csv2()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Memakai titik koma sebagai pemisah kolom dan koma sebagai
#' pemisah desimal.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param id Nama kolom untuk menyimpan asal berkas. Sama dengan asli: `id`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param na_berkutip Apakah teks berkutip yang cocok dengan `na` dianggap
#'   hilang. Asli: `quoted_na`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param perbaikan_nama Cara memperbaiki nama kolom. Asli: `name_repair`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param tunda_baca Apakah berkas dibaca secara malas. Asli: `lazy`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_csv2()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_csv2()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_csv2()` memanggil [readr::read_csv2()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("nama;nilai", "a;1,5", "b;2,5"), berkas)
#' imp_baca_csv2(berkas, tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_csv2(berkas, show_col_types = FALSE)
#' @export
imp_baca_csv2 <- function(berkas, nama_kolom, tipe_kolom, pilih_kolom, id,
                          lokal, na, na_berkutip, kutip, komentar,
                          pangkas_spasi, lewati, maks_baris, maks_tebakan,
                          kemajuan, perbaikan_nama, jumlah_utas,
                          tampilkan_tipe_kolom, lewati_baris_kosong,
                          tunda_baca, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_csv2", .panggilan, .lingkungan)
}

#' Baca berkas TSV (dipisah tab)
#'
#' Versi Bahasa Indonesia dari [readr::read_tsv()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param id Nama kolom untuk menyimpan asal berkas. Sama dengan asli: `id`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param na_berkutip Apakah teks berkutip yang cocok dengan `na` dianggap
#'   hilang. Asli: `quoted_na`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param perbaikan_nama Cara memperbaiki nama kolom. Asli: `name_repair`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param tunda_baca Apakah berkas dibaca secara malas. Asli: `lazy`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_tsv()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_tsv()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_tsv()` memanggil [readr::read_tsv()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' tab <- intToUtf8(9)
#' writeLines(c(paste("nama", "nilai", sep = tab), paste("a", 1, sep = tab)), berkas)
#' imp_baca_tsv(berkas, tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_tsv(berkas, show_col_types = FALSE)
#' @export
imp_baca_tsv <- function(berkas, nama_kolom, tipe_kolom, pilih_kolom, id,
                         lokal, na, na_berkutip, kutip, komentar,
                         pangkas_spasi, lewati, maks_baris, maks_tebakan,
                         kemajuan, perbaikan_nama, jumlah_utas,
                         tampilkan_tipe_kolom, lewati_baris_kosong,
                         tunda_baca, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_tsv", .panggilan, .lingkungan)
}

#' Baca berkas dengan pemisah bebas
#'
#' Versi Bahasa Indonesia dari [readr::read_delim()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param pembatas Pemisah antarkolom (satu karakter). Asli: `delim`.
#' @param kutip Karakter kutip. Asli: `quote`.
#' @param escape_garis_miring Apakah garis miring terbalik dipakai untuk
#'   melepaskan karakter khusus. Asli: `escape_backslash`.
#' @param escape_ganda Apakah kutip ganda dilepaskan dengan menggandakannya.
#'   Asli: `escape_double`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param id Nama kolom untuk menyimpan asal berkas. Sama dengan asli: `id`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param na_berkutip Apakah teks berkutip yang cocok dengan `na` dianggap
#'   hilang. Asli: `quoted_na`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param perbaikan_nama Cara memperbaiki nama kolom. Asli: `name_repair`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param tunda_baca Apakah berkas dibaca secara malas. Asli: `lazy`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_delim()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_delim()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_delim()` memanggil [readr::read_delim()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("nama|nilai", "a|1", "b|2"), berkas)
#' imp_baca_delim(berkas, pembatas = "|", tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_delim(berkas, delim = "|", show_col_types = FALSE)
#' @export
imp_baca_delim <- function(berkas, pembatas, kutip, escape_garis_miring,
                           escape_ganda, nama_kolom, tipe_kolom, pilih_kolom,
                           id, lokal, na, na_berkutip, komentar,
                           pangkas_spasi, lewati, maks_baris, maks_tebakan,
                           perbaikan_nama, jumlah_utas, kemajuan,
                           tampilkan_tipe_kolom, lewati_baris_kosong,
                           tunda_baca, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_delim", .panggilan, .lingkungan)
}

#' Baca berkas berkolom lebar tetap
#'
#' Versi Bahasa Indonesia dari [readr::read_fwf()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param posisi_kolom Posisi kolom, dibuat dengan [imp_lebar_kolom()] atau
#'   [imp_posisi_kolom()]. Asli: `col_positions`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param id Nama kolom untuk menyimpan asal berkas. Sama dengan asli: `id`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param perbaikan_nama Cara memperbaiki nama kolom. Asli: `name_repair`.
#' @param jumlah_utas Jumlah utas untuk membaca. Asli: `num_threads`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param tunda_baca Apakah berkas dibaca secara malas. Asli: `lazy`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_fwf()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_fwf()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_lebar_tetap()` memanggil [readr::read_fwf()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("a110", "b220"), berkas)
#' imp_baca_lebar_tetap(
#'   berkas,
#'   posisi_kolom = imp_lebar_kolom(c(2, 2), c("kode", "nilai")),
#'   tampilkan_tipe_kolom = FALSE
#' )
#'
#' # Setara dengan kode standar:
#' readr::read_fwf(
#'   berkas,
#'   col_positions = readr::fwf_widths(c(2, 2), c("kode", "nilai")),
#'   show_col_types = FALSE
#' )
#' @export
imp_baca_lebar_tetap <- function(berkas, posisi_kolom, tipe_kolom,
                                 pilih_kolom, id, lokal, na, komentar,
                                 pangkas_spasi, lewati, maks_baris,
                                 maks_tebakan, kemajuan, perbaikan_nama,
                                 jumlah_utas, tampilkan_tipe_kolom,
                                 tunda_baca, lewati_baris_kosong, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_lebar_tetap", .panggilan, .lingkungan)
}

#' Baca tabel yang dipisah spasi
#'
#' Versi Bahasa Indonesia dari [readr::read_table()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param maks_tebakan Jumlah baris yang dipakai untuk menebak tipe kolom.
#'   Asli: `guess_max`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param komentar Awalan baris komentar yang diabaikan. Asli: `comment`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param lewati_baris_kosong Apakah baris kosong dilewati. Asli:
#'   `skip_empty_rows`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_table()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_table()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_tabel()` memanggil [readr::read_table()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("nama nilai", "a 1", "b 2"), berkas)
#' imp_baca_tabel(berkas, tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_table(berkas, show_col_types = FALSE)
#' @export
imp_baca_tabel <- function(berkas, nama_kolom, tipe_kolom, lokal, na, lewati,
                           maks_baris, maks_tebakan, kemajuan, komentar,
                           tampilkan_tipe_kolom, lewati_baris_kosong, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_tabel", .panggilan, .lingkungan)
}

#' Baca berkas log web
#'
#' Versi Bahasa Indonesia dari [readr::read_log()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param berkas Lokasi berkas, URL, atau teks langsung yang dibungkus `I()`.
#'   Asli: `file`.
#' @param nama_kolom Apakah baris pertama berisi nama kolom (`TRUE`), tidak ada
#'   (`FALSE`), atau vektor nama kolom. Asli: `col_names`.
#' @param tipe_kolom Spesifikasi tipe kolom, misalnya dari [imp_kolom()]. Asli:
#'   `col_types`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param lewati Jumlah baris yang dilewati di awal. Asli: `skip`.
#' @param maks_baris Jumlah baris maksimum yang dibaca. Asli: `n_max`.
#' @param tampilkan_tipe_kolom Apakah tipe kolom hasil tebakan ditampilkan.
#'   Asli: `show_col_types`.
#' @param kemajuan Apakah bilah kemajuan ditampilkan. Asli: `progress`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_log()].
#'
#' @return Sebuah tibble, sama seperti [readr::read_log()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_log()` memanggil [readr::read_log()].
#'
#' @examples
#' berkas <- readr::readr_example("example.log")
#' imp_baca_log(berkas, tampilkan_tipe_kolom = FALSE)
#'
#' # Setara dengan kode standar:
#' readr::read_log(berkas, show_col_types = FALSE)
#' @export
imp_baca_log <- function(berkas, nama_kolom, tipe_kolom, pangkas_spasi,
                         lewati, maks_baris, tampilkan_tipe_kolom, kemajuan,
                         ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_log", .panggilan, .lingkungan)
}

#' Baca objek R dari berkas RDS
#'
#' Versi Bahasa Indonesia dari [readr::read_rds()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param berkas Lokasi berkas RDS. Asli: `file`.
#' @param refhook Fungsi pengait referensi untuk serialisasi (lanjutan). Sama
#'   dengan asli: `refhook`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::read_rds()].
#'
#' @return Objek R yang tersimpan, sama seperti [readr::read_rds()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_rds()` memanggil [readr::read_rds()].
#'
#' @examples
#' df <- inp_tibble(x = 1:3)
#' berkas <- tempfile(fileext = ".rds")
#' saveRDS(df, berkas)
#' imp_baca_rds(berkas)
#'
#' # Setara dengan kode standar:
#' readr::read_rds(berkas)
#' @export
imp_baca_rds <- function(berkas, refhook, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_rds", .panggilan, .lingkungan)
}

#' Baca berkas Parquet
#'
#' Versi Bahasa Indonesia dari [arrow::read_parquet()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Fungsi ini memerlukan paket arrow, yang dipasang terpisah.
#'
#' @param berkas Lokasi berkas Parquet. Asli: `file`.
#' @param pilih_kolom Kolom yang dipilih saat membaca. Asli: `col_select`.
#' @param sebagai_data_frame Apakah hasil berupa data frame (tibble). Asli:
#'   `as_data_frame`.
#' @param props Properti pembacaan lanjutan. Sama dengan asli: `props`.
#' @param mmap Apakah berkas dipetakan ke memori. Sama dengan asli: `mmap`.
#' @param ... Argumen lain, diteruskan apa adanya ke [arrow::read_parquet()].
#'
#' @return Sebuah tibble, sama seperti [arrow::read_parquet()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_baca_parquet()` memanggil [arrow::read_parquet()]. Paket arrow tidak
#' otomatis terpasang; bila belum ada, fungsi ini memberi pesan yang
#' menjelaskan cara memasangnya.
#'
#' @examples
#' if (requireNamespace("arrow", quietly = TRUE)) {
#'   berkas <- tempfile(fileext = ".parquet")
#'   inp_tulis_parquet(inp_tibble(x = 1:3), berkas)
#'   imp_baca_parquet(berkas)
#'
#'   # Setara dengan kode standar:
#'   arrow::read_parquet(berkas)
#' }
#' @export
imp_baca_parquet <- function(berkas, pilih_kolom, sebagai_data_frame, props,
                             mmap, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_baca_parquet", .panggilan, .lingkungan)
}

#' Tentukan kolom lebar tetap menurut lebarnya
#'
#' Versi Bahasa Indonesia dari [readr::fwf_widths()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Dipakai pada argumen `posisi_kolom` di
#' [imp_baca_lebar_tetap()].
#'
#' @param lebar Vektor lebar tiap kolom. Asli: `widths`.
#' @param nama_kolom Vektor nama kolom. Asli: `col_names`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::fwf_widths()].
#'
#' @return Posisi kolom, sama seperti [readr::fwf_widths()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_lebar_kolom()` memanggil [readr::fwf_widths()].
#'
#' @examples
#' imp_lebar_kolom(c(2, 2), c("kode", "nilai"))
#'
#' # Setara dengan kode standar:
#' readr::fwf_widths(c(2, 2), c("kode", "nilai"))
#' @export
imp_lebar_kolom <- function(lebar, nama_kolom, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_lebar_kolom", .panggilan, .lingkungan)
}

#' Tentukan kolom lebar tetap menurut posisinya
#'
#' Versi Bahasa Indonesia dari [readr::fwf_positions()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Dipakai pada argumen `posisi_kolom` di
#' [imp_baca_lebar_tetap()].
#'
#' @param mulai Posisi awal tiap kolom. Asli: `start`.
#' @param akhir Posisi akhir tiap kolom. Asli: `end`.
#' @param nama_kolom Vektor nama kolom. Asli: `col_names`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::fwf_positions()].
#'
#' @return Posisi kolom, sama seperti [readr::fwf_positions()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_posisi_kolom()` memanggil [readr::fwf_positions()].
#'
#' @examples
#' imp_posisi_kolom(c(1, 3), c(2, 4), c("kode", "nilai"))
#'
#' # Setara dengan kode standar:
#' readr::fwf_positions(c(1, 3), c(2, 4), c("kode", "nilai"))
#' @export
imp_posisi_kolom <- function(mulai, akhir, nama_kolom, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_posisi_kolom", .panggilan, .lingkungan)
}

#' Lihat masalah pembacaan data
#'
#' Versi Bahasa Indonesia dari [readr::problems()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Hasil pembacaan (tibble) yang diperiksa. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::problems()].
#'
#' @return Sebuah tibble berisi masalah pembacaan, sama seperti
#'   [readr::problems()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_masalah()` memanggil [readr::problems()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("a", "1", "dua"), berkas)
#' hasil <- suppressWarnings(imp_baca_csv(
#'   berkas,
#'   tipe_kolom = imp_kolom(a = imp_kolom_bulat()),
#'   tampilkan_tipe_kolom = FALSE
#' ))
#' imp_masalah(hasil)
#'
#' # Setara dengan kode standar:
#' readr::problems(hasil)
#' @export
imp_masalah <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_masalah", .panggilan, .lingkungan)
}

#' Lihat spesifikasi tipe kolom hasil pembacaan
#'
#' Versi Bahasa Indonesia dari [readr::spec()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Hasil pembacaan (tibble) yang diperiksa. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::spec()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::spec()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_spesifikasi()` memanggil [readr::spec()].
#'
#' @examples
#' berkas <- tempfile(fileext = ".csv")
#' writeLines(c("nama,nilai", "a,1", "b,2"), berkas)
#' hasil <- imp_baca_csv(berkas, tampilkan_tipe_kolom = FALSE)
#' imp_spesifikasi(hasil)
#'
#' # Setara dengan kode standar:
#' readr::spec(hasil)
#' @export
imp_spesifikasi <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_spesifikasi", .panggilan, .lingkungan)
}

#' Susun spesifikasi tipe kolom
#'
#' Versi Bahasa Indonesia dari [readr::cols()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Nama kolom yang Anda tulis di `...` tidak pernah diterjemahkan.
#'
#' @param ... Tipe kolom, ditulis `nama_kolom = imp_kolom_*()`.
#' @param .bawaan Tipe kolom bawaan untuk kolom yang tidak disebut. Asli:
#'   `.default`.
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::cols()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom()` memanggil [readr::cols()].
#'
#' @examples
#' imp_kolom(nilai = imp_kolom_desimal(), .bawaan = imp_kolom_teks())
#'
#' # Setara dengan kode standar:
#' readr::cols(nilai = readr::col_double(), .default = readr::col_character())
#' @export
imp_kolom <- function(..., .bawaan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom", .panggilan, .lingkungan)
}

#' Baca hanya kolom yang disebutkan
#'
#' Versi Bahasa Indonesia dari [readr::cols_only()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tipe kolom yang dibaca, ditulis `nama_kolom = imp_kolom_*()`.
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::cols_only()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_saja()` memanggil [readr::cols_only()].
#'
#' @examples
#' imp_kolom_saja(nilai = imp_kolom_desimal())
#'
#' # Setara dengan kode standar:
#' readr::cols_only(nilai = readr::col_double())
#' @export
imp_kolom_saja <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_saja", .panggilan, .lingkungan)
}

#' Tipe kolom logika
#'
#' Versi Bahasa Indonesia dari [readr::col_logical()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_logical()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_logical()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_logika()` memanggil [readr::col_logical()].
#'
#' @examples
#' imp_kolom_logika()
#'
#' # Setara dengan kode standar:
#' readr::col_logical()
#' @export
imp_kolom_logika <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_logika", .panggilan, .lingkungan)
}

#' Tipe kolom bilangan desimal
#'
#' Versi Bahasa Indonesia dari [readr::col_double()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_double()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_double()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_desimal()` memanggil [readr::col_double()].
#'
#' @examples
#' imp_kolom_desimal()
#'
#' # Setara dengan kode standar:
#' readr::col_double()
#' @export
imp_kolom_desimal <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_desimal", .panggilan, .lingkungan)
}

#' Tipe kolom bilangan bulat
#'
#' Versi Bahasa Indonesia dari [readr::col_integer()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_integer()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_integer()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_bulat()` memanggil [readr::col_integer()].
#'
#' @examples
#' imp_kolom_bulat()
#'
#' # Setara dengan kode standar:
#' readr::col_integer()
#' @export
imp_kolom_bulat <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_bulat", .panggilan, .lingkungan)
}

#' Tipe kolom teks
#'
#' Versi Bahasa Indonesia dari [readr::col_character()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_character()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti
#'   [readr::col_character()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_teks()` memanggil [readr::col_character()].
#'
#' @examples
#' imp_kolom_teks()
#'
#' # Setara dengan kode standar:
#' readr::col_character()
#' @export
imp_kolom_teks <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_teks", .panggilan, .lingkungan)
}

#' Tipe kolom faktor
#'
#' Versi Bahasa Indonesia dari [readr::col_factor()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param level Vektor teks berisi level; bila kosong, diambil dari data. Asli:
#'   `levels`.
#' @param berurut Apakah hasil berupa faktor berurutan. Asli: `ordered`.
#' @param sertakan_na Apakah `NA` dijadikan level. Asli: `include_na`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_factor()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_factor()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_faktor()` memanggil [readr::col_factor()].
#'
#' @examples
#' imp_kolom_faktor(level = c("a", "b"))
#'
#' # Setara dengan kode standar:
#' readr::col_factor(levels = c("a", "b"))
#' @export
imp_kolom_faktor <- function(level, berurut, sertakan_na, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_faktor", .panggilan, .lingkungan)
}

#' Tipe kolom tanggal
#'
#' Versi Bahasa Indonesia dari [readr::col_date()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param format Format tanggal atau waktu. Sama dengan asli: `format`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_date()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_date()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_tanggal()` memanggil [readr::col_date()].
#'
#' @examples
#' imp_kolom_tanggal(format = "%d/%m/%Y")
#'
#' # Setara dengan kode standar:
#' readr::col_date(format = "%d/%m/%Y")
#' @export
imp_kolom_tanggal <- function(format, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_tanggal", .panggilan, .lingkungan)
}

#' Tipe kolom tanggal dan waktu
#'
#' Versi Bahasa Indonesia dari [readr::col_datetime()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param format Format tanggal atau waktu. Sama dengan asli: `format`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_datetime()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti
#'   [readr::col_datetime()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_waktu()` memanggil [readr::col_datetime()].
#'
#' @examples
#' imp_kolom_waktu()
#'
#' # Setara dengan kode standar:
#' readr::col_datetime()
#' @export
imp_kolom_waktu <- function(format, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_waktu", .panggilan, .lingkungan)
}

#' Tipe kolom angka yang fleksibel
#'
#' Versi Bahasa Indonesia dari [readr::col_number()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Mengabaikan karakter bukan angka di sekitar angka, misalnya
#' tanda mata uang.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_number()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_number()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_angka()` memanggil [readr::col_number()].
#'
#' @examples
#' imp_kolom_angka()
#'
#' # Setara dengan kode standar:
#' readr::col_number()
#' @export
imp_kolom_angka <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_angka", .panggilan, .lingkungan)
}

#' Lewati kolom
#'
#' Versi Bahasa Indonesia dari [readr::col_skip()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::col_skip()].
#'
#' @return Sebuah spesifikasi tipe kolom, sama seperti [readr::col_skip()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_kolom_lewati()` memanggil [readr::col_skip()].
#'
#' @examples
#' imp_kolom_lewati()
#'
#' # Setara dengan kode standar:
#' readr::col_skip()
#' @export
imp_kolom_lewati <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_kolom_lewati", .panggilan, .lingkungan)
}

#' Urai angka dari teks
#'
#' Versi Bahasa Indonesia dari [readr::parse_number()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Mengabaikan karakter bukan angka di sekitar angka, misalnya
#' tanda mata uang atau persen.
#'
#' @param x Vektor teks. Sama dengan asli: `x`.
#' @param na Teks yang dianggap nilai hilang. Sama dengan asli: `na`.
#' @param lokal Pengaturan lokal, seperti pemisah desimal dan format tanggal.
#'   Asli: `locale`.
#' @param pangkas_spasi Apakah spasi di awal dan akhir nilai dibuang. Asli:
#'   `trim_ws`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [readr::parse_number()].
#'
#' @return Vektor angka, sama seperti [readr::parse_number()].
#'
#' @section Padanan dengan fungsi asli:
#' `imp_urai_angka()` memanggil [readr::parse_number()].
#'
#' @examples
#' imp_urai_angka(c("$1,234", "5%"))
#'
#' # Setara dengan kode standar:
#' readr::parse_number(c("$1,234", "5%"))
#' @export
imp_urai_angka <- function(x, na, lokal, pangkas_spasi, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("imp_urai_angka", .panggilan, .lingkungan)
}
