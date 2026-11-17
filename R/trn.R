# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Saring baris
#'
#' Versi Bahasa Indonesia dari [dplyr::filter()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. "Filter" adalah kata bahasa Indonesia, sehingga nama fungsi hanya
#' mendapat awalan `trn_`.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kondisi penyaringan, ditulis seperti pada [dplyr::filter()].
#' @param .berdasarkan Pengelompokan sementara untuk operasi ini; tidak
#'   mengubah struktur kelompok tabel. Asli: `.by`.
#' @param .pertahankan Apakah struktur kelompok dipertahankan. Asli:
#'   `.preserve`.
#'
#' @return Tabel data hasil penyaringan, sama seperti [dplyr::filter()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_filter()` memanggil [dplyr::filter()].
#'
#' @examples
#' df <- inp_tibble(x = 1:6, g = rep(c("a", "b"), 3))
#' trn_filter(df, x > 2)
#' trn_filter(df, x == max(x), .berdasarkan = g)
#'
#' # Setara dengan kode standar:
#' dplyr::filter(df, x == max(x), .by = g)
#' @export
trn_filter <- function(.data, ..., .berdasarkan, .pertahankan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_filter", .panggilan, .lingkungan)
}

#' Urutkan baris
#'
#' Versi Bahasa Indonesia dari [dplyr::arrange()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Untuk urutan menurun, bungkus kolom dengan [frm_turun()].
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kolom pengurut, ditulis seperti pada [dplyr::arrange()].
#' @param .per_kelompok Apakah pengurutan dilakukan di dalam kelompok. Asli:
#'   `.by_group`.
#'
#' @return Tabel data yang barisnya terurut, sama seperti [dplyr::arrange()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_urutkan()` memanggil [dplyr::arrange()].
#'
#' @examples
#' df <- inp_tibble(x = c(3, 1, 2), g = c("a", "b", "a"))
#' trn_urutkan(df, x)
#' trn_urutkan(df, frm_turun(x))
#'
#' # Setara dengan kode standar:
#' dplyr::arrange(df, dplyr::desc(x))
#' @export
trn_urutkan <- function(.data, ..., .per_kelompok) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_urutkan", .panggilan, .lingkungan)
}

#' Ambil baris unik
#'
#' Versi Bahasa Indonesia dari [dplyr::distinct()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kolom yang dipakai untuk menentukan keunikan, ditulis seperti
#'   pada [dplyr::distinct()].
#' @param .simpan_semua Apakah semua kolom lain dipertahankan. Asli:
#'   `.keep_all`.
#'
#' @return Tabel data berisi baris unik, sama seperti [dplyr::distinct()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_unik()` memanggil [dplyr::distinct()].
#'
#' @examples
#' df <- inp_tibble(g = c("a", "b", "a"), x = 1:3)
#' trn_unik(df, g)
#' trn_unik(df, g, .simpan_semua = TRUE)
#'
#' # Setara dengan kode standar:
#' dplyr::distinct(df, g, .keep_all = TRUE)
#' @export
trn_unik <- function(.data, ..., .simpan_semua) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_unik", .panggilan, .lingkungan)
}

#' Hitung baris per kelompok
#'
#' Versi Bahasa Indonesia dari [dplyr::count()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Argumen `nama`, `urut`, dan `bobot` bersifat khusus. Karena `...`
#' dapat memuat kolom buatan, menulis `nama = ...` berarti mengisi argumen
#' `nama`, sama seperti `name = ...` pada fungsi asli.
#'
#' @param x Tabel data. Sama dengan asli: `x`.
#' @param ... Variabel pengelompok, ditulis seperti pada [dplyr::count()].
#' @param bobot Bobot; bila diberikan, yang dijumlahkan adalah bobot, bukan
#'   jumlah baris. Asli: `wt`.
#' @param urut Apakah hasil diurutkan menurun menurut jumlah. Asli: `sort`.
#' @param nama Nama kolom hasil. Asli: `name`.
#'
#' @return Tabel data berisi jumlah per kelompok, sama seperti
#'   [dplyr::count()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_hitung()` memanggil [dplyr::count()].
#'
#' @examples
#' df <- inp_tibble(g = c("a", "b", "a"), x = 1:3)
#' trn_hitung(df, g)
#' trn_hitung(df, g, urut = TRUE, nama = "banyak")
#'
#' # Setara dengan kode standar:
#' dplyr::count(df, g, sort = TRUE, name = "banyak")
#' @export
trn_hitung <- function(x, ..., bobot, urut, nama) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_hitung", .panggilan, .lingkungan)
}

