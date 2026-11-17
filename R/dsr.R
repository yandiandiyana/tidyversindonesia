# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Rerata (rata-rata hitung)
#'
#' Versi Bahasa Indonesia dari [base::mean()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. `pangkas` dan `buang_na` adalah argumen metode `mean.default()`,
#' sehingga diteruskan fungsi asli lewat `...`.
#'
#' @param x Vektor numerik. Sama dengan asli: `x`.
#' @param ... Argumen lain, diteruskan apa adanya ke [base::mean()].
#' @param pangkas Proporsi nilai ekstrem yang dibuang di tiap ujung sebelum
#'   menghitung rerata. Asli: `trim`.
#' @param buang_na Apakah nilai hilang dibuang sebelum menghitung. Asli:
#'   `na.rm`.
#'
#' @return Satu angka, sama seperti [base::mean()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_rerata()` memanggil [base::mean()].
#'
#' @examples
#' dsr_rerata(c(1, 2, NA), buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' mean(c(1, 2, NA), na.rm = TRUE)
#' @export
dsr_rerata <- function(x, ..., pangkas, buang_na) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_rerata", .panggilan, .lingkungan)
}

#' Jumlah
#'
#' Versi Bahasa Indonesia dari [base::sum()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param ... Vektor numerik atau logika yang dijumlahkan.
#' @param buang_na Apakah nilai hilang dibuang sebelum menghitung. Asli:
#'   `na.rm`.
#'
#' @return Satu angka, sama seperti [base::sum()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_jumlah()` memanggil [base::sum()].
#'
#' @examples
#' dsr_jumlah(c(1, 2, NA), buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' sum(c(1, 2, NA), na.rm = TRUE)
#' @export
dsr_jumlah <- function(..., buang_na) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_jumlah", .panggilan, .lingkungan)
}

#' Sinus
#'
#' Versi Bahasa Indonesia dari [base::sin()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Sudut dalam radian. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::sin()].
#'
#' @return Nilai sinus, sama seperti [base::sin()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_sinus()` memanggil [base::sin()].
#'
#' @examples
#' dsr_sinus(pi / 2)
#'
#' # Setara dengan kode standar:
#' sin(pi / 2)
#' @export
dsr_sinus <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_sinus", .panggilan, .lingkungan)
}

#' Apakah nilainya hilang
#'
#' Versi Bahasa Indonesia dari [base::is.na()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Objek yang diperiksa. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::is.na()].
#'
#' @return Vektor logika, sama seperti [base::is.na()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_adalah_na()` memanggil [base::is.na()].
#'
#' @examples
#' dsr_adalah_na(c(1, NA, 3))
#'
#' # Setara dengan kode standar:
#' is.na(c(1, NA, 3))
#' @export
dsr_adalah_na <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_adalah_na", .panggilan, .lingkungan)
}

#' Buat deret angka
#'
#' Versi Bahasa Indonesia dari [base::seq()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Argumen `dari`, `sampai`, `selisih`, `panjang_keluaran`, dan
#' `sepanjang` adalah argumen metode `seq.default()`, sehingga diteruskan
#' fungsi asli lewat `...`. Argumen tanpa nama tetap bekerja seperti fungsi
#' asli.
#'
#' @param ... Argumen lain, diteruskan apa adanya ke [base::seq()].
#' @param dari Nilai awal. Asli: `from`.
#' @param sampai Nilai akhir. Asli: `to`.
#' @param selisih Selisih antarnilai. Asli: `by`.
#' @param panjang_keluaran Panjang deret yang diinginkan. Asli: `length.out`.
#' @param sepanjang Objek yang panjangnya dipakai sebagai panjang deret. Asli:
#'   `along.with`.
#'
#' @return Vektor angka, sama seperti [base::seq()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_urutan()` memanggil [base::seq()].
#'
#' @examples
#' dsr_urutan(dari = 1, sampai = 10, selisih = 3)
#' dsr_urutan(1, 10)
#'
#' # Setara dengan kode standar:
#' seq(from = 1, to = 10, by = 3)
#' @export
dsr_urutan <- function(..., dari, sampai, selisih, panjang_keluaran, sepanjang) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_urutan", .panggilan, .lingkungan)
}

#' Bangkitkan bilangan acak berdistribusi normal
#'
#' Versi Bahasa Indonesia dari [stats::rnorm()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Hasilnya berubah tiap kali dijalankan kecuali Anda menetapkan benih
#' dengan `set.seed()`.
#'
#' @param n Jumlah bilangan yang dibangkitkan. Sama dengan asli: `n`.
#' @param rerata Rerata distribusi. Asli: `mean`.
#' @param sd Simpangan baku distribusi. Sama dengan asli: `sd`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [stats::rnorm()].
#'
#' @return Vektor angka, sama seperti [stats::rnorm()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_acak_normal()` memanggil [stats::rnorm()].
#'
#' @examples
#' set.seed(1)
#' dsr_acak_normal(3, rerata = 10, sd = 2)
#'
#' # Setara dengan kode standar:
#' set.seed(1)
#' rnorm(3, mean = 10, sd = 2)
#' @export
dsr_acak_normal <- function(n, rerata, sd, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_acak_normal", .panggilan, .lingkungan)
}

#' Panjang objek
#'
#' Versi Bahasa Indonesia dari [base::length()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Objek yang dihitung panjangnya. Sama dengan asli: `x`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::length()].
#'
#' @return Satu bilangan bulat, sama seperti [base::length()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_panjang()` memanggil [base::length()].
#'
#' @examples
#' dsr_panjang(c("a", "b", "c"))
#'
#' # Setara dengan kode standar:
#' length(c("a", "b", "c"))
#' @export
dsr_panjang <- function(x, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_panjang", .panggilan, .lingkungan)
}

