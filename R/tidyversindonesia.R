#' tidyversindonesia: Jembatan Belajar Tidyverse versi Bahasa Indonesia
#'
#' Package ini menyediakan fungsi-fungsi tidyverse dengan nama dalam Bahasa Indonesia
#' untuk membantu pembelajar Indonesia memahami konsep data science dengan lebih mudah.
#'
#' @docType package
#' @name tidyversindonesia
"_PACKAGE"

# ============================================================================
# BAGIAN 1: IMPOR DATA (Import)
# ============================================================================

#' Impor Data dari File Excel
#'
#' Mengimpor dan membaca file Excel (.xls atau .xlsx) serta mengubahnya menjadi data frame.
#' Fungsi ini adalah padanan dari `readxl::read_excel()`.
#'
#' @param path Jalur atau nama file Excel yang akan dibaca.
#' @param sheet Nama atau nomor lembar kerja yang akan diimpor. Default-nya adalah lembar pertama.
#' @param range Rentang sel (opsional) yang akan dibaca, misalnya `"A1:D10"`.
#' @param col_types Jenis kolom yang akan dibaca (opsional).
#' @param na Nilai string yang akan dianggap sebagai `NA`. Default-nya adalah `"NA"`.
#'
#' @return Sebuah data frame yang berisi data dari file Excel.
#' @examples
#' # impor_baca_excel("data/penjualan.xlsx", sheet = 1)
#'
#' @seealso [readxl::read_excel()]
#' @importFrom readxl read_excel
#' @export
impor_baca_excel <- function(path, sheet = NULL, range = NULL, col_types = NULL, na = "NA") {
  readxl::read_excel(path = path, sheet = sheet, range = range, col_types = col_types, na = na)
}

#' Impor data dari file CSV
#'
#' Mengimpor dan membaca file CSV ke dalam R dengan sintaks Tidyverse versi Bahasa Indonesia.
#' Fungsi ini adalah padanan dari `readr::read_csv()`.
#'
#' @param path Jalur atau nama file CSV yang akan dibaca.
#' @param ... Argumen tambahan yang diteruskan ke `readr::read_csv()`.
#'
#' @return Data frame (`tibble`) hasil pembacaan file.
#' @examples
#' # impor_baca_csv("data/contoh.csv")
#'
#' @export
#' @seealso [readr::read_csv()]
impor_baca_csv <- function(path, ...) {
  readr::read_csv(path, ...)
}

# ============================================================================
# BAGIAN 2: MERAPIKAN DATA (Tidy)
# ============================================================================

#' Merapikan Data Menjadi Format Memanjang
#'
#' Merapikan dengan mengubah data dari format lebar ke format memanjang.
#' Fungsi ini adalah padanan dari `tidyr::pivot_longer()`.
#'
#' @param data Data frame yang akan diubah.
#' @param cols Kolom yang akan diputar menjadi baris.
#' @param names_to Nama kolom baru yang menyimpan nama variabel lama.
#' @param values_to Nama kolom baru yang menyimpan nilai variabel.
#' @param ... Argumen tambahan yang diteruskan ke `tidyr::pivot_longer()`.
#'
#' @return Data frame dalam format memanjang.
#' @examples
#' # Contoh:
#' # rapi_pivot_memanjang(data, cols = c(jan, feb, mar), names_to = "bulan", values_to = "penjualan")
#'
#' @seealso [tidyr::pivot_longer()]
#' @export
rapi_pivot_memanjang <- function(data, cols, names_to = "name", values_to = "value", ...) {
  tidyr::pivot_longer(data = data, cols = {{cols}}, names_to = names_to, values_to = values_to, ...)
}

#' Merapikan Data Menjadi Format Melebar
#'
#' Merapikan dengan mengubah data dari format memanjang ke format lebar.
#' Fungsi ini adalah padanan dari `tidyr::pivot_wider()`.
#'
#' @param data Data frame yang akan diubah.
#' @param names_from Kolom yang berisi nama variabel baru.
#' @param values_from Kolom yang berisi nilai variabel baru.
#' @param ... Argumen tambahan yang diteruskan ke `tidyr::pivot_wider()`.
#'
#' @return Data frame dalam format lebar.
#' @examples
#' # Contoh:
#' # rapi_pivot_melebar(data, names_from = bulan, values_from = penjualan)
#'
#' @seealso [tidyr::pivot_wider()]
#' @export
rapi_pivot_melebar <- function(data, names_from, values_from, ...) {
  tidyr::pivot_wider(data = data, names_from = {{names_from}}, values_from = {{values_from}}, ...)
}