#' Tambah atau ubah kolom
#'
#' Versi Bahasa Indonesia dari [dplyr::mutate()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. "Mutasi" untuk *mutate*. Generik `dplyr::mutate()` hanya berformal
#' `(.data, ...)`; `.by`, `.keep`, `.before`, dan `.after` adalah formal
#' metodenya dan diteruskan lewat `...`.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kolom baru atau yang diubah, ditulis `nama = ekspresi`. Nama
#'   kolom buatan Anda tidak pernah diterjemahkan.
#' @param .berdasarkan Pengelompokan sementara untuk operasi ini; tidak
#'   mengubah struktur kelompok tabel. Asli: `.by`.
#' @param .simpan Kolom yang dipertahankan: `"all"`, `"used"`, `"unused"`, atau
#'   `"none"`. Asli: `.keep`.
#' @param .sebelum Kolom yang menjadi patokan; hasil diletakkan sebelum kolom
#'   ini. Asli: `.before`.
#' @param .setelah Kolom yang menjadi patokan; hasil diletakkan setelah kolom
#'   ini. Asli: `.after`.
#'
#' @return Tabel data, sama seperti [dplyr::mutate()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_mutasi()` memanggil [dplyr::mutate()].
#'
#' @examples
#' df <- inp_tibble(x = 1:3, g = c("a", "b", "a"))
#' trn_mutasi(df, y = x * 2, .setelah = x)
#'
#' # Setara dengan kode standar:
#' dplyr::mutate(df, y = x * 2, .after = x)
#' @export
trn_mutasi <- function(.data, ..., .berdasarkan, .simpan, .sebelum, .setelah) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_mutasi", .panggilan, .lingkungan)
}

#' Pilih kolom
#'
#' Versi Bahasa Indonesia dari [dplyr::select()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kolom yang dipilih. Dapat memakai pembantu `frm_` seperti
#'   [frm_diawali()].
#'
#' @return Tabel data berisi kolom terpilih, sama seperti [dplyr::select()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_pilih()` memanggil [dplyr::select()].
#'
#' @examples
#' df <- inp_tibble(x = 1:2, y = 3:4, z = 5:6)
#' trn_pilih(df, x, z)
#' trn_pilih(df, !y)
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, x, z)
#' @export
trn_pilih <- function(.data, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_pilih", .panggilan, .lingkungan)
}

#' Ubah nama kolom
#'
#' Versi Bahasa Indonesia dari [dplyr::rename()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Pasangan `nama_baru = nama_lama`.
#'
#' @return Tabel data dengan nama kolom baru, sama seperti [dplyr::rename()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_ubah_nama()` memanggil [dplyr::rename()].
#'
#' @examples
#' df <- inp_tibble(x = 1:2, y = 3:4)
#' trn_ubah_nama(df, baru = x)
#'
#' # Setara dengan kode standar:
#' dplyr::rename(df, baru = x)
#' @export
trn_ubah_nama <- function(.data, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_ubah_nama", .panggilan, .lingkungan)
}