#' Buat faktor
#'
#' Versi Bahasa Indonesia dari [base::factor()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param x Vektor yang diubah menjadi faktor. Sama dengan asli: `x`.
#' @param level Vektor teks berisi level; bila kosong, diambil dari data. Asli:
#'   `levels`.
#' @param label_level Label untuk tiap level. Asli: `labels`.
#' @param kecualikan Nilai yang dikecualikan dari level. Asli: `exclude`.
#' @param berurut Apakah hasil berupa faktor berurutan. Asli: `ordered`.
#' @param maks_level Jumlah level maksimum. Asli: `nmax`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::factor()].
#'
#' @return Sebuah faktor, sama seperti [base::factor()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_faktor()` memanggil [base::factor()].
#'
#' @examples
#' dsr_faktor(c("a", "b", "a"), level = c("b", "a"))
#'
#' # Setara dengan kode standar:
#' factor(c("a", "b", "a"), levels = c("b", "a"))
#' @export
dsr_faktor <- function(x, level, label_level, kecualikan, berurut, maks_level,
                       ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_faktor", .panggilan, .lingkungan)
}

#' Daftar berkas dalam folder
#'
#' Versi Bahasa Indonesia dari [base::list.files()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param lokasi Folder yang dicari. Asli: `path`.
#' @param pola Ekspresi reguler untuk menyaring nama berkas. Asli: `pattern`.
#' @param semua_berkas Apakah berkas tersembunyi disertakan. Asli: `all.files`.
#' @param nama_lengkap Apakah nama berkas ditulis lengkap dengan lokasinya.
#'   Asli: `full.names`.
#' @param rekursif Apakah subfolder ikut ditelusuri. Asli: `recursive`.
#' @param abaikan_kapital Apakah huruf besar dan kecil dianggap sama. Asli:
#'   `ignore.case`.
#' @param sertakan_dir Apakah nama subfolder ikut disertakan saat menelusuri.
#'   Asli: `include.dirs`.
#' @param tanpa_titik_titik Apakah "." dan ".." dikecualikan. Asli: `no..`.
#' @param harfiah Apakah `pola` dicocokkan secara harfiah (bukan ekspresi
#'   reguler). Asli: `fixed`. Hanya tersedia pada R 4.6.0 ke atas.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::list.files()].
#'
#' @return Vektor teks berisi nama berkas, sama seperti [base::list.files()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_daftar_berkas()` memanggil [base::list.files()].
#'
#' @examples
#' folder <- tempfile()
#' dir.create(folder)
#' file.create(file.path(folder, c("a.csv", "b.txt")))
#' dsr_daftar_berkas(folder)
#' dsr_daftar_berkas(folder, pola = "csv$")
#'
#' # Setara dengan kode standar:
#' list.files(folder, pattern = "csv$")
#' @export
dsr_daftar_berkas <- function(lokasi, pola, semua_berkas, nama_lengkap,
                              rekursif, abaikan_kapital, sertakan_dir,
                              tanpa_titik_titik, harfiah, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_daftar_berkas", .panggilan, .lingkungan)
}

#' Lihat direktori kerja
#'
#' Versi Bahasa Indonesia dari [base::getwd()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::getwd()].
#'
#' @return Teks lokasi direktori kerja, sama seperti [base::getwd()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_dir_kerja()` memanggil [base::getwd()].
#'
#' @examples
#' dsr_dir_kerja()
#'
#' # Setara dengan kode standar:
#' getwd()
#' @export
dsr_dir_kerja <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("dsr_dir_kerja", .panggilan, .lingkungan)
}

#' Atur direktori kerja
#'
#' Versi Bahasa Indonesia dari [base::setwd()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Lokasi sebelumnya dikembalikan secara tak terlihat, sama seperti
#' fungsi asli.
#'
#' @param direktori Lokasi direktori kerja yang baru. Asli: `dir`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::setwd()].
#'
#' @return Lokasi direktori kerja sebelumnya, secara tak terlihat, sama
#'   seperti [base::setwd()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_set_dir_kerja()` memanggil [base::setwd()].
#'
#' @examples
#' lama <- dsr_set_dir_kerja(tempdir())
#' dsr_dir_kerja()
#' dsr_set_dir_kerja(lama)
#'
#' # Setara dengan kode standar:
#' lama <- setwd(tempdir())
#' setwd(lama)
#' @export
dsr_set_dir_kerja <- function(direktori, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("dsr_set_dir_kerja", .panggilan, .lingkungan))
}

#' Tulis objek sebagai kode R
#'
#' Versi Bahasa Indonesia dari [base::dput()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Berguna untuk membagikan data kecil saat meminta bantuan. Nama `dput`
#' dipertahankan karena merupakan istilah teknis yang dikenal luas.
#'
#' @param x Objek yang ditulis. Sama dengan asli: `x`.
#' @param berkas Berkas tujuan; bawaannya konsol. Asli: `file`.
#' @param kontrol Opsi cara penulisan objek sebagai kode. Asli: `control`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [base::dput()].
#'
#' @return `x`, secara tak terlihat, sama seperti [base::dput()].
#'
#' @section Padanan dengan fungsi asli:
#' `dsr_dput()` memanggil [base::dput()].
#'
#' @examples
#' dsr_dput(c(a = 1, b = 2))
#'
#' # Setara dengan kode standar:
#' dput(c(a = 1, b = 2))
#' @export
dsr_dput <- function(x, berkas, kontrol, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("dsr_dput", .panggilan, .lingkungan))
}
