# ============================================================================
# BAGIAN 5: FUNGSI PEMBANTU (Helper Functions)
# ============================================================================

#' Melihat sekilas struktur data
#'
#' Padanan fungsi `dplyr::glimpse()`
#'
#' @param data Data frame yang ingin dilihat strukturnya.
#' @return Invisible NULL; hanya menampilkan output di konsol
#' @export
#' @seealso [dplyr::glimpse()]
#' @examples
#' data_lihat_sekilas(penguin)
data_lihat_sekilas <- function(data) {
  dplyr::glimpse(data)
}

#' Menampilkan beberapa baris pertama dari data frame
#'
#' Padanan fungsi `utils::head()`
#'
#' @param data Data frame atau vektor
#' @param n Jumlah baris yang ingin ditampilkan (default = 6).
#' @return Data frame berisi baris awal.
#' @export
#' @seealso [utils::head()]
#' @importFrom utils head
#' @examples
#' data_lihat_kepala(penguin, 3)
data_lihat_kepala <- function(data, n = 6) {
  head(data, n)
}

#' Menampilkan beberapa baris terakhir dari data frame
#'
#' Padanan fungsi `utils::tail()`
#'
#' @param data Data frame atau vektor
#' @param n Jumlah baris yang ingin ditampilkan (default = 6)
#' @return Data frame berisi baris akhir
#' @export
#' @seealso [utils::tail()]
#' @importFrom utils tail
#' @examples
#' data_lihat_ekor(penguin, 3)
data_lihat_ekor <- function(data, n = 6) {
  tail(data, n)
}

#' Melihat nama kolom
#'
#' Padanan fungsi `names()`
#'
#' @param data Data frame
#' @return Vektor karakter berisi nama kolom
#' @export
#' @seealso [base::names()]
#' @examples
#' data_lihat_nama(penguin)
data_lihat_nama <- function(data) {
  names(data)
}

#' Mengganti nama kolom
#'
#' Padanan fungsi `dplyr::rename()`
#'
#' @param data Data frame
#' @param ... pasangan nama baru = nama lama
#'
#' @return Data frame dengan nama kolom baru
#'
#' @examples
#' df <- data.frame(age = 10)
#' kolom_ganti_nama(df, umur = age)
#'
#' @export
#' @seealso [dplyr::rename()]
#' @family data
kolom_ganti_nama <- function(data, ...) {
  dplyr::rename(data, ...)
}

#' Melihat dimensi data (jumlah baris dan jumlah kolom)
#'
#' Padanan fungsi `dim()`
#'
#' @param data Data frame
#' @return Vektor numerik: jumlah baris dan kolom
#' @export
#' @seealso [base::dim()]
#' @examples
#' data_lihat_dimensi(penguin)
data_lihat_dimensi <- function(data) {
  dim(data)
}

#' Menampilkan direktori kerja aktif
#'
#' Padanan fungsi `getwd()`
#'
#' @return String path direktori kerja
#' @export
#' @seealso [getwd()]
#' @examples
#' data_direktori_lihat()
data_direktori_lihat <- function() {
  getwd()
}

#' Mengubah direktori kerja aktif
#'
#' Padanan fungsi `setwd()`
#'
#' @param path String path direktori baru
#' @return Path baru setelah diubah
#' @export
#' @seealso [setwd()], [getwd()], [direktori_lihat()]
#' @examples
#' \dontrun{
#' data_direktori_simpan("C:/Users/Username/Documents/Proyek")
#' }
data_direktori_simpan <- function(path) {
  setwd(path)
  getwd()
}

#' Memilih kolom yang namanya diawali dengan pola tertentu
#'
#' Padanan fungsi `tidyselect::starts_with()`
#'
#' @param prefix Teks yang harus menjadi awal nama kolom.
#' @param ignore.case Logika, apakah mengabaikan huruf besar/kecil
#'
#' @return Objek tidyselect untuk memilih kolom
#'
#' @examples
#' df <- tibble::tibble(nama1 = 1:3, nama2 = 4:6, umur = 20:22)
#' transformasi_seleksi(df, kolom_diawali("nama"))
#'
#' @export
kolom_diawali <- function(prefix, ignore.case = TRUE) {
  tidyselect::starts_with(prefix, ignore.case = ignore.case)
}