#' Pindahkan kolom
#'
#' Versi Bahasa Indonesia dari [dplyr::relocate()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Kolom yang dipindahkan.
#' @param .sebelum Kolom yang menjadi patokan; hasil diletakkan sebelum kolom
#'   ini. Asli: `.before`.
#' @param .setelah Kolom yang menjadi patokan; hasil diletakkan setelah kolom
#'   ini. Asli: `.after`.
#'
#' @return Tabel data dengan urutan kolom baru, sama seperti
#'   [dplyr::relocate()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_pindah()` memanggil [dplyr::relocate()].
#'
#' @examples
#' df <- inp_tibble(x = 1:2, y = 3:4, z = 5:6)
#' trn_pindah(df, z, .sebelum = x)
#'
#' # Setara dengan kode standar:
#' dplyr::relocate(df, z, .before = x)
#' @export
trn_pindah <- function(.data, ..., .sebelum, .setelah) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_pindah", .panggilan, .lingkungan)
}

#' Tarik satu kolom menjadi vektor
#'
#' Versi Bahasa Indonesia dari [dplyr::pull()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param variabel Kolom yang diambil, berupa nama atau posisi. Asli: `var`.
#' @param nama Kolom yang dipakai sebagai nama elemen vektor hasil. Asli:
#'   `name`.
#' @param ... Argumen lain, diteruskan apa adanya ke [dplyr::pull()].
#'
#' @return Sebuah vektor, sama seperti [dplyr::pull()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_tarik()` memanggil [dplyr::pull()].
#'
#' @examples
#' df <- inp_tibble(x = 1:3, g = c("a", "b", "c"))
#' trn_tarik(df, x)
#' trn_tarik(df, x, nama = g)
#'
#' # Setara dengan kode standar:
#' dplyr::pull(df, x, name = g)
#' @export
trn_tarik <- function(.data, variabel, nama, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_tarik", .panggilan, .lingkungan)
}

#' Kelompokkan baris
#'
#' Versi Bahasa Indonesia dari [dplyr::group_by()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Variabel pengelompok.
#' @param .tambah Apakah kelompok ditambahkan ke kelompok yang sudah ada. Asli:
#'   `.add`.
#' @param .buang_kosong Apakah kelompok kosong dibuang. Asli: `.drop`.
#'
#' @return Tabel data berkelompok, sama seperti [dplyr::group_by()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_gabung_kelompok()` memanggil [dplyr::group_by()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_gabung_kelompok(df, g)
#'
#' # Setara dengan kode standar:
#' dplyr::group_by(df, g)
#' @export
trn_gabung_kelompok <- function(.data, ..., .tambah, .buang_kosong) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_gabung_kelompok", .panggilan, .lingkungan)
}

#' Lepaskan pengelompokan
#'
#' Versi Bahasa Indonesia dari [dplyr::ungroup()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Tabel data berkelompok. Sama dengan asli: `x`.
#' @param ... Variabel yang dilepas dari pengelompokan; bila kosong, semua
#'   dilepas.
#'
#' @return Tabel data tanpa pengelompokan, sama seperti [dplyr::ungroup()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_lepas_kelompok()` memanggil [dplyr::ungroup()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' df |> trn_gabung_kelompok(g) |> trn_lepas_kelompok()
#'
#' # Setara dengan kode standar:
#' dplyr::ungroup(dplyr::group_by(df, g))
#' @export
trn_lepas_kelompok <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_lepas_kelompok", .panggilan, .lingkungan)
}

#' Hitung statistik ringkas
#'
#' Versi Bahasa Indonesia dari [dplyr::summarise()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Juga dikenal sebagai `summarize()`.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Ringkasan, ditulis `nama = ekspresi`. Nama kolom buatan Anda
#'   tidak pernah diterjemahkan.
#' @param .berdasarkan Pengelompokan sementara untuk operasi ini; tidak
#'   mengubah struktur kelompok tabel. Asli: `.by`.
#' @param .hasil_kelompok Struktur kelompok pada hasil. Asli: `.groups`.
#'
#' @return Tabel data, sama seperti [dplyr::summarise()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_statistik_ringkas()` memanggil [dplyr::summarise()].
#'
#' @examples
#' df <- inp_tibble(x = c(1, 2, 3, 4), g = c("a", "a", "b", "b"))
#' df |>
#'   trn_gabung_kelompok(g) |>
#'   trn_statistik_ringkas(rerata = dsr_rerata(x))
#'
#' # Setara dengan kode standar:
#' df |>
#'   dplyr::group_by(g) |>
#'   dplyr::summarise(rerata = mean(x))
#' @export
trn_statistik_ringkas <- function(.data, ..., .berdasarkan, .hasil_kelompok) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_statistik_ringkas", .panggilan, .lingkungan)
}

