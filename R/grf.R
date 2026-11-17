# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Pemetaan estetika
#'
#' Versi Bahasa Indonesia dari [ggplot2::aes()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Nama estetika diterjemahkan: `warna` (`colour`), `isian` (`fill`),
#' `bentuk` (`shape`), `ukuran` (`size`), `alfa` (`alpha`), `tipe_garis`
#' (`linetype`), `ketebalan_garis` (`linewidth`), dan `kelompok` (`group`).
#' `x` dan `y` tidak berubah. Ekspresi seperti `x = berat / 1000` tetap
#' dievaluasi di dalam data (data masking).
#'
#' @param x Variabel untuk sumbu x. Sama dengan asli: `x`.
#' @param y Variabel untuk sumbu y. Sama dengan asli: `y`.
#' @param ... Estetika lain, ditulis `estetika = variabel`. Nama estetika lokal
#'   diterjemahkan; nama lain, termasuk nama asli berbahasa Inggris, diteruskan
#'   apa adanya.
#'
#' @return Sebuah objek pemetaan, sama seperti [ggplot2::aes()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_estetika()` memanggil [ggplot2::aes()].
#'
#' @examples
#' grf_estetika(x = a, y = b, warna = g)
#'
#' # Setara dengan kode standar:
#' ggplot2::aes(x = a, y = b, colour = g)
#' @export
grf_estetika <- function(x, y, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_estetika", .panggilan, .lingkungan)
}

#' Label plot
#'
#' Versi Bahasa Indonesia dari [ggplot2::labs()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Nama estetika di `...` (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#' `tipe_garis`, `ketebalan_garis`) menamai label legenda yang bersangkutan.
#' `sumbu_x` dan `sumbu_y` adalah label sumbu (asli: `x` dan `y`, yang
#' diterima fungsi asli lewat `...`).
#'
#' @param ... Label legenda untuk estetika, misalnya `warna = "Spesies"`. Nama
#'   estetika lokal diterjemahkan; nama lain diteruskan apa adanya.
#' @param judul Judul plot. Asli: `title`.
#' @param subjudul Subjudul plot. Asli: `subtitle`.
#' @param keterangan Keterangan di bawah plot. Asli: `caption`.
#' @param tag Label penanda plot. Sama dengan asli: `tag`.
#' @param kamus Kamus label: vektor bernama yang memetakan nama variabel ke
#'   label. Asli: `dictionary`.
#' @param teks_alternatif Teks alternatif untuk pembaca layar. Asli: `alt`.
#' @param wawasan_alternatif Wawasan utama plot untuk teks alternatif. Asli:
#'   `alt_insight`.
#' @param sumbu_x Label sumbu x. Asli: `x`.
#' @param sumbu_y Label sumbu y. Asli: `y`.
#'
#' @return Sebuah objek label yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::labs()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_label()` memanggil [ggplot2::labs()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_label(
#'     judul = "Sirip dan massa tubuh penguin",
#'     sumbu_x = "Panjang sirip (mm)",
#'     sumbu_y = "Massa tubuh (g)"
#'   )
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::labs(title = "Sirip dan massa tubuh penguin",
#'                 x = "Panjang sirip (mm)", y = "Massa tubuh (g)")
#' @export
grf_label <- function(..., judul, subjudul, keterangan, tag, kamus,
                      teks_alternatif, wawasan_alternatif, sumbu_x, sumbu_y) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_label", .panggilan, .lingkungan)
}