#' Memisahkan satu kolom menjadi beberapa kolom
#'
#' Memecah kolom berdasarkan pemisah tertentu. Fungsi ini adalah padanan dari `tidyr::separate()`.
#'
#' @param data Data frame atau tibble.
#' @param col Kolom yang ingin dipisahkan.
#' @param into Nama kolom baru hasil pemisahan.
#' @param sep Pola pemisah (misal: "_", "-", atau ekspresi reguler).
#' @param ... Argumen tambahan untuk `tidyr::separate()`.
#'
#' @return Data frame dengan kolom baru hasil pemisahan.
#' @examples
#' # rapi_pisah_kolom(data, tanggal, into = c("tahun", "bulan"), sep = "-")
#'
#' @export
#' @seealso [tidyr::separate()]
rapi_pisah_kolom <- function(data, col, into, sep, ...) {
  tidyr::separate(data = data, col = {{col}}, into = into, sep = sep, ...)
}

#' Menggabungkan beberapa kolom menjadi satu
#'
#' Menggabungkan dua atau lebih kolom menjadi satu kolom baru.
#' Fungsi ini adalah padanan dari `tidyr::unite()`.
#'
#' @param data Data frame atau tibble.
#' @param col Nama kolom baru hasil penggabungan.
#' @param ... Kolom yang akan digabungkan.
#' @param sep Pemisah antar nilai kolom (default: "_").
#'
#' @return Data frame dengan kolom baru hasil penggabungan.
#' @examples
#' # rapi_gabung_kolom(data, tanggal, tahun, bulan, sep = "-")
#'
#' @export
#' @seealso [tidyr::unite()]
rapi_gabung_kolom <- function(data, col, ..., sep = "_") {
  tidyr::unite(data = data, col = {{col}}, ..., sep = sep)
}

#' Menghapus baris dengan nilai hilang (NA)
#'
#' Menghapus seluruh baris yang memiliki nilai NA.
#' Fungsi ini adalah padanan dari `tidyr::drop_na()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang akan diperiksa (opsional).
#'
#' @return Data frame tanpa baris yang mengandung NA.
#' @examples
#' # rapi_hapus_na(data)
#'
#' @export
#' @seealso [tidyr::drop_na()]
rapi_hapus_na <- function(data, ...) {
  tidyr::drop_na(data = data, ...)
}

#' Mengisi nilai hilang (NA) dengan nilai sebelumnya atau berikutnya
#'
#' Mengisi nilai hilang berdasarkan kolom yang dipilih.
#' Fungsi ini adalah padanan dari `tidyr::fill()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang akan diisi.
#' @param .direction Arah pengisian: "down", "up", "downup", atau "updown".
#'
#' @return Data frame dengan nilai hilang yang telah diisi.
#' @examples
#' # rapi_isi_na(data, kolom, .direction = "down")
#'
#' @export
#' @seealso [tidyr::fill()]
rapi_isi_na <- function(data, ..., .direction = "down") {
  tidyr::fill(data = data, ..., .direction = .direction)
}

#' Mengganti nama kolom dalam data
#'
#' Mengganti nama satu atau beberapa kolom. Fungsi ini adalah padanan dari `dplyr::rename()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Pasangan nama baru = nama lama.
#'
#' @return Data frame dengan nama kolom yang diperbarui.
#' @examples
#' # rapi_ganti_nama(data, umur_baru = age)
#'
#' @export
#' @seealso [dplyr::rename()]
rapi_ganti_nama <- function(data, ...) {
  dplyr::rename(data, ...)
}