#' Ambil baris menurut posisi
#'
#' Versi Bahasa Indonesia dari [dplyr::slice()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. "Iris" untuk *slice*.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Posisi baris yang diambil.
#' @param .berdasarkan Pengelompokan sementara untuk operasi ini; tidak
#'   mengubah struktur kelompok tabel. Asli: `.by`.
#' @param .pertahankan Apakah struktur kelompok dipertahankan. Asli:
#'   `.preserve`.
#'
#' @return Tabel data, sama seperti [dplyr::slice()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris()` memanggil [dplyr::slice()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_iris(df, 1:2)
#' trn_iris(df, 1, .berdasarkan = g)
#'
#' # Setara dengan kode standar:
#' dplyr::slice(df, 1, .by = g)
#' @export
trn_iris <- function(.data, ..., .berdasarkan, .pertahankan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris", .panggilan, .lingkungan)
}

#' Ambil baris pertama
#'
#' Versi Bahasa Indonesia dari [dplyr::slice_head()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Tidak dipakai; harus kosong.
#' @param n Jumlah baris. Sama dengan asli: `n`.
#' @param proporsi Proporsi baris, antara 0 dan 1. Asli: `prop`.
#' @param berdasarkan Pengelompokan sementara untuk operasi ini. Asli: `by`.
#'
#' @return Tabel data, sama seperti [dplyr::slice_head()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris_kepala()` memanggil [dplyr::slice_head()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_iris_kepala(df, n = 2)
#' trn_iris_kepala(df, n = 1, berdasarkan = g)
#'
#' # Setara dengan kode standar:
#' dplyr::slice_head(df, n = 1, by = g)
#' @export
trn_iris_kepala <- function(.data, ..., n, proporsi, berdasarkan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris_kepala", .panggilan, .lingkungan)
}

#' Ambil baris terakhir
#'
#' Versi Bahasa Indonesia dari [dplyr::slice_tail()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Tidak dipakai; harus kosong.
#' @param n Jumlah baris. Sama dengan asli: `n`.
#' @param proporsi Proporsi baris, antara 0 dan 1. Asli: `prop`.
#' @param berdasarkan Pengelompokan sementara untuk operasi ini. Asli: `by`.
#'
#' @return Tabel data, sama seperti [dplyr::slice_tail()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris_ekor()` memanggil [dplyr::slice_tail()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_iris_ekor(df, n = 2)
#' trn_iris_ekor(df, n = 1, berdasarkan = g)
#'
#' # Setara dengan kode standar:
#' dplyr::slice_tail(df, n = 1, by = g)
#' @export
trn_iris_ekor <- function(.data, ..., n, proporsi, berdasarkan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris_ekor", .panggilan, .lingkungan)
}

#' Ambil baris dengan nilai terkecil
#'
#' Versi Bahasa Indonesia dari [dplyr::slice_min()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param urutan_oleh Variabel yang dipakai untuk mengurutkan. Asli:
#'   `order_by`.
#' @param ... Tidak dipakai; harus kosong.
#' @param n Jumlah baris. Sama dengan asli: `n`.
#' @param proporsi Proporsi baris, antara 0 dan 1. Asli: `prop`.
#' @param berdasarkan Pengelompokan sementara untuk operasi ini. Asli: `by`.
#' @param dengan_seri Apakah baris dengan nilai seri ikut disertakan. Asli:
#'   `with_ties`.
#' @param buang_na Apakah nilai hilang diabaikan. Asli: `na_rm`.
#'
#' @return Tabel data, sama seperti [dplyr::slice_min()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris_min()` memanggil [dplyr::slice_min()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_iris_min(df, x, n = 2)
#'
#' # Setara dengan kode standar:
#' dplyr::slice_min(df, x, n = 2)
#' @export
trn_iris_min <- function(.data, urutan_oleh, ..., n, proporsi, berdasarkan,
                         dengan_seri, buang_na) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris_min", .panggilan, .lingkungan)
}

