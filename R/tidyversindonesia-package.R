#' tidyversindonesia: Antarmuka Berbahasa Indonesia untuk Belajar R dan Tidyverse
#'
#' Paket pendidikan untuk pemula berbahasa Indonesia. Fungsi-fungsinya adalah
#' pembungkus tipis atas fungsi tidyverse dengan nama fungsi dan nama
#' argumen berbahasa Indonesia. Perilaku fungsi asli dipertahankan, dan setiap
#' fungsi mendokumentasikan padanan aslinya sehingga pelajar dapat berpindah
#' ke kode R standar.
#'
#' @section Keluarga fungsi:
#' * `imp_`: mengimpor data dari berkas.
#' * `inp_`: memasukkan data (membuat tabel di R).
#' * `rpi_`: merapikan data (*tidying*).
#' * `trn_`: transformasi data; `frm_`: pendukung di dalam `trn_`.
#' * `vis_`: membuat objek plot; `grf_`: komponen yang ditambahkan ke plot.
#' * `dsr_`: fungsi dasar R; `dtr_`: inspeksi data.
#'
#' @keywords internal
"_PACKAGE"

# Fungsi asli dipanggil lewat panggilan yang disusun secara dinamis, sehingga
# R CMD check tidak dapat melihat bahwa paket-paket di Imports dipakai. Fungsi
# ini hanya menyebut mereka dengan `::` agar terdeteksi. Tidak pernah dipanggil.
.gunakan_impor <- function() {
  dplyr::filter
  ggplot2::ggplot
  readr::read_csv
  tibble::tibble
  tidyr::pivot_longer
  tidyselect::starts_with
  stats::rnorm
  utils::head
  # dataset sumber, dibuat saat dipakai (lihat R/dataset_lazy.R)
  nycflights13::flights
  datasets::mtcars
  invisible(NULL)
}