#' Menghapus baris duplikat dalam data
#'
#' Menghapus baris yang memiliki nilai identik pada kolom tertentu.
#' Fungsi ini adalah padanan dari `dplyr::distinct()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang digunakan untuk mendeteksi duplikat (opsional).
#'
#' @return Data frame tanpa baris duplikat.
#' @examples
#' # rapi_hapus_duplikat(data)
#'
#' @export
#' @seealso [dplyr::distinct()]
rapi_hapus_duplikat <- function(data, ...) {
  dplyr::distinct(data, ...)
}


# ============================================================================
# BAGIAN 3: TRANSFORMASI DATA (Transform)
# ============================================================================

#' Memilih kolom tertentu dari data
#'
#' Memilih kolom yang relevan dari data. Fungsi ini adalah padanan dari `dplyr::select()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang ingin dipilih.
#'
#' @return Data frame dengan kolom yang dipilih.
#' @examples
#' # transformasi_pilih(data, nama, usia)
#'
#' @export
#' @seealso [dplyr::select()]
transformasi_pilih <- function(data, ...) {
  dplyr::select(data, ...)
}

#' Menyaring baris berdasarkan kondisi tertentu
#'
#' Memilih baris yang memenuhi kondisi logika. Fungsi ini adalah padanan dari `dplyr::filter()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kondisi logika untuk menyaring baris.
#'
#' @return Data frame hasil penyaringan.
#' @examples
#' # transformasi_filter(data, usia > 30)
#'
#' @export
#' @seealso [dplyr::filter()]
transformasi_filter <- function(data, ...) {
  dplyr::filter(data, ...)
}

#' Membuat atau mengubah kolom dalam data
#'
#' Menambah kolom baru atau memperbarui kolom yang ada.
#' Fungsi ini adalah padanan dari `dplyr::mutate()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Ekspresi untuk membuat atau mengubah kolom.
#'
#' @return Data frame dengan kolom baru atau yang telah diperbarui.
#' @examples
#' # transformasi_mutasi(data, usia_tahun = usia_bulan / 12)
#'
#' @export
#' @seealso [dplyr::mutate()]
transformasi_mutasi <- function(data, ...) {
  dplyr::mutate(data, ...)
}

#' Mengurutkan baris dalam data
#'
#' Mengurutkan baris berdasarkan satu atau lebih kolom.
#' Fungsi ini adalah padanan dari `dplyr::arrange()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang digunakan untuk pengurutan.
#'
#' @return Data frame yang telah diurutkan.
#' @examples
#' # transformasi_urutkan(data, desc(usia))
#'
#' @export
#' @seealso [dplyr::arrange()]
transformasi_urutkan <- function(data, ...) {
  dplyr::arrange(data, ...)
}

#' Merangkum data menjadi nilai statistik ringkas
#'
#' Menghitung statistik data seperti rata-rata, jumlah, atau nilai maksimum.
#' Fungsi ini adalah padanan dari `dplyr::summarise()`.
#'
#' @param data Data frame atau tibble (biasanya sudah dikelompokkan).
#' @param ... Ekspresi ringkasan yang ingin dihitung.
#'
#' @return Data frame hasil peringkasan.
#' @examples
#' # transformasi_statistik_ringkas(data, rata_usia = mean(usia, na.rm = TRUE))
#'
#' @export
#' @seealso [dplyr::summarise()]
transformasi_statistik_ringkas <- function(data, ...) {
  dplyr::summarise(data, ...)
}

#' Mengelompokkan data berdasarkan kolom tertentu
#'
#' Mengelompokkan data agar perhitungan atau ringkasan dilakukan per kelompok.
#' Fungsi ini adalah padanan dari `dplyr::group_by()`.
#'
#' @param data Data frame atau tibble.
#' @param ... Kolom yang digunakan untuk pengelompokan.
#'
#' @return Data frame yang telah dikelompokkan.
#' @examples
#' # transformasi_masuk_grup(data, jenis_kelamin)
#'
#' @export
#' @seealso [dplyr::group_by()]
transformasi_masuk_grup <- function(data, ...) {
  dplyr::group_by(data, ...)
}

