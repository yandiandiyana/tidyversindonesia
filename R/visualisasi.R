# ============================================================================
# BAGIAN 4: VISUALISASI (Visualize)
# ============================================================================

#' Membuat grafik/plot dari ggplot
#'
#' Padanan fungsi `ggplot2::ggplot()`
#'
#' @param data Data frame atau tibble yang akan divisualisasikan.
#' @param mapping Pemetaan estetika, biasanya dibuat dengan `estetika()`.
#' @param ... Argumen tambahan untuk `ggplot2::ggplot()`.
#'
#' @return Objek `ggplot` yang dapat ditambahkan layer visualisasi.
#'
#' @examples
#' # Grafik kosong
#' visualisasi_ggplot(penguin)
#'
#' # Grafik dengan pemetaan estetika
#' visualisasi_ggplot(penguin, estetika(x = mpg, y = hp))
#'
#' @export
#' @seealso [ggplot2::ggplot()]
#' @family visualisasi
visualisasi_ggplot <- function(data, mapping = NULL, ...) {

  if (is.null(mapping)) {
    ggplot2::ggplot(data = data, ...)
  } else {
    ggplot2::ggplot(
      data = data,
      mapping = mapping,
      ...
    )
  }

}

#' Menentukan pemetaan estetika visualisasi
#'
#' Padanan fungsi `ggplot2::aes()`
#'
#' @param ... Pemetaan estetika seperti `x`, `y`, `color`, `shape`, dan `size`
#'
#' @return Objek pemetaan estetika (`aes`)
#' @examples
#' estetika(x = mpg, y = hp)
#'
#' @export
#' @seealso [ggplot2::aes()]
#' @family visualisasi
estetika <- function(...) {
  ggplot2::aes(...)
}

#' Menambahkan layer titik (scatter plot)
#'
#' Padanan fungsi `ggplot2::geom_point()`
#'
#' @param mapping Pemetaan estetika tambahan untuk layer ini (opsional)
#' @param ... Argumen tambahan
#'
#' @return Layer titik
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) + grafik_geometrik_titik()
#'
#' @export
#' @seealso [ggplot2::geom_point()]
#' @family visualisasi
grafik_geometrik_titik <- function(mapping = NULL, ...) {
  ggplot2::geom_point(mapping = mapping, ...)
}

#' Membuat diagram batang (bar chart)
#'
#' Padanan fungsi `ggplot2::geom_bar()`
#'
#' @param mapping Pemetaan estetika
#' @param ... Argumen tambahan
#'
#' @return Layer diagram batang
#' @examples
#' visualisasi_ggplot(penguin, estetika(x = factor(cyl))) + grafik_geometrik_batang()
#'
#' @export
#' @seealso [ggplot2::geom_bar()]
#' @family visualisasi
grafik_geometrik_batang <- function(mapping = NULL, ...) {
  ggplot2::geom_bar(mapping = mapping, ...)
}

#' Membuat histogram
#'
#' Padanan fungsi `ggplot2::geom_histogram()`
#'
#' @param mapping Pemetaan estetika
#' @param bins Jumlah batang histogram
#' @param ... Argumen tambahan
#'
#' @return Layer histogram
#' @examples
#' visualisasi_ggplot(penguin, estetika(x = mpg)) + grafik_geometrik_histogram(bins = 10)
#'
#' @export
#' @seealso [ggplot2::geom_histogram()]
#' @family visualisasi
grafik_geometrik_histogram <- function(mapping = NULL, bins = NULL, ...) {
  ggplot2::geom_histogram(mapping = mapping, bins = bins, ...)
}

#' Membuat plot densitas (density plot)
#'
#' Padanan fungsi `ggplot2::geom_density()`
#'
#' @param mapping Pemetaan estetika
#' @param ... Argumen tambahan
#'
#' @return Layer plot densitas
#' @examples
#' visualisasi_ggplot(penguin, estetika(x = mpg)) + grafik_geometrik_densitas()
#'
#' @export
#' @seealso [ggplot2::geom_density()]
#' @family visualisasi
grafik_geometrik_densitas <- function(mapping = NULL, ...) {
  ggplot2::geom_density(mapping = mapping, ...)
}

#' Membuat boxplot
#'
#' Padanan fungsi `ggplot2::geom_boxplot()`
#'
#' @param mapping Pemetaan estetika
#' @param ... Argumen tambahan
#'
#' @return Layer boxplot
#' @examples
#' visualisasi_ggplot(penguin, estetika(x = factor(cyl), y = mpg)) +
#'   grafik_geometrik_boxplot()
#'
#' @export
#' @seealso [ggplot2::geom_boxplot()]
#' @family visualisasi
grafik_geometrik_boxplot <- function(mapping = NULL, ...) {
  ggplot2::geom_boxplot(mapping = mapping, ...)
}

#' Menambahkan garis tren
#'
#' Padanan fungsi `ggplot2::geom_smooth()`
#'
#' @param mapping Pemetaan estetika tambahan (opsional)
#' @param method Metode pemodelan seperti `"lm"`
#' @param ... Argumen tambahan
#'
#' @return Layer garis semulus (tren)
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_geometrik_tren(method = "lm")
#'
#' @export
#' @seealso [ggplot2::geom_smooth()]
#' @family visualisasi
grafik_geometrik_tren <- function(mapping = NULL, method = NULL, ...) {
  ggplot2::geom_smooth(mapping = mapping, method = method, ...)
}