#' Geometri titik
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_point()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_point()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_titik()` memanggil [ggplot2::geom_point()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(warna = "blue", alfa = 0.5, buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(colour = "blue", alpha = 0.5, na.rm = TRUE)
#' @export
grf_geometrik_titik <- function(pemetaan, data, statistik, posisi, ...,
                                buang_na, tampilkan_legenda, warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_titik", .panggilan, .lingkungan)
}

#' Geometri garis
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_line()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param orientasi Orientasi lapisan: `"x"`, `"y"`, atau `NA` (otomatis).
#'   Asli: `orientation`.
#' @param panah Spesifikasi panah pada ujung garis. Asli: `arrow`.
#' @param isian_panah Warna isian kepala panah. Asli: `arrow.fill`.
#' @param ujung_garis Gaya ujung garis: `"butt"`, `"round"`, atau `"square"`.
#'   Asli: `lineend`.
#' @param sambungan_garis Gaya sambungan garis: `"round"`, `"mitre"`, atau
#'   `"bevel"`. Asli: `linejoin`.
#' @param batas_sambungan Batas sambungan runcing. Asli: `linemitre`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_line()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_garis()` memanggil [ggplot2::geom_line()].
#'
#' @examples
#' d <- inp_tibble(a = 1:5, b = c(2, 4, 3, 6, 5), g = c("u", "v", "u", "v", "u"))
#' vis_ggplot(d, grf_estetika(x = a, y = b)) +
#'   grf_geometrik_garis(warna = "blue", ketebalan_garis = 1)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
#'   ggplot2::geom_line(colour = "blue", linewidth = 1)
#' @export
grf_geometrik_garis <- function(pemetaan, data, statistik, posisi, ...,
                                orientasi, panah, isian_panah, ujung_garis,
                                sambungan_garis, batas_sambungan, buang_na,
                                tampilkan_legenda, warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_garis", .panggilan, .lingkungan)
}

#' Geometri batang
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_bar()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Tanpa pemetaan `y`, batang menghitung jumlah pengamatan.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param perataan Perataan batang terhadap posisi x. Asli: `just`.
#' @param ujung_garis Gaya ujung garis: `"butt"`, `"round"`, atau `"square"`.
#'   Asli: `lineend`.
#' @param sambungan_garis Gaya sambungan garis: `"round"`, `"mitre"`, atau
#'   `"bevel"`. Asli: `linejoin`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_bar()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_batang()` memanggil [ggplot2::geom_bar()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = pulau, isian = spesies)) +
#'   grf_geometrik_batang(posisi = "fill")
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = pulau, fill = spesies)) +
#'   ggplot2::geom_bar(position = "fill")
#' @export
grf_geometrik_batang <- function(pemetaan, data, statistik, posisi, ...,
                                 perataan, ujung_garis, sambungan_garis,
                                 buang_na, tampilkan_legenda, warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_batang", .panggilan, .lingkungan)
}

#' Geometri histogram
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_histogram()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param lebar_bin Lebar tiap bin (rentang nilai). Asli: `binwidth`.
#' @param jumlah_bin Jumlah bin. Asli: `bins`.
#' @param orientasi Orientasi lapisan: `"x"`, `"y"`, atau `NA` (otomatis).
#'   Asli: `orientation`.
#' @param ujung_garis Gaya ujung garis: `"butt"`, `"round"`, atau `"square"`.
#'   Asli: `lineend`.
#' @param sambungan_garis Gaya sambungan garis: `"round"`, `"mitre"`, atau
#'   `"bevel"`. Asli: `linejoin`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_histogram()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_histogram()` memanggil [ggplot2::geom_histogram()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = massa_tubuh_g)) +
#'   grf_geometrik_histogram(lebar_bin = 200, buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = massa_tubuh_g)) +
#'   ggplot2::geom_histogram(binwidth = 200, na.rm = TRUE)
#' @export
grf_geometrik_histogram <- function(pemetaan, data, statistik, posisi, ...,
                                    lebar_bin, jumlah_bin, orientasi,
                                    ujung_garis, sambungan_garis, buang_na,
                                    tampilkan_legenda, warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_histogram", .panggilan, .lingkungan)
}

#' Geometri kurva densitas
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_density()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param tipe_kontur Bagian kontur yang digambar: `"both"`, `"upper"`,
#'   `"lower"`, atau `"full"`. Asli: `outline.type`.
#' @param ujung_garis Gaya ujung garis: `"butt"`, `"round"`, atau `"square"`.
#'   Asli: `lineend`.
#' @param sambungan_garis Gaya sambungan garis: `"round"`, `"mitre"`, atau
#'   `"bevel"`. Asli: `linejoin`.
#' @param batas_sambungan Batas sambungan runcing. Asli: `linemitre`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_density()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_densitas()` memanggil [ggplot2::geom_density()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = massa_tubuh_g, warna = spesies)) +
#'   grf_geometrik_densitas(ketebalan_garis = 0.75, buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = massa_tubuh_g, colour = spesies)) +
#'   ggplot2::geom_density(linewidth = 0.75, na.rm = TRUE)
#' @export
grf_geometrik_densitas <- function(pemetaan, data, statistik, posisi, ...,
                                   tipe_kontur, ujung_garis, sambungan_garis,
                                   batas_sambungan, buang_na,
                                   tampilkan_legenda, warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_densitas", .panggilan, .lingkungan)
}

