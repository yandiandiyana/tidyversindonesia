# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Pilih kolom yang namanya diawali teks tertentu
#'
#' Versi Bahasa Indonesia dari [tidyselect::starts_with()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Dipakai di dalam fungsi yang memilih kolom, misalnya
#' [trn_pilih()] dan argumen `kolom` pada [rpi_panjang()].
#'
#' @param cocok Teks yang dicari. Asli: `match`.
#' @param abaikan_kapital Apakah huruf besar dan kecil dianggap sama. Asli:
#'   `ignore.case`.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::starts_with()].
#'
#' @return Posisi kolom yang cocok, sama seperti [tidyselect::starts_with()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_diawali()` memanggil [tidyselect::starts_with()].
#'
#' @examples
#' df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)
#' trn_pilih(df, frm_diawali("awal"))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::starts_with("awal"))
#' @export
frm_diawali <- function(cocok, abaikan_kapital, variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_diawali", .panggilan, .lingkungan)
}

#' Pilih kolom yang namanya diakhiri teks tertentu
#'
#' Versi Bahasa Indonesia dari [tidyselect::ends_with()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param cocok Teks yang dicari. Asli: `match`.
#' @param abaikan_kapital Apakah huruf besar dan kecil dianggap sama. Asli:
#'   `ignore.case`.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::ends_with()].
#'
#' @return Posisi kolom yang cocok, sama seperti [tidyselect::ends_with()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_diakhiri()` memanggil [tidyselect::ends_with()].
#'
#' @examples
#' df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)
#' trn_pilih(df, frm_diakhiri("_a"))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::ends_with("_a"))
#' @export
frm_diakhiri <- function(cocok, abaikan_kapital, variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_diakhiri", .panggilan, .lingkungan)
}

#' Pilih kolom yang namanya memuat teks tertentu
#'
#' Versi Bahasa Indonesia dari [tidyselect::contains()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param cocok Teks yang dicari. Asli: `match`.
#' @param abaikan_kapital Apakah huruf besar dan kecil dianggap sama. Asli:
#'   `ignore.case`.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::contains()].
#'
#' @return Posisi kolom yang cocok, sama seperti [tidyselect::contains()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_memuat()` memanggil [tidyselect::contains()].
#'
#' @examples
#' df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)
#' trn_pilih(df, frm_memuat("wal"))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::contains("wal"))
#' @export
frm_memuat <- function(cocok, abaikan_kapital, variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_memuat", .panggilan, .lingkungan)
}

#' Pilih kolom yang namanya cocok dengan ekspresi reguler
#'
#' Versi Bahasa Indonesia dari [tidyselect::matches()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param cocok Teks yang dicari. Asli: `match`.
#' @param abaikan_kapital Apakah huruf besar dan kecil dianggap sama. Asli:
#'   `ignore.case`.
#' @param perl Apakah ekspresi reguler gaya Perl dipakai. Sama dengan asli:
#'   `perl`.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::matches()].
#'
#' @return Posisi kolom yang cocok, sama seperti [tidyselect::matches()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_cocok()` memanggil [tidyselect::matches()].
#'
#' @examples
#' df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)
#' trn_pilih(df, frm_cocok("^awal"))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::matches("^awal"))
#' @export
frm_cocok <- function(cocok, abaikan_kapital, perl, variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_cocok", .panggilan, .lingkungan)
}

#' Pilih kolom berawalan dengan angka berurutan
#'
#' Versi Bahasa Indonesia dari [tidyselect::num_range()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param awalan Awalan nama kolom. Asli: `prefix`.
#' @param rentang Rentang angka di belakang awalan. Asli: `range`.
#' @param akhiran Akhiran nama kolom. Asli: `suffix`.
#' @param lebar Lebar angka, untuk menambahkan nol di depan. Asli: `width`.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::num_range()].
#'
#' @return Posisi kolom yang cocok, sama seperti [tidyselect::num_range()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_rentang_angka()` memanggil [tidyselect::num_range()].
#'
#' @examples
#' df <- inp_tibble(x1 = 1, x2 = 2, x3 = 3)
#' trn_pilih(df, frm_rentang_angka("x", 1:2))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::num_range("x", 1:2))
#' @export
frm_rentang_angka <- function(awalan, rentang, akhiran, lebar, variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_rentang_angka", .panggilan, .lingkungan)
}

#' Pilih semua kolom
#'
#' Versi Bahasa Indonesia dari [tidyselect::everything()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Berguna untuk memindahkan beberapa kolom ke depan, lalu
#' menyertakan sisanya.
#'
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::everything()].
#'
#' @return Posisi semua kolom, sama seperti [tidyselect::everything()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_semua()` memanggil [tidyselect::everything()].
#'
#' @examples
#' df <- inp_tibble(x = 1, y = 2, z = 3)
#' trn_pilih(df, z, frm_semua())
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, z, dplyr::everything())
#' @export
frm_semua <- function(variabel, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_semua", .panggilan, .lingkungan)
}

#' Pilih kolom menurut sebuah fungsi predikat
#'
#' Versi Bahasa Indonesia dari [tidyselect::where()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param fungsi Fungsi predikat yang mengembalikan `TRUE` atau `FALSE` untuk
#'   tiap kolom. Asli: `fn`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [tidyselect::where()].
#'
#' @return Posisi kolom yang lolos predikat, sama seperti
#'   [tidyselect::where()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_di_mana()` memanggil [tidyselect::where()].
#'
#' @examples
#' df <- inp_tibble(x = 1, g = "a", y = 2)
#' trn_pilih(df, frm_di_mana(is.numeric))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::where(is.numeric))
#' @export
frm_di_mana <- function(fungsi, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_di_mana", .panggilan, .lingkungan)
}