#' Ambil baris dengan nilai terbesar
#'
#' Versi Bahasa Indonesia dari [dplyr::slice_max()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param urutan_oleh Variabel yang dipakai untuk mengurutkan. Asli:
#'   `order_by`.
#' @param ... Tidak dipakai; harus kosong.
#' @param n Jumlah baris. Sama dengan asli: `n`.
#' @param proporsi Proporsi baris, antara 0 dan 1. Asli: `prop`.
#' @param berdasarkan Pengelompokan sementara untuk operasi ini. Asli: `by`.
#' @param dengan_seri Apakah baris dengan nilai seri ikut disertakan. Asli:
#'   `with_ties`.
#' @param buang_na Apakah nilai hilang diabaikan. Asli: `na_rm`.
#'
#' @return Tabel data, sama seperti [dplyr::slice_max()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris_maks()` memanggil [dplyr::slice_max()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' trn_iris_maks(df, x, n = 2)
#'
#' # Setara dengan kode standar:
#' dplyr::slice_max(df, x, n = 2)
#' @export
trn_iris_maks <- function(.data, urutan_oleh, ..., n, proporsi, berdasarkan,
                          dengan_seri, buang_na) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris_maks", .panggilan, .lingkungan)
}

#' Ambil baris secara acak
#'
#' Versi Bahasa Indonesia dari [dplyr::slice_sample()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param .data Tabel data. Sama dengan asli: `.data`.
#' @param ... Tidak dipakai; harus kosong.
#' @param n Jumlah baris. Sama dengan asli: `n`.
#' @param proporsi Proporsi baris, antara 0 dan 1. Asli: `prop`.
#' @param berdasarkan Pengelompokan sementara untuk operasi ini. Asli: `by`.
#' @param bobot_oleh Bobot peluang pengambilan sampel. Asli: `weight_by`.
#' @param dengan_pengembalian Apakah sampel diambil dengan pengembalian. Asli:
#'   `replace`.
#'
#' @return Tabel data, sama seperti [dplyr::slice_sample()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_iris_acak()` memanggil [dplyr::slice_sample()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' set.seed(1)
#' trn_iris_acak(df, n = 2)
#'
#' # Setara dengan kode standar:
#' set.seed(1)
#' dplyr::slice_sample(df, n = 2)
#' @export
trn_iris_acak <- function(.data, ..., n, proporsi, berdasarkan, bobot_oleh,
                          dengan_pengembalian) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_iris_acak", .panggilan, .lingkungan)
}

#' Rapikan nama kolom
#'
#' Versi Bahasa Indonesia dari [janitor::clean_names()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Mengubah nama kolom menjadi huruf kecil dengan garis bawah.
#' Fungsi ini memerlukan paket janitor, yang dipasang terpisah.
#'
#' @param dat Tabel data. Sama dengan asli: `dat`.
#' @param ... Argumen lain, diteruskan apa adanya ke [janitor::clean_names()].
#'
#' @return Tabel data dengan nama kolom yang dirapikan, sama seperti
#'   [janitor::clean_names()].
#'
#' @section Padanan dengan fungsi asli:
#' `trn_rapikan_nama()` memanggil [janitor::clean_names()]. Paket janitor
#' tidak otomatis terpasang; bila belum ada, fungsi ini memberi pesan yang
#' menjelaskan cara memasangnya.
#'
#' @examples
#' if (requireNamespace("janitor", quietly = TRUE)) {
#'   df <- inp_tibble(`Nama Kolom` = 1, `Nilai Ke-2` = 2)
#'   trn_rapikan_nama(df)
#'
#'   # Setara dengan kode standar:
#'   janitor::clean_names(df)
#' }
#' @export
trn_rapikan_nama <- function(dat, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("trn_rapikan_nama", .panggilan, .lingkungan)
}