#' Melepas pengelompokan dari data
#'
#' Menghapus struktur pengelompokan agar operasi berikutnya tidak per grup.
#' Fungsi ini adalah padanan dari `dplyr::ungroup()`.
#'
#' @param data Data frame atau tibble yang sudah dikelompokkan.
#'
#' @return Data frame tanpa pengelompokan.
#' @examples
#' # transformasi_keluar_grup(data)
#'
#' @export
#' @seealso [dplyr::ungroup()]
transformasi_keluar_grup <- function(data) {
  dplyr::ungroup(data)
}

#' Mengurutkan faktor berdasarkan frekuensi kemunculan
#'
#' Mengurutkan level faktor dari yang paling sering muncul hingga paling jarang.
#' Fungsi ini adalah padanan dari `forcats::fct_infreq()`.
#'
#' @param f Vektor faktor.
#' @param ... Argumen tambahan untuk `forcats::fct_infreq()`.
#'
#' @return Faktor dengan urutan level berdasarkan frekuensi.
#' @examples
#' # rapi_urut_faktor(species)
#'
#' @export
#' @seealso [forcats::fct_infreq()]
rapi_urut_faktor <- function(f, ...) {
  forcats::fct_infreq(f, ...)
}

# ============================================================================
# BAGIAN 4: VISUALISASI (Visualize)
# ============================================================================

#' Membuat Plot dari ggplot
#'
#' Membuat objek grafik utama menggunakan gaya Tidyverse versi Bahasa Indonesia.
#' Fungsi ini adalah padanan dari `ggplot2::ggplot()`.
#'
#' @param data Data frame atau tibble yang akan divisualisasikan.
#' @param mapping Pemetaan estetika, biasanya dibuat dengan `estetika()`.
#' @param ... Argumen tambahan untuk `ggplot2::ggplot()`.
#'
#' @return Objek `ggplot` yang dapat ditambahkan layer visualisasi.
#' @examples
#' # visualisasi_ggplot(data = penguins, mapping = estetika(x = flipper_length_mm, y = body_mass_g))
#'
#' @export
#' @seealso [ggplot2::ggplot()]
visualisasi_ggplot <- function(data, mapping = NULL, ...) {
  ggplot2::ggplot(data = data, mapping = mapping, ...)
}

#' Menentukan pemetaan estetika visualisasi
#'
#' Menentukan kolom data yang digunakan sebagai sumbu x, y, warna, bentuk, dan ukuran.
#' Fungsi ini adalah padanan dari `ggplot2::aes()`.
#'
#' @param ... Pemetaan estetika seperti `x`, `y`, `color`, `shape`, dan `size`.
#'
#' @return Objek pemetaan estetika (`aes`).
#' @examples
#' # estetika(x = flipper_length_mm, y = body_mass_g)
#'
#' @export
#' @seealso [ggplot2::aes()]
estetika <- function(...) {
  ggplot2::aes(...)
}

#' Menambahkan layer titik (scatter plot)
#'
#' Membuat visualisasi titik untuk dua variabel numerik.
#' Fungsi ini adalah padanan dari `ggplot2::geom_point()`.
#'
#' @param mapping Pemetaan estetika tambahan untuk layer ini (opsional).
#' @param ... Argumen tambahan untuk `ggplot2::geom_point()`.
#'
#' @return Layer titik yang dapat ditambahkan ke objek `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = flipper_length_mm, y = body_mass_g)) +
#' #   geometrik_titik(estetika(color = species))
#'
#' @export
#' @seealso [ggplot2::geom_point()]
geometrik_titik <- function(mapping = NULL, ...) {
  ggplot2::geom_point(mapping = mapping, ...)
}

#' Membuat diagram batang (bar chart)
#'
#' Menampilkan jumlah atau proporsi kategori dalam bentuk batang.
#' Fungsi ini adalah padanan dari `ggplot2::geom_bar()`.
#'
#' @param mapping Pemetaan estetika untuk layer ini.
#' @param ... Argumen tambahan untuk `ggplot2::geom_bar()`.
#'
#' @return Layer diagram batang untuk ditambahkan ke `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = species)) + geometrik_batang()
#'
#' @export
#' @seealso [ggplot2::geom_bar()]
geometrik_batang <- function(mapping = NULL, ...) {
  ggplot2::geom_bar(mapping = mapping, ...)
}