#' Pilih kolom dari vektor nama, abaikan yang tidak ada
#'
#' Versi Bahasa Indonesia dari [tidyselect::any_of()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param x Vektor teks berisi nama kolom. Sama dengan asli: `x`.
#' @param ... Tidak dipakai; harus kosong.
#' @param variabel Daftar nama variabel; biasanya dibiarkan kosong sehingga
#'   diambil dari data yang sedang diproses. Asli: `vars`.
#'
#' @return Posisi kolom yang ada, sama seperti [tidyselect::any_of()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_salah_satu()` memanggil [tidyselect::any_of()].
#'
#' @examples
#' df <- inp_tibble(awal_a = 1, awal_b = 2)
#' trn_pilih(df, frm_salah_satu(c("awal_a", "tidak_ada")))
#'
#' # Setara dengan kode standar:
#' dplyr::select(df, dplyr::any_of(c("awal_a", "tidak_ada")))
#' @export
frm_salah_satu <- function(x, ..., variabel) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_salah_satu", .panggilan, .lingkungan)
}

#' Tandai urutan menurun
#'
#' Versi Bahasa Indonesia dari [dplyr::desc()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Dipakai di dalam [trn_urutkan()].
#'
#' @param x Vektor atau kolom yang diurutkan menurun. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [dplyr::desc()].
#'
#' @return Vektor yang dapat dipakai untuk mengurutkan menurun, sama seperti
#'   [dplyr::desc()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_turun()` memanggil [dplyr::desc()].
#'
#' @examples
#' df <- inp_tibble(x = c(1, 3, 2))
#' trn_urutkan(df, frm_turun(x))
#'
#' # Setara dengan kode standar:
#' dplyr::arrange(df, dplyr::desc(x))
#' @export
frm_turun <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_turun", .panggilan, .lingkungan)
}

#' Jumlah baris dalam kelompok saat ini
#'
#' Versi Bahasa Indonesia dari [dplyr::n()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Dipakai di dalam [trn_statistik_ringkas()] dan [trn_mutasi()].
#'
#' @param ... Tidak dipakai; harus kosong.
#'
#' @return Satu bilangan bulat, sama seperti [dplyr::n()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_jumlah()` memanggil [dplyr::n()].
#'
#' @examples
#' df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))
#' df |>
#'   trn_gabung_kelompok(g) |>
#'   trn_statistik_ringkas(banyak = frm_jumlah())
#'
#' # Setara dengan kode standar:
#' df |>
#'   dplyr::group_by(g) |>
#'   dplyr::summarise(banyak = dplyr::n())
#' @export
frm_jumlah <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_jumlah", .panggilan, .lingkungan)
}

#' Pilih nilai menurut kondisi
#'
#' Versi Bahasa Indonesia dari [dplyr::if_else()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param kondisi Vektor logika yang menentukan pilihan. Asli: `condition`.
#' @param benar Nilai bila kondisi benar. Asli: `true`.
#' @param salah Nilai bila kondisi salah. Asli: `false`.
#' @param hilang Nilai bila kondisi `NA`. Asli: `missing`.
#' @param ... Tidak dipakai; harus kosong.
#' @param ptype Prototipe tipe hasil. Sama dengan asli: `ptype`.
#' @param ukuran_keluaran Ukuran hasil. Asli: `size`.
#'
#' @return Vektor hasil, sama seperti [dplyr::if_else()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_jika_lain()` memanggil [dplyr::if_else()].
#'
#' @examples
#' df <- inp_tibble(x = c(1, 5, 3))
#' trn_mutasi(df, ukuran = frm_jika_lain(x > 2, "besar", "kecil"))
#'
#' # Setara dengan kode standar:
#' dplyr::mutate(df, ukuran = dplyr::if_else(x > 2, "besar", "kecil"))
#' @export
frm_jika_lain <- function(kondisi, benar, salah, hilang, ..., ptype,
                          ukuran_keluaran) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_jika_lain", .panggilan, .lingkungan)
}

#' Urutkan level faktor menurut frekuensi
#'
#' Versi Bahasa Indonesia dari [forcats::fct_infreq()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Dipakai di dalam [grf_estetika()] untuk mengurutkan batang.
#' Fungsi ini memerlukan paket forcats, yang dipasang terpisah.
#'
#' @param f Faktor atau vektor teks. Sama dengan asli: `f`.
#' @param bobot Bobot untuk menghitung frekuensi. Asli: `w`.
#' @param berurut Apakah hasil berupa faktor berurutan. Asli: `ordered`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [forcats::fct_infreq()].
#'
#' @return Sebuah faktor, sama seperti [forcats::fct_infreq()].
#'
#' @section Padanan dengan fungsi asli:
#' `frm_faktor_frekuensi()` memanggil [forcats::fct_infreq()]. Paket forcats
#' tidak otomatis terpasang; bila belum ada, fungsi ini memberi pesan yang
#' menjelaskan cara memasangnya.
#'
#' @examples
#' if (requireNamespace("forcats", quietly = TRUE)) {
#'   frm_faktor_frekuensi(c("a", "b", "b", "c", "c", "c"))
#'
#'   # Setara dengan kode standar:
#'   forcats::fct_infreq(c("a", "b", "b", "c", "c", "c"))
#' }
#' @export
frm_faktor_frekuensi <- function(f, bobot, berurut, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("frm_faktor_frekuensi", .panggilan, .lingkungan)
}