#' Geometri diagram kotak-garis (boxplot)
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_boxplot()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Argumen berpasangan `colour`/`color` pada fungsi asli
#' (misalnya `outlier.colour` dan `outlier.color`) hanya punya satu nama lokal
#' (`warna_pencilan`); nama asli keduanya tetap diterima, dan memberikan nama
#' lokal bersama nama aslinya menimbulkan galat konflik.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param pencilan Apakah pencilan digambar. Asli: `outliers`.
#' @param warna_pencilan Warna pencilan. Asli: `outlier.colour`.
#' @param isian_pencilan Warna isian pencilan. Asli: `outlier.fill`.
#' @param bentuk_pencilan Bentuk titik pencilan. Asli: `outlier.shape`.
#' @param ukuran_pencilan Ukuran titik pencilan. Asli: `outlier.size`.
#' @param ketebalan_tepi_pencilan Ketebalan tepi titik pencilan. Asli:
#'   `outlier.stroke`.
#' @param alfa_pencilan Opasitas titik pencilan. Asli: `outlier.alpha`.
#' @param warna_kumis Warna garis kumis. Asli: `whisker.colour`.
#' @param tipe_garis_kumis Tipe garis kumis. Asli: `whisker.linetype`.
#' @param ketebalan_garis_kumis Ketebalan garis kumis. Asli:
#'   `whisker.linewidth`.
#' @param warna_ujung_kumis Warna garis ujung kumis. Asli: `staple.colour`.
#' @param tipe_garis_ujung_kumis Tipe garis ujung kumis. Asli:
#'   `staple.linetype`.
#' @param ketebalan_garis_ujung_kumis Ketebalan garis ujung kumis. Asli:
#'   `staple.linewidth`.
#' @param warna_median Warna garis median. Asli: `median.colour`.
#' @param tipe_garis_median Tipe garis median. Asli: `median.linetype`.
#' @param ketebalan_garis_median Ketebalan garis median. Asli:
#'   `median.linewidth`.
#' @param warna_kotak Warna garis kotak. Asli: `box.colour`.
#' @param tipe_garis_kotak Tipe garis kotak. Asli: `box.linetype`.
#' @param ketebalan_garis_kotak Ketebalan garis kotak. Asli: `box.linewidth`.
#' @param takik Apakah kotak diberi takik. Asli: `notch`.
#' @param lebar_takik Lebar takik relatif terhadap kotak. Asli: `notchwidth`.
#' @param lebar_ujung_kumis Lebar garis ujung kumis relatif terhadap kotak.
#'   Asli: `staplewidth`.
#' @param lebar_variabel Apakah lebar kotak mengikuti jumlah pengamatan. Asli:
#'   `varwidth`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param orientasi Orientasi lapisan: `"x"`, `"y"`, atau `NA` (otomatis).
#'   Asli: `orientation`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_boxplot()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_boxplot()` memanggil [ggplot2::geom_boxplot()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = spesies, y = massa_tubuh_g)) +
#'   grf_geometrik_boxplot(warna_pencilan = "red", buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = spesies, y = massa_tubuh_g)) +
#'   ggplot2::geom_boxplot(outlier.colour = "red", na.rm = TRUE)
#' @export
grf_geometrik_boxplot <- function(pemetaan, data, statistik, posisi, ...,
                                  pencilan, warna_pencilan, isian_pencilan,
                                  bentuk_pencilan, ukuran_pencilan,
                                  ketebalan_tepi_pencilan, alfa_pencilan,
                                  warna_kumis, tipe_garis_kumis,
                                  ketebalan_garis_kumis, warna_ujung_kumis,
                                  tipe_garis_ujung_kumis,
                                  ketebalan_garis_ujung_kumis, warna_median,
                                  tipe_garis_median, ketebalan_garis_median,
                                  warna_kotak, tipe_garis_kotak,
                                  ketebalan_garis_kotak, takik, lebar_takik,
                                  lebar_ujung_kumis, lebar_variabel, buang_na,
                                  orientasi, tampilkan_legenda,
                                  warisi_estetika) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_boxplot", .panggilan, .lingkungan)
}