#' Membuat histogram
#'
#' Menampilkan distribusi data numerik dalam bentuk batang berkelompok.
#' Fungsi ini adalah padanan dari `ggplot2::geom_histogram()`.
#'
#' @param mapping Pemetaan estetika untuk layer ini.
#' @param bins Jumlah batang (default mengikuti `ggplot2`).
#' @param ... Argumen tambahan untuk `ggplot2::geom_histogram()`.
#'
#' @return Layer histogram untuk ditambahkan ke `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = body_mass_g)) + geometrik_histogram()
#'
#' @export
#' @seealso [ggplot2::geom_histogram()]
geometrik_histogram <- function(mapping = NULL, bins = NULL, ...) {
  ggplot2::geom_histogram(mapping = mapping, bins = bins, ...)
}

#' Membuat kurva kerapatan (density plot)
#'
#' Menampilkan distribusi probabilitas dari data numerik.
#' Fungsi ini adalah padanan dari `ggplot2::geom_density()`.
#'
#' @param mapping Pemetaan estetika untuk layer ini.
#' @param ... Argumen tambahan untuk `ggplot2::geom_density()`.
#'
#' @return Layer kurva kerapatan untuk ditambahkan ke `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = body_mass_g)) + geometrik_kerapatan()
#'
#' @export
#' @seealso [ggplot2::geom_density()]
geometrik_kerapatan <- function(mapping = NULL, ...) {
  ggplot2::geom_density(mapping = mapping, ...)
}

#' Membuat plotkotak (boxplot)
#'
#' Menampilkan ringkasan statistik distribusi data numerik berdasarkan kategori.
#' Fungsi ini adalah padanan dari `ggplot2::geom_boxplot()`.
#'
#' @param mapping Pemetaan estetika untuk layer ini.
#' @param ... Argumen tambahan untuk `ggplot2::geom_boxplot()`.
#'
#' @return Layer boxplot untuk ditambahkan ke `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = species, y = body_mass_g)) + geometrik_kotak()
#'
#' @export
#' @seealso [ggplot2::geom_boxplot()]
geometrik_plot_kotak <- function(mapping = NULL, ...) {
  ggplot2::geom_boxplot(mapping = mapping, ...)
}

#' Menambahkan garis tren atau model ke grafik
#'
#' Menampilkan garis tren hasil pemodelan data (seperti regresi linier).
#' Fungsi ini adalah padanan dari `ggplot2::geom_smooth()`.
#'
#' @param mapping Pemetaan estetika tambahan untuk layer ini (opsional).
#' @param method Metode pemodelan, misalnya `"lm"` untuk regresi linier.
#' @param ... Argumen tambahan untuk `ggplot2::geom_smooth()`.
#'
#' @return Layer garis tren yang dapat ditambahkan ke objek `ggplot`.
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = flipper_length_mm, y = body_mass_g)) +
#' #   geometrik_garis_tren(method = "lm")
#'
#' @export
#' @seealso [ggplot2::geom_smooth()]
geometrik_garis_tren <- function(mapping = NULL, method = NULL, ...) {
  ggplot2::geom_smooth(mapping = mapping, method = method, ...)
}

#' Menambahkan label dan judul pada grafik
#'
#' Memberikan judul, subjudul, label sumbu, dan legenda pada grafik.
#' Fungsi ini adalah padanan dari `ggplot2::labs()`.
#'
#' @param title Judul utama grafik.
#' @param subtitle Subjudul grafik.
#' @param x Label untuk sumbu X.
#' @param y Label untuk sumbu Y.
#' @param color Label untuk legenda warna.
#' @param shape Label untuk legenda bentuk.
#' @param ... Argumen tambahan untuk `ggplot2::labs()`.
#'
#' @return Layer label yang dapat ditambahkan ke objek `ggplot`.
#' @examples
#' \dontrun{
#' label(
#'   title = "Hubungan panjang sirip dan massa tubuh",
#'   x = "Panjang sirip (mm)",
#'   y = "Massa tubuh (g)"
#' )
#' }
#'
#' @export
#' @seealso [ggplot2::labs()]
label <- function(title = NULL, subtitle = NULL, x = NULL, y = NULL, color = NULL, shape = NULL, ...) {
  ggplot2::labs(title = title, subtitle = subtitle, x = x, y = y, color = color, shape = shape, ...)
}

