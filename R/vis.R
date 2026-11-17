# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Buat plot baru
#'
#' Versi Bahasa Indonesia dari [ggplot2::ggplot()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Hasilnya adalah objek ggplot biasa, sehingga komponen lokal (`grf_*`)
#' dan komponen asli (`geom_*`, `theme_*`, dan lain-lain) dapat dicampur
#' dengan `+`.
#'
#' @param data Tabel data. Sama dengan asli: `data`.
#' @param pemetaan Pemetaan estetika, dibuat dengan [grf_estetika()]. Asli:
#'   `mapping`.
#' @param ... Argumen lain, diteruskan apa adanya ke [ggplot2::ggplot()].
#' @param lingkungan Lingkungan untuk mencari variabel. Asli: `environment`.
#'
#' @return Sebuah objek ggplot.
#'
#' @section Padanan dengan fungsi asli:
#' `vis_ggplot()` memanggil [ggplot2::ggplot()].
#'
#' @examples
#' d <- inp_tibble(a = 1:5, b = c(2, 4, 3, 6, 5), g = c("u", "v", "u", "v", "u"))
#' vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik()
#'
#' # Setara dengan kode standar:
#' ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) + ggplot2::geom_point()
#' @export
vis_ggplot <- function(data, pemetaan, ..., lingkungan) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("vis_ggplot", .panggilan, .lingkungan)
}

#' Simpan plot ke berkas
#'
#' Versi Bahasa Indonesia dari [ggplot2::ggsave()]. Hanya nama fungsi dan nama
#' argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan fungsi
#' asli. Nama berkas dikembalikan secara tak terlihat, sama seperti fungsi
#' asli. Argumen `skala_gambar` (asli: `scale`) berbeda dari `skala` pada
#' faset.
#'
#' @param nama_berkas Nama atau lokasi berkas hasil, termasuk ekstensi
#'   (misalnya `.png`). Asli: `filename`.
#' @param plot Plot yang disimpan; bawaannya plot terakhir. Sama dengan asli:
#'   `plot`.
#' @param perangkat Perangkat grafis atau ekstensi berkas. Asli: `device`.
#' @param lokasi Folder tujuan. Asli: `path`.
#' @param skala_gambar Faktor skala gambar. Asli: `scale`.
#' @param lebar Lebar gambar. Asli: `width`.
#' @param tinggi Tinggi gambar. Asli: `height`.
#' @param satuan Satuan lebar dan tinggi: `"in"`, `"cm"`, `"mm"`, atau `"px"`.
#'   Asli: `units`.
#' @param dpi Resolusi dalam titik per inci. Sama dengan asli: `dpi`.
#' @param batasi_ukuran Apakah ukuran gambar dibatasi. Asli: `limitsize`.
#' @param latar Warna latar. Asli: `bg`.
#' @param buat_dir Apakah folder tujuan dibuat bila belum ada. Asli:
#'   `create.dir`.
#' @param ... Argumen lain, diteruskan apa adanya ke [ggplot2::ggsave()].
#'
#' @return Nama berkas, secara tak terlihat, sama seperti [ggplot2::ggsave()].
#'
#' @section Padanan dengan fungsi asli:
#' `vis_ggplot_simpan()` memanggil [ggplot2::ggsave()].
#'
#' @examples
#' d <- inp_tibble(a = 1:5, b = c(2, 4, 3, 6, 5), g = c("u", "v", "u", "v", "u"))
#' p <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik()
#' berkas <- file.path(tempdir(), "plot-contoh.png")
#' vis_ggplot_simpan(berkas, plot = p, lebar = 4, tinggi = 3)
#'
#' # Setara dengan kode standar:
#' ggplot2::ggsave(berkas, plot = p, width = 4, height = 3)
#' @export
vis_ggplot_simpan <- function(nama_berkas, plot, perangkat, lokasi,
                              skala_gambar, lebar, tinggi, satuan, dpi,
                              batasi_ukuran, latar, buat_dir, ...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  invisible(.panggil_asli("vis_ggplot_simpan", .panggilan, .lingkungan))
}

#' Ambil plot terakhir
#'
#' Versi Bahasa Indonesia dari [ggplot2::last_plot()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli.
#'
#' @param ... Tempat argumen berbahasa Inggris (nama asli), yang diteruskan apa
#'   adanya ke [ggplot2::last_plot()].
#'
#' @return Plot terakhir yang dibuat atau diubah, sama seperti
#'   [ggplot2::last_plot()].
#'
#' @section Padanan dengan fungsi asli:
#' `vis_ggplot_terakhir()` memanggil [ggplot2::last_plot()].
#'
#' @examples
#' d <- inp_tibble(a = 1:5, b = c(2, 4, 3, 6, 5), g = c("u", "v", "u", "v", "u"))
#' vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik()
#' vis_ggplot_terakhir()
#'
#' # Setara dengan kode standar:
#' ggplot2::last_plot()
#' @export
vis_ggplot_terakhir <- function(...) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("vis_ggplot_terakhir", .panggilan, .lingkungan)
}