#' Geometri garis penghalus
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_smooth()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. `rentang` (asli: `span`), `tingkat_kepercayaan` (asli:
#' `level`), dan `rentang_penuh` (asli: `fullrange`) diterima fungsi asli
#' lewat `...` dan ikut diterjemahkan.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param metode Metode penghalusan, misalnya `"lm"` atau `"loess"`. Asli:
#'   `method`.
#' @param rumus Rumus yang dipakai untuk menghaluskan. Asli: `formula`.
#' @param selang_kepercayaan Apakah pita selang kepercayaan digambar. Asli:
#'   `se`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param orientasi Orientasi lapisan: `"x"`, `"y"`, atau `NA` (otomatis).
#'   Asli: `orientation`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#' @param rentang Tingkat kehalusan untuk metode `"loess"`. Asli: `span`.
#' @param tingkat_kepercayaan Tingkat kepercayaan untuk pita selang. Asli:
#'   `level`.
#' @param rentang_penuh Apakah penghalusan mencakup seluruh rentang sumbu.
#'   Asli: `fullrange`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_smooth()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_haluskan()` memanggil [ggplot2::geom_smooth()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_haluskan(metode = "lm", buang_na = TRUE)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_smooth(method = "lm", na.rm = TRUE)
#' @export
grf_geometrik_haluskan <- function(pemetaan, data, statistik, posisi, ...,
                                   metode, rumus, selang_kepercayaan,
                                   buang_na, orientasi, tampilkan_legenda,
                                   warisi_estetika, rentang,
                                   tingkat_kepercayaan, rentang_penuh) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_haluskan", .panggilan, .lingkungan)
}

#' Geometri heksagon (peta panas dua dimensi)
#'
#' Versi Bahasa Indonesia dari [ggplot2::geom_hex()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Memerlukan paket hexbin untuk menggambar plot. `jumlah_bin`
#' (asli: `bins`) dan `lebar_bin` (asli: `binwidth`) diterima fungsi asli
#' lewat `...`.
#'
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]; bila
#'   kosong, memakai pemetaan dari [vis_ggplot()]. Asli: `mapping`.
#' @param data Data untuk lapisan ini; bila kosong, memakai data dari
#'   [vis_ggplot()]. Sama dengan asli: `data`.
#' @param statistik Transformasi statistik, berupa nama atau objek stat. Asli:
#'   `stat`.
#' @param posisi Penyesuaian posisi, misalnya `"stack"`, `"fill"`, atau
#'   `"dodge"`. Asli: `position`.
#' @param ... Estetika tetap (misalnya `warna = "blue"`) dan argumen lain. Nama
#'   estetika lokal (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`,
#'   `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan; nama lain,
#'   termasuk nama asli berbahasa Inggris, diteruskan apa adanya.
#' @param ujung_garis Gaya ujung garis: `"butt"`, `"round"`, atau `"square"`.
#'   Asli: `lineend`.
#' @param sambungan_garis Gaya sambungan garis: `"round"`, `"mitre"`, atau
#'   `"bevel"`. Asli: `linejoin`.
#' @param batas_sambungan Batas sambungan runcing. Asli: `linemitre`.
#' @param buang_na Apakah nilai hilang dibuang tanpa peringatan. Asli: `na.rm`.
#' @param tampilkan_legenda Apakah lapisan masuk legenda: `NA` (otomatis),
#'   `TRUE`, atau `FALSE`. Asli: `show.legend`.
#' @param warisi_estetika Apakah pemetaan dari [vis_ggplot()] diwarisi. Asli:
#'   `inherit.aes`.
#' @param jumlah_bin Jumlah bin. Asli: `bins`.
#' @param lebar_bin Lebar tiap bin (rentang nilai). Asli: `binwidth`.
#'
#' @return Sebuah lapisan ggplot yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::geom_hex()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_geometrik_heksagon()` memanggil [ggplot2::geom_hex()].
#'
#' @examples
#' if (requireNamespace("hexbin", quietly = TRUE)) {
#'   penguin |>
#'     vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'     grf_geometrik_heksagon(jumlah_bin = 10, buang_na = TRUE)
#' }
#' @export
grf_geometrik_heksagon <- function(pemetaan, data, statistik, posisi, ...,
                                   ujung_garis, sambungan_garis,
                                   batas_sambungan, buang_na,
                                   tampilkan_legenda, warisi_estetika,
                                   jumlah_bin, lebar_bin) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_geometrik_heksagon", .panggilan, .lingkungan)
}