#' Membagi plot menjadi beberapa panel berdasarkan variabel
#'
#' Membagi visualisasi ke dalam beberapa subplot berdasarkan satu atau dua variabel kategorik.
#' Fungsi ini adalah padanan dari `ggplot2::facet_wrap()` dan `ggplot2::facet_grid()`.
#'
#' @param facets Variabel untuk pemisahan subplot.
#' @param ... Argumen tambahan untuk `ggplot2::facet_wrap()` atau `ggplot2::facet_grid()`.
#'
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = flipper_length_mm, y = body_mass_g)) +
#' #   geometrik_titik() +
#' #   panel_bungkus(~ species)
#'
#' @export
#' @seealso [ggplot2::facet_wrap()], [ggplot2::facet_grid()]
panel_bungkus <- function(facets, ...) {
  ggplot2::facet_wrap(facets, ...)
}

#' Membagi plot menjadi grid berdasarkan dua variabel
#'
#' Padanan dari `ggplot2::facet_grid()`.
#'
#' @param rows,cols Variabel untuk baris dan kolom.
#' @param ... Argumen tambahan untuk `ggplot2::facet_grid()`.
#'
#' @examples
#' # visualisasi_ggplot(penguins, estetika(x = flipper_length_mm, y = body_mass_g)) +
#' #   geometrik_titik() +
#' #   panel_grid(rows = vars(species), cols = vars(sex))
#'
#' @export
#' @seealso [ggplot2::facet_grid()]
panel_grid <- function(rows = NULL, cols = NULL, ...) {
  ggplot2::facet_grid(rows = rows, cols = cols, ...)
}

#' Tema Minimal
#'
#' Padanan dari `ggplot2::theme_minimal()` untuk tampilan plot yang bersih.
#'
#' @return Layer ggplot untuk digunakan di +.
#' @export
#' @seealso [ggplot2::theme_minimal()], [tema()]
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
#'   ggplot2::geom_point() +
#'   tema_minimal()
tema_minimal <- function() {
  ggplot2::theme_minimal()
}

#' Tema Klasik
#'
#' Padanan dari `ggplot2::theme_classic()` untuk tampilan plot klasik dengan grid minimal.
#'
#' @return Layer ggplot untuk digunakan di +.
#' @export
#' @seealso [ggplot2::theme_classic()], [tema()]
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
#'   ggplot2::geom_point() +
#'   tema_klasik()
tema_klasik <- function() {
  ggplot2::theme_classic()
}

#' Tema Sederhana
#'
#' Padanan dari `ggplot2::theme_light()` untuk plot dengan grid lembut dan latar putih.
#'
#' @return Layer ggplot untuk digunakan di +.
#' @export
#' @seealso [ggplot2::theme_light()], [tema()]
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
#'   ggplot2::geom_point() +
#'   tema_sederhana()
tema_sederhana <- function() {
  ggplot2::theme_light()
}

#' Tema Gelap
#'
#' Padanan dari `ggplot2::theme_dark()` untuk plot dengan latar gelap.
#'
#' @return Layer ggplot untuk digunakan di +.
#' @export
#' @seealso [ggplot2::theme_dark()], [tema()]
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
#'   ggplot2::geom_point() +
#'   tema_gelap()
tema_gelap <- function() {
  ggplot2::theme_dark()
}

#' Tema Kosong
#'
#' Padanan dari `ggplot2::theme_void()` untuk plot tanpa latar dan sumbu.
#'
#' @return Layer ggplot untuk digunakan di +.
#' @export
#' @seealso [ggplot2::theme_void()], [tema()]
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
#'   ggplot2::geom_point() +
#'   tema_kosong()
tema_kosong <- function() {
  ggplot2::theme_void()
}