#' Menambahkan label dan judul pada grafik
#'
#' Padanan fungsi `ggplot2::labs()`
#'
#' @param title Judul utama
#' @param subtitle Subjudul
#' @param x Label sumbu X
#' @param y Label sumbu Y
#' @param color Label legenda warna
#' @param shape Label legenda bentuk
#' @param ... Argumen tambahan
#'
#' @return Layer label
#' @examples
#' \donttest{
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_geometrik_titik() +
#'   grafik_label(title = "Hubungan MPG dan HP", x = "MPG", y = "HP")
#' }
#'
#' @export
#' @seealso [ggplot2::labs()]
#' @family visualisasi
grafik_label <- function(title = NULL, subtitle = NULL, x = NULL, y = NULL, color = NULL, shape = NULL, ...) {
  ggplot2::labs(title = title, subtitle = subtitle, x = x, y = y, color = color, shape = shape, ...)
}

#' Facet dengan kolom
#'
#' Padanan fungsi `ggplot2::facet_wrap()`
#'
#' @param facets Formula untuk pemisahan
#' @param ... Argumen tambahan
#'
#' @return Layer facet
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_geometrik_titik() +
#'   grafik_facet_kolom(~ cyl)
#'
#' @export
#' @seealso [ggplot2::facet_wrap()]
#' @family visualisasi
grafik_facet_kolom <- function(facets, ...) {
  ggplot2::facet_wrap(facets, ...)
}

#' Facet baris dan kolom
#'
#' Padanan fungsi `ggplot2::facet_grid()`
#'
#' @param rows Variabel baris
#' @param cols Variabel kolom
#' @param ... Argumen tambahan
#'
#' @return Layer grid facet
#'
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_geometrik_titik() +
#'   grafik_facet_baris_kolom(
#'     rows = ggplot2::vars(cyl),
#'     cols = ggplot2::vars(gear)
#'   )
#'
#' @importFrom ggplot2 vars
#' @export
#' @seealso [ggplot2::facet_grid()]
#' @family visualisasi
grafik_facet_baris_kolom <- function(rows = NULL, cols = NULL, ...) {
  ggplot2::facet_grid(rows = rows, cols = cols, ...)
}

#' Membuat grafik dengan tema minimal
#'
#' Padanan fungsi `ggplot2::theme_minimal()`
#'
#' @return Tema minimal
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_geometrik_titik() +
#'   grafik_tema_minimal()
#'
#' @family visualisasi
#' @export
grafik_tema_minimal <- function() {
  ggplot2::theme_minimal()
}

#' Membuat grafik dengan tema klasik
#'
#' Padanan fungsi `ggplot2::theme_classic()`
#'
#' @return Tema klasik
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_tema_klasik()
#'
#' @family visualisasi
#' @export
grafik_tema_klasik <- function() {
  ggplot2::theme_classic()
}

#' Membuat grafik dengan tema ringan
#'
#' Padanan fungsi `ggplot2::theme_light()`
#'
#' @return Tema light
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_tema_ringan()
#'
#' @family visualisasi
#' @export
grafik_tema_ringan <- function() {
  ggplot2::theme_light()
}

#' Membuat grafik dengan tema gelap
#'
#' Padanan fungsi `ggplot2::theme_dark()`
#'
#' @return Tema dark
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_tema_gelap()
#'
#' @family visualisasi
#' @export
grafik_tema_gelap <- function() {
  ggplot2::theme_dark()
}

#' Membuat grafik dengan tema hampa
#'
#' Padanan fungsi `ggplot2::theme_void()`
#'
#' @return Tema void
#' @examples
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) +
#'   grafik_tema_hampa()
#'
#' @family visualisasi
#' @export
grafik_tema_hampa <- function() {
  ggplot2::theme_void()
}

#' Menyimpan visualisasi ke file
#'
#' Padanan fungsi `ggplot2::ggsave()`
#'
#' @param filename Nama file
#' @param plot Objek ggplot
#' @param width,height Ukuran gambar (inci).
#' @param dpi Resolusi
#' @param ... Argumen tambahan
#'
#' @return File gambar tersimpan
#' @examples
#' \dontrun{
#' p <- visualisasi_ggplot(penguin, estetika(mpg, hp)) + grafik_geometrik_titik()
#' visualisasi_ggplot_simpan("contoh_plot.png", plot = p, width = 4, height = 3)
#' }
#'
#' @family visualisasi
#' @export
visualisasi_ggplot_simpan <- function(filename, plot = ggplot2::last_plot(), width = NULL, height = NULL, dpi = 300, ...) {
  ggplot2::ggsave(filename = filename, plot = plot, width = width, height = height, dpi = dpi, ...)
}

#' Menampilkan plot ggplot terakhir
#'
#' Padanan fungsi `ggplot2::last_plot()`
#'
#' @return Objek ggplot terakhir
#' @examples
#' \donttest{
#' visualisasi_ggplot(penguin, estetika(mpg, hp)) + grafik_geometrik_titik()
#' visualisasi_ggplot_terakhir()
#' }
#'
#' @family visualisasi
#' @export
visualisasi_ggplot_terakhir <- function() {
  ggplot2::last_plot()
}