#' Faset terbungkus
#'
#' Versi Bahasa Indonesia dari [ggplot2::facet_wrap()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Memecah plot menjadi panel menurut satu atau beberapa variabel
#' dan membungkusnya menjadi baris dan kolom. `skala` (asli: `scales`)
#' menentukan apakah sumbu dibuat bebas per panel.
#'
#' @param faset Variabel faset, ditulis sebagai formula (misalnya `~pulau`)
#'   atau dengan `vars()`. Asli: `facets`.
#' @param jumlah_baris Jumlah baris panel. Asli: `nrow`.
#' @param jumlah_kolom Jumlah kolom panel. Asli: `ncol`.
#' @param skala Apakah skala sumbu dibuat bebas: `"fixed"`, `"free"`,
#'   `"free_x"`, atau `"free_y"`. Asli: `scales`.
#' @param ruang Apakah ukuran panel mengikuti skala: `"fixed"` atau `"free"`.
#'   Asli: `space`.
#' @param susutkan Apakah skala diciutkan mengikuti statistik, bukan data
#'   mentah. Asli: `shrink`.
#' @param pelabel Fungsi yang menyusun label strip faset. Asli: `labeller`.
#' @param urut_tabel Apakah panel disusun seperti tabel (nilai terkecil di kiri
#'   atas). Asli: `as.table`.
#' @param pindah_strip Pindahkan strip ke sisi lain: `"x"`, `"y"`, atau
#'   `"both"`. Asli: `switch`.
#' @param buang_kosong Apakah kombinasi faset yang tidak ada dibuang. Asli:
#'   `drop`.
#' @param arah Arah penyusunan panel. Asli: `dir`.
#' @param posisi_strip Posisi strip: `"top"`, `"bottom"`, `"left"`, atau
#'   `"right"`. Asli: `strip.position`.
#' @param sumbu Panel mana yang menampilkan sumbu: `"margins"`, `"all_x"`,
#'   `"all_y"`, atau `"all"`. Asli: `axes`.
#' @param label_sumbu Label sumbu yang ditampilkan: `"all"`, `"all_x"`,
#'   `"all_y"`, atau `"margins"`. Asli: `axis.labels`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::facet_wrap()].
#'
#' @return Sebuah objek faset yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::facet_wrap()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_faset_bungkus()` memanggil [ggplot2::facet_wrap()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_faset_bungkus(~pulau)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::facet_wrap(~pulau)
#' @export
grf_faset_bungkus <- function(faset, jumlah_baris, jumlah_kolom, skala, ruang,
                              susutkan, pelabel, urut_tabel, pindah_strip,
                              buang_kosong, arah, posisi_strip, sumbu,
                              label_sumbu, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_faset_bungkus", .panggilan, .lingkungan)
}

#' Faset berkisi
#'
#' Versi Bahasa Indonesia dari [ggplot2::facet_grid()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Memecah plot menjadi kisi panel menurut variabel baris dan
#' kolom. `jendela` dipilih sebagai padanan kata *grid*.
#'
#' @param baris Variabel faset untuk baris, ditulis sebagai formula atau dengan
#'   `vars()`. Asli: `rows`.
#' @param kolom Variabel faset untuk kolom, ditulis dengan `vars()`. Asli:
#'   `cols`.
#' @param skala Apakah skala sumbu dibuat bebas: `"fixed"`, `"free"`,
#'   `"free_x"`, atau `"free_y"`. Asli: `scales`.
#' @param ruang Apakah ukuran panel mengikuti skala: `"fixed"` atau `"free"`.
#'   Asli: `space`.
#' @param susutkan Apakah skala diciutkan mengikuti statistik, bukan data
#'   mentah. Asli: `shrink`.
#' @param pelabel Fungsi yang menyusun label strip faset. Asli: `labeller`.
#' @param urut_tabel Apakah panel disusun seperti tabel (nilai terkecil di kiri
#'   atas). Asli: `as.table`.
#' @param pindah_strip Pindahkan strip ke sisi lain: `"x"`, `"y"`, atau
#'   `"both"`. Asli: `switch`.
#' @param buang_kosong Apakah kombinasi faset yang tidak ada dibuang. Asli:
#'   `drop`.
#' @param marjin Apakah panel margin (total) ditambahkan. Asli: `margins`.
#' @param sumbu Panel mana yang menampilkan sumbu: `"margins"`, `"all_x"`,
#'   `"all_y"`, atau `"all"`. Asli: `axes`.
#' @param label_sumbu Label sumbu yang ditampilkan: `"all"`, `"all_x"`,
#'   `"all_y"`, atau `"margins"`. Asli: `axis.labels`.
#' @param faset Variabel faset, ditulis sebagai formula (misalnya `~pulau`)
#'   atau dengan `vars()`. Asli: `facets`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::facet_grid()].
#'
#' @return Sebuah objek faset yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::facet_grid()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_faset_jendela()` memanggil [ggplot2::facet_grid()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_faset_jendela(pulau ~ .)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::facet_grid(pulau ~ .)
#' @export
grf_faset_jendela <- function(baris, kolom, skala, ruang, susutkan, pelabel,
                              urut_tabel, pindah_strip, buang_kosong, marjin,
                              sumbu, label_sumbu, faset, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_faset_jendela", .panggilan, .lingkungan)
}