#' Menyimpan visualisasi ke file
#'
#' Menyimpan hasil visualisasi ke format gambar seperti PNG, PDF, atau JPEG.
#' Fungsi ini adalah padanan dari `ggplot2::ggsave()`.
#'
#' @param filename Nama file tujuan (misalnya `"grafik.png"`).
#' @param plot Objek `ggplot` yang ingin disimpan. Default: plot terakhir.
#' @param width,height Ukuran gambar (dalam inci).
#' @param dpi Resolusi gambar (dots per inch).
#' @param ... Argumen tambahan untuk `ggplot2::ggsave()`.
#'
#' @return File gambar tersimpan di direktori kerja.
#' @examples
#' # visualisasi_ggplot_simpan("grafik_penguins.png")
#'
#' @export
#' @seealso [ggplot2::ggsave()]
visualisasi_ggplot_simpan <- function(filename, plot = ggplot2::last_plot(), width = NULL, height = NULL, dpi = 300, ...) {
  ggplot2::ggsave(filename = filename, plot = plot, width = width, height = height, dpi = dpi, ...)
}

#' Menampilkan plot ggplot terakhir
#'
#' Fungsi ini mengambil plot ggplot yang terakhir dibuat di sesi R saat ini.
#' Ini adalah padanan dari `ggplot2::last_plot()`.
#'
#' @return Objek ggplot dari plot terakhir yang dibuat.
#' @export
#' @seealso [ggplot2::last_plot()], [visualisasi_ggplot()]
#' @examples
#' \dontrun{
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, hp)) + geom_point()
#' p
#' visualisasi_ggplot_terakhir()  # menampilkan plot terakhir
#' }
visualisasi_ggplot_terakhir <- function() {
  ggplot2::last_plot()
}

# ============================================================================
# BAGIAN 5: FUNGSI MODEL
# ============================================================================

#' Membuat Model Regresi Linear
#'
#' Membuat model regresi linear untuk menganalisis hubungan antara variabel
#' respon dan satu atau lebih variabel prediktor.
#' Fungsi ini adalah padanan dari `stats::lm()`.
#'
#' @param formula Rumus model, misalnya `y ~ x1 + x2`.
#' @param data Data frame yang digunakan untuk pemodelan.
#' @param ... Argumen tambahan untuk `stats::lm()`.
#'
#' @return Objek model regresi linear.
#' @examples
#' # model <- model_regresi(body_mass_g ~ flipper_length_mm, data = penguins)
#' # ringkasan_model(model)
#'
#' @seealso [stats::lm()]
#' @export
model_regresi <- function(formula, data, ...) {
  stats::lm(formula = formula, data = data, ...)
}

# ============================================================================
# BAGIAN 6: KOMUNIKASI
# ============================================================================

# ============================================================================
# BAGIAN 7: FUNGSI PEMBANTU (Helper Functions)
# ============================================================================

#' Menampilkan data frame dalam tampilan spreadsheet RStudio atau GUI
#'
#' Fungsi ini menampilkan data frame dalam tampilan interaktif seperti lembar kerja.
#' Jika dijalankan di RStudio, data akan muncul di panel Data Viewer dengan nama
#' objek asli sebagai judul tab. Jika dijalankan di luar RStudio, data akan muncul
#' di jendela baru (GUI).
#'
#' @param data Data frame yang ingin dilihat.
#' @return Membuka tampilan data di panel RStudio atau jendela baru.
#' @export
#' @seealso [utils::View()]
#' @importFrom rstudioapi isAvailable
#' @importFrom utils View
#' @examples
#' # lihat(penguins)  # menampilkan data di panel Data Viewer (RStudio)
lihat <- function(data) {
  name <- deparse(substitute(data))  # ambil nama asli objek
  if (rstudioapi::isAvailable()) {
    View(data, title = name)          # gunakan nama asli sebagai tab
  } else {
    utils::View(data)                 # fallback ke GUI base R
  }
}

#' Melihat sekilas struktur data frame dengan cara ringkas dan rapi.
#'
#' Fungsi ini adalah padanan dari `dplyr::glimpse()` dan digunakan untuk
#' menampilkan struktur data secara cepat tanpa mencetak seluruh isi data.
#'
#' @param data Data frame yang ingin dilihat strukturnya.
#' @return Menampilkan ringkasan struktur data di konsol.
#' @export
#' @seealso [dplyr::glimpse()]
#' @examples
#' lihat_sekilas(penguins)
lihat_sekilas <- function(data) {
  dplyr::glimpse(data)
}