#' Memilih kolom yang namanya diakhiri dengan pola tertentu
#'
#' Padanan fungsi `tidyselect::ends_with()`
#'
#' @param suffix Teks yang harus menjadi akhir nama kolom.
#' @param ignore.case Logika, apakah mengabaikan huruf besar/kecil.
#'
#' @return Objek tidyselect untuk memilih kolom.
#'
#' @examples
#' df <- tibble::tibble(id_user = 1:3, nama = c("a","b","c"))
#' transformasi_seleksi(df, kolom_diakhiri("user"))
#'
#' @export
kolom_diakhiri <- function(suffix, ignore.case = TRUE) {
  tidyselect::ends_with(suffix, ignore.case = ignore.case)
}

#' Memilih kolom yang namanya mengandung teks tertentu
#'
#' Padanan fungsi `tidyselect::contains()`
#'
#' @param text Teks yang harus muncul di dalam nama kolom.
#' @param ignore.case Logika, apakah mengabaikan huruf besar/kecil.
#'
#' @return Objek tidyselect.
#'
#' @examples
#' df <- tibble::tibble(
#'   nama_depan = c("A", "B", "C"),
#'   nama_belakang = c("X", "Y", "Z"),
#'   usia = c(20, 30, 40)
#' )
#'
#' transformasi_seleksi(df, kolom_mengandung("nama"))
#'
#' @export
kolom_mengandung <- function(text, ignore.case = TRUE) {
  tidyselect::contains(text, ignore.case = ignore.case)
}

#' Memilih kolom berdasarkan kesamaan nama
#'
#' Padanan fungsi `tidyselect::matches()`.
#'
#' @param pattern Pola regular expression yang akan dikolom_cocokkan.
#' @param ignore.case Logika, apakah mengabaikan huruf besar/kecil.
#'
#' @return Objek tidyselect.
#'
#' @examples
#' df <- tibble::tibble(
#'   x1 = 1:3,
#'   x2 = 3:5,
#'   y = 10:12
#' )
#'
#' transformasi_seleksi(df, kolom_cocok("^x[0-9]+"))
#'
#' @export
kolom_pilih_sama <- function(pattern, ignore.case = FALSE) {
  tidyselect::matches(pattern, ignore.case = ignore.case)
}

#' Memilih semua kolom
#'
#' Padanan fungsi `tidyselect::everything()`
#'
#' @return Objek tidyselect yang mewakili semua kolom
#'
#' @examples
#' df <- tibble::tibble(a = 1, b = 2, c = 3)
#' transformasi_seleksi(df, kolom_pilih_semua())
#'
#' @export
kolom_pilih_semua <- function() {
  tidyselect::everything()
}

#' Memilih kolom berdasarkan pola rentang angka
#'
#' Padanan fungsi `tidyselect::num_range()`
#'
#' @param prefix Nama awal kolom
#' @param range Vektor angka, misalnya 1:5
#' @param width Jumlah digit, misalnya 2 untuk x01, x02
#'
#' @return Objek tidyselect.
#'
#' @examples
#' df <- tibble::tibble(x1 = 1, x2 = 2, x3 = 3)
#' transformasi_seleksi(df, kolom_rentang_angka("x", 1:3))
#'
#' @export
kolom_rentang_angka <- function(prefix, range, width = NULL) {
  tidyselect::num_range(prefix, range, width = width)
}

#' Memilih kolom berdasarkan kondisi fungsi
#'
#' Padanan fungsi `tidyselect::where()`
#'
#' Fungsi ini hanya digunakan dalam konteks seleksi seperti
#' `transformasi_seleksi()`
#'
#' @param fn Fungsi predicate yang mengembalikan TRUE/FALSE
#'
#' @return Objek tidyselect.
#'
#' @examples
#' df <- tibble::tibble(a = 1:3, b = 4:6, c = c("x", "y", "z"))
#' transformasi_seleksi(df, kolom_tipe(is.numeric))
#'
#' @export
kolom_tipe <- function(fn) {
  tidyselect::where(fn)
}