#' Skala sumbu x kontinu
#'
#' Versi Bahasa Indonesia dari [ggplot2::scale_x_continuous()]. Hanya nama
#' fungsi dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama
#' dengan fungsi asli.
#'
#' @param nama Judul sumbu. Asli: `name`.
#' @param posisi_tanda Posisi tanda pada sumbu. Asli: `breaks`.
#' @param posisi_tanda_minor Posisi tanda minor pada sumbu. Asli:
#'   `minor_breaks`.
#' @param jumlah_tanda Jumlah tanda yang diinginkan. Asli: `n.breaks`.
#' @param label_tanda Label tanda pada sumbu. Asli: `labels`.
#' @param batas Batas bawah dan atas sumbu. Asli: `limits`.
#' @param perluasan Perluasan rentang sumbu. Asli: `expand`.
#' @param luar_batas Fungsi untuk menangani nilai di luar batas. Asli: `oob`.
#' @param nilai_na Nilai yang dipakai untuk `NA`. Asli: `na.value`.
#' @param transformasi Transformasi sumbu, berupa nama atau objek transformasi.
#'   Asli: `transform`.
#' @param trans Nama lama untuk `transform` (usang); namanya tidak
#'   diterjemahkan. Sama dengan asli: `trans`.
#' @param panduan Panduan sumbu atau legenda. Asli: `guide`.
#' @param posisi Posisi sumbu: `"bottom"` atau `"top"`. Asli: `position`.
#' @param sumbu_sekunder Sumbu sekunder. Asli: `sec.axis`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::scale_x_continuous()].
#'
#' @return Sebuah objek skala yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::scale_x_continuous()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_skala_x_kontinu()` memanggil [ggplot2::scale_x_continuous()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_skala_x_kontinu(posisi_tanda = seq(170, 230, by = 20))
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::scale_x_continuous(breaks = seq(170, 230, by = 20))
#' @export
grf_skala_x_kontinu <- function(nama, posisi_tanda, posisi_tanda_minor,
                                jumlah_tanda, label_tanda, batas, perluasan,
                                luar_batas, nilai_na, transformasi, trans,
                                panduan, posisi, sumbu_sekunder, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_skala_x_kontinu", .panggilan, .lingkungan)
}