#' Menampilkan beberapa baris pertama dari data frame.
#'
#' Fungsi ini adalah padanan dari `head()` dan digunakan untuk melihat
#' contoh awal dari data.
#'
#' @param data Data frame atau vektor.
#' @param n Jumlah baris yang ingin ditampilkan (default = 6).
#' @return Menampilkan beberapa baris pertama dari data.
#' @export
#' @seealso [base::head()]
#' @importFrom utils head
#' @examples
#' lihat_kepala(penguins, 3)
lihat_kepala <- function(data, n = 6) {
  head(data, n)
}

#' Menampilkan beberapa baris terakhir dari data frame.
#'
#' Fungsi ini adalah padanan dari `tail()` dan digunakan untuk melihat
#' bagian akhir dari data.
#'
#' @param data Data frame atau vektor.
#' @param n Jumlah baris yang ingin ditampilkan (default = 6).
#' @return Menampilkan beberapa baris terakhir dari data.
#' @export
#' @seealso [base::tail()]
#' @importFrom utils tail
#' @examples
#' lihat_ekor(penguins, 3)
lihat_ekor <- function(data, n = 6) {
  tail(data, n)
}

#' Melihat nama kolom dari data frame.
#'
#' Fungsi ini adalah padanan dari `names()` dan digunakan untuk menampilkan
#' daftar nama kolom yang terdapat pada data.
#'
#' @param data Data frame.
#' @return Karakter vektor berisi nama kolom.
#' @export
#' @seealso [base::names()]
#' @examples
#' lihat_nama_kolom(penguins)
lihat_nama_kolom <- function(data) {
  names(data)
}

#' Melihat jumlah baris dan kolom dari data frame.
#'
#' Fungsi ini adalah padanan dari `dim()` dan digunakan untuk mengetahui
#' ukuran data (baris x kolom).
#'
#' @param data Data frame.
#' @return Vektor numerik berisi jumlah baris dan kolom.
#' @export
#' @seealso [base::dim()]
#' @examples
#' lihat_dimensi(penguins)
lihat_dimensi <- function(data) {
  dim(data)
}

#' Melihat nama kolom dari data frame.
#'
#' Fungsi ini adalah padanan dari `names()` dan digunakan untuk menampilkan
#' daftar nama kolom yang terdapat pada data.
#'
#' @param data Data frame.
#' @return Karakter vektor berisi nama kolom.
#' @export
#' @seealso [base::names()]
#' @examples
#' lihat_nama_kolom(penguins)
lihat_nama_kolom <- function(data) {
  names(data)
}

#' Menampilkan direktori kerja saat ini
#'
#' Fungsi ini menampilkan direktori kerja aktif di R.
#' Ini adalah padanan dari `getwd()` dan berguna untuk mengetahui
#' lokasi folder saat ini di mana R membaca dan menyimpan file.
#'
#' @return String yang berisi path direktori kerja saat ini.
#' @export
#' @seealso [getwd()]
#' @examples
#' # lihat_direktori_kerja()
#' # [1] "C:/Users/Username/Documents/R"
lihat_direktori_kerja <- function() {
  getwd()
}

#' Mengubah direktori kerja aktif
#'
#' Fungsi ini mengubah direktori kerja aktif di R.
#' Ini adalah padanan dari `setwd()` dan berguna untuk menentukan
#' lokasi folder di mana R akan membaca dan menyimpan file.
#'
#' @param path String yang berisi path direktori baru.
#' @return Path direktori kerja baru setelah diubah.
#' @export
#' @seealso [setwd()], [getwd()], [lihat_direktori_kerja()]
#' @examples
#' \dontrun{
#' # ubah_direktori_kerja("C:/Users/Username/Documents/Proyek")
#' lihat_direktori_kerja()  # memastikan direktori sudah berubah
#' }
ubah_direktori_kerja <- function(path) {
  setwd(path)
  getwd()  # kembalikan path baru sebagai output
}