#' Mengurutkan nilai secara menurun
#'
#' Padanan fungsi `dplyr::desc()`
#'
#' @param x Kolom atau vektor yang akan diurutkan menurun
#'
#' @return Objek yang menandai pengurutan menurun
#'
#' @examples
#' df <- tibble::tibble(nama = c("A", "B", "C"), nilai = c(10, 30, 20))
#'
#' # Urutkan berdasarkan nilai secara menurun
#' transformasi_urutkan(df, kolom_menurun(nilai))
#'
#' @export
#' @seealso [dplyr::desc()], [transformasi_urutkan()]
kolom_menurun <- function(x) {
  dplyr::desc(x)
}

#' Membuat tabel tibble
#'
#' Padanan fungsi `tibble::tibble()`
#'
#' @param ... Nama kolom dan nilai yang akan dimasukkan ke dalam tibble
#'
#' @return Sebuah tibble
#'
#' @examples
#' input_tabel_tibble(
#'   nama = c("A", "B"),
#'   nilai = c(10, 20)
#' )
#'
#' @family input
#' @export
#' @seealso [tibble::tibble()], [input_tabel_tribble()]
input_tabel_tibble <- function(...) {
  tibble::tibble(...)
}


#' Membuat tibble baris-per-baris (tribble)
#'
#' Padanan fungsi `tibble::tribble()`
#'
#' @param ... Nilai yang dituliskan baris per baris untuk membentuk tibble.
#'
#' @return Sebuah tibble yang disusun baris demi baris.
#'
#' @examples
#' input_tabel_tribble(
#'   ~nama, ~nilai,
#'   "A",     10,
#'   "B",     20
#' )
#'
#' @family input
#' @export
#' @seealso [tibble::tribble()], [input_tabel_tibble()]
input_tabel_tribble <- function(...) {
  tibble::tribble(...)
}

#' Mengambil kolom menjadi vektor
#'
#' Padanan fungsi `dplyr::pull()`
#'
#' @param .data Data frame atau tibble yang berisi kolom yang akan diambil
#' @param col Kolom yang ingin ditarik. Bisa berupa nama kolom (tanpa tanda kutip)
#'   atau posisi kolom secara numerik. Nilai negatif dapat digunakan untuk
#'   memilih kolom berdasarkan posisi dari belakang
#'
#' @return Vektor berisi nilai dari kolom yang dipilih
#'
#' @examples
#' library(tibble)
#' library(dplyr)
#'
#' data <- tibble(
#'   nama = c("A", "B", "C"),
#'   nilai = c(10, 20, 30)
#' )
#'
#' # Mengambil kolom sebagai vektor
#' kolom_ambil(data, nilai)
#'
#' # Mengambil kolom kedua
#' kolom_ambil(data, 2)
#'
#' # Mengambil kolom terakhir
#' kolom_ambil(data, -1)
#'
#' @export
kolom_ambil <- function(.data, col) {
  dplyr::pull(.data, {{ col }})
}

#' Memilih nilai berdasarkan logika
#'
#' Padanan fungsi `dplyr::if_else()`
#'
#' @param kondisi Vektor logis (TRUE/FALSE) yang menentukan pemilihan nilai.
#' @param nilai_true Nilai yang diberikan ketika kondisi bernilai TRUE.
#' @param nilai_false Nilai yang diberikan ketika kondisi bernilai FALSE.
#' @param missing Nilai opsional yang diberikan ketika kondisi adalah NA.
#'   Jika tidak diisi, nilai NA dikembalikan.
#'
#' @return Vektor dengan panjang sama seperti `kondisi`, berisi hasil pemilihan
#'   nilai untuk setiap elemen.
#'
#' @examples
#' df <- tibble::tibble(nilai = c(70, 40, 90))
#'
#' # Menandai apakah nilai lulus atau tidak
#' dplyr::mutate(df,
#'   status = kolom_jika_maka(nilai >= 60, "Lulus", "Tidak Lulus")
#' )
#'
#' # Menangani NA pada kondisi
#' kolom_jika_maka(c(TRUE, FALSE, NA), "Ya", "Tidak", missing = "Tidak Diketahui")
#'
#' @export
#' @seealso [dplyr::if_else()], [base::ifelse()]
kolom_jika_maka <- function(kondisi, nilai_true, nilai_false, missing = NULL) {
  dplyr::if_else(kondisi, nilai_true, nilai_false, missing = missing)
}