#' Skala sumbu y terbalik
#'
#' Versi Bahasa Indonesia dari [ggplot2::scale_y_reverse()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Argumen skala kontinu (misalnya `nama`, `posisi_tanda`,
#' `batas`) diterima fungsi asli lewat `...` dan ikut diterjemahkan.
#'
#' @param ... Argumen lain, diteruskan apa adanya ke
#'   [ggplot2::scale_y_reverse()].
#' @param nama Judul sumbu. Asli: `name`.
#' @param posisi_tanda Posisi tanda pada sumbu. Asli: `breaks`.
#' @param posisi_tanda_minor Posisi tanda minor pada sumbu. Asli:
#'   `minor_breaks`.
#' @param jumlah_tanda Jumlah tanda yang diinginkan. Asli: `n.breaks`.
#' @param label_tanda Label tanda pada sumbu. Asli: `labels`.
#' @param batas Batas bawah dan atas sumbu. Asli: `limits`.
#' @param perluasan Perluasan rentang sumbu. Asli: `expand`.
#' @param luar_batas Fungsi untuk menangani nilai di luar batas. Asli: `oob`.
#' @param nilai_na Nilai yang dipakai untuk `NA`. Asli: `na.value`.
#' @param panduan Panduan sumbu atau legenda. Asli: `guide`.
#' @param posisi Posisi sumbu: `"left"` atau `"right"`. Asli: `position`.
#' @param sumbu_sekunder Sumbu sekunder. Asli: `sec.axis`.
#'
#' @return Sebuah objek skala yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::scale_y_reverse()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_skala_y_balik()` memanggil [ggplot2::scale_y_reverse()].
#'
#' @examples
#' d <- inp_tibble(a = 1:5, b = c(2, 4, 3, 6, 5), g = c("u", "v", "u", "v", "u"))
#' vis_ggplot(d, grf_estetika(x = a, y = b)) +
#'   grf_geometrik_titik() +
#'   grf_skala_y_balik()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_y_reverse()
#' @export
grf_skala_y_balik <- function(..., nama, posisi_tanda, posisi_tanda_minor,
                              jumlah_tanda, label_tanda, batas, perluasan,
                              luar_batas, nilai_na, panduan, posisi,
                              sumbu_sekunder) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_skala_y_balik", .panggilan, .lingkungan)
}

#' Skala warna ramah buta warna
#'
#' Versi Bahasa Indonesia dari [ggthemes::scale_color_colorblind()]. Hanya
#' nama fungsi dan nama argumen yang diterjemahkan; perilaku dan nilai argumen
#' sama dengan fungsi asli. Memakai palet yang dapat dibedakan oleh orang
#' dengan buta warna. Fungsi ini memerlukan paket ggthemes, yang dipasang
#' terpisah. Padanan untuk estetika isian (`scale_fill_colorblind()`) tidak
#' dibungkus karena sudah ditandai usang di ggthemes 5.2.0.
#'
#' @param hitam Padanan argumen `black` pada
#'   [ggthemes::scale_color_colorblind()]; lihat dokumentasi fungsi asli. Asli:
#'   `black`.
#' @param ... Argumen lain, diteruskan apa adanya ke
#'   [ggthemes::scale_color_colorblind()].
#'
#' @return Sebuah objek skala yang ditambahkan dengan `+`, sama seperti
#'   [ggthemes::scale_color_colorblind()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_skalawarna_butawarna()` memanggil
#' [ggthemes::scale_color_colorblind()]. Paket ggthemes tidak otomatis
#' terpasang; bila belum ada, fungsi ini memberi pesan yang menjelaskan cara
#' memasangnya.
#'
#' @examples
#' if (requireNamespace("ggthemes", quietly = TRUE)) {
#'   penguin |>
#'     vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies)) +
#'     grf_geometrik_titik(buang_na = TRUE) +
#'     grf_skalawarna_butawarna()
#' }
#' @export
grf_skalawarna_butawarna <- function(hitam, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_skalawarna_butawarna", .panggilan, .lingkungan)
}

#' Tema abu-abu (bawaan ggplot2)
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_grey()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Padanan `theme_grey()`. Fungsi `theme_gray()` pada ggplot2
#' adalah nama lain yang sama dan tidak dibungkus terpisah.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_grey()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_grey()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_abu()` memanggil [ggplot2::theme_grey()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_abu()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_grey()
#' @export
grf_tema_abu <- function(ukuran_dasar, keluarga_font_dasar,
                         keluarga_font_judul, ketebalan_garis_dasar,
                         ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_abu", .panggilan, .lingkungan)
}

#' Tema hitam-putih
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_bw()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Latar putih dengan garis kisi abu-abu dan bingkai hitam.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_bw()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_bw()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_hitamputih()` memanggil [ggplot2::theme_bw()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_hitamputih()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_bw()
#' @export
grf_tema_hitamputih <- function(ukuran_dasar, keluarga_font_dasar,
                                keluarga_font_judul, ketebalan_garis_dasar,
                                ukuran_persegi_dasar, tinta, kertas, aksen,
                                ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_hitamputih", .panggilan, .lingkungan)
}

#' Tema gambar garis
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_linedraw()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Hanya garis hitam dengan ketebalan berbeda-beda.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_linedraw()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_linedraw()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_gambar_garis()` memanggil [ggplot2::theme_linedraw()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_gambar_garis()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_linedraw()
#' @export
grf_tema_gambar_garis <- function(ukuran_dasar, keluarga_font_dasar,
                                  keluarga_font_judul, ketebalan_garis_dasar,
                                  ukuran_persegi_dasar, tinta, kertas, aksen,
                                  ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_gambar_garis", .panggilan, .lingkungan)
}

#' Tema terang
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_light()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Garis dan bingkai berwarna abu-abu terang.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_light()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_light()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_terang()` memanggil [ggplot2::theme_light()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_terang()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_light()
#' @export
grf_tema_terang <- function(ukuran_dasar, keluarga_font_dasar,
                            keluarga_font_judul, ketebalan_garis_dasar,
                            ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_terang", .panggilan, .lingkungan)
}

#' Tema gelap
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_dark()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Kebalikan tema terang: latar panel gelap.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_dark()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_dark()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_gelap()` memanggil [ggplot2::theme_dark()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_gelap()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_dark()
#' @export
grf_tema_gelap <- function(ukuran_dasar, keluarga_font_dasar,
                           keluarga_font_judul, ketebalan_garis_dasar,
                           ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_gelap", .panggilan, .lingkungan)
}

#' Tema minimal
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_minimal()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Tanpa bingkai dan latar.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_minimal()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_minimal()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_minimal()` memanggil [ggplot2::theme_minimal()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_minimal()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_minimal()
#' @export
grf_tema_minimal <- function(ukuran_dasar, keluarga_font_dasar,
                             keluarga_font_judul, ketebalan_garis_dasar,
                             ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_minimal", .panggilan, .lingkungan)
}

#' Tema klasik
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_classic()]. Hanya nama fungsi
#' dan nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Hanya garis sumbu, tanpa garis kisi.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_classic()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_classic()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_klasik()` memanggil [ggplot2::theme_classic()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_klasik()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_classic()
#' @export
grf_tema_klasik <- function(ukuran_dasar, keluarga_font_dasar,
                            keluarga_font_judul, ketebalan_garis_dasar,
                            ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_klasik", .panggilan, .lingkungan)
}

#' Tema kosong
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_void()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Tanpa sumbu, garis kisi, dan latar.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_void()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_void()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_kosong()` memanggil [ggplot2::theme_void()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_kosong()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_void()
#' @export
grf_tema_kosong <- function(ukuran_dasar, keluarga_font_dasar,
                            keluarga_font_judul, ketebalan_garis_dasar,
                            ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_kosong", .panggilan, .lingkungan)
}

#' Tema uji
#'
#' Versi Bahasa Indonesia dari [ggplot2::theme_test()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Dipakai oleh pengembang ggplot2 untuk menguji; jarang dipakai
#' pengguna.
#'
#' @param ukuran_dasar Ukuran dasar huruf. Asli: `base_size`.
#' @param keluarga_font_dasar Keluarga huruf dasar. Asli: `base_family`.
#' @param keluarga_font_judul Keluarga huruf judul. Asli: `header_family`.
#' @param ketebalan_garis_dasar Ketebalan garis dasar. Asli: `base_line_size`.
#' @param ukuran_persegi_dasar Ketebalan garis persegi dasar. Asli:
#'   `base_rect_size`.
#' @param tinta Warna tinta (garis dan teks). Asli: `ink`.
#' @param kertas Warna kertas (latar). Asli: `paper`.
#' @param aksen Warna aksen. Asli: `accent`.
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::theme_test()].
#'
#' @return Sebuah objek tema yang ditambahkan dengan `+`, sama seperti
#'   [ggplot2::theme_test()].
#'
#' @section Padanan dengan fungsi asli:
#' `grf_tema_uji()` memanggil [ggplot2::theme_test()].
#'
#' @examples
#' penguin |>
#'   vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   grf_geometrik_titik(buang_na = TRUE) +
#'   grf_tema_uji()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(penguin, ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g)) +
#'   ggplot2::geom_point(na.rm = TRUE) +
#'   ggplot2::theme_test()
#' @export
grf_tema_uji <- function(ukuran_dasar, keluarga_font_dasar,
                         keluarga_font_judul, ketebalan_garis_dasar,
                         ukuran_persegi_dasar, tinta, kertas, aksen, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("grf_tema_uji", .panggilan, .lingkungan)
}
