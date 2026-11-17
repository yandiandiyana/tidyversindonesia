# Kompatibilitas R4DS 2e, Bab 6 (Workflow: scripts and projects).
# Contoh berkode: menyaring penerbangan yang tidak dibatalkan, `getwd()`/`setwd()`, dan skrip
# diamonds (plot heksagon, simpan gambar, tulis CSV). Contoh `usethis::use_blank_slate()`
# berada di luar cakupan pembungkus.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

filter <- dplyr::filter
group_by <- dplyr::group_by
summarize <- dplyr::summarize
ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_hex <- ggplot2::geom_hex
ggsave <- ggplot2::ggsave
write_csv <- readr::write_csv
diamonds <- ggplot2::diamonds
if (requireNamespace("nycflights13", quietly = TRUE)) flights <- nycflights13::flights

senyap <- function(x) suppressMessages(x)
isi_kolom <- function(d) unname(lapply(seq_len(ncol(d)), function(i) d[[i]]))
sama_tabel <- function(lokal, asli, info = NULL) {
  a <- isi_kolom(lokal)
  b <- isi_kolom(asli)
  if (identical(a, b)) succeed() else expect_equal(a, b, info = info)
  expect_identical(dim(lokal), dim(asli), info = info)
}

test_that("Bab 6.1.1: not_cancelled dan ringkasan per hari", {
  skip_if_not_installed("nycflights13")
  not_cancelled <- flights |>
    filter(!is.na(dep_delay), !is.na(arr_delay))
  tidak_dibatalkan <- penerbangan |>
    trn_filter(!dsr_adalah_na(keterlambatan_berangkat), !dsr_adalah_na(keterlambatan_tiba))
  sama_tabel(tidak_dibatalkan, not_cancelled)

  sama_tabel(
    tidak_dibatalkan |>
      trn_gabung_kelompok(tahun, bulan, hari) |>
      trn_statistik_ringkas(rerata = dsr_rerata(keterlambatan_berangkat)) |>
      senyap(),
    not_cancelled |>
      group_by(year, month, day) |>
      summarize(mean = mean(dep_delay)) |>
      senyap()
  )
})

test_that("Bab 6.2: direktori kerja", {
  expect_identical(dsr_dir_kerja(), getwd())
  lama <- getwd()
  hasil <- withVisible(dsr_set_dir_kerja(tempdir()))
  expect_false(hasil$visible)
  expect_equal(normalizePath(getwd()), normalizePath(tempdir()))
  dsr_set_dir_kerja(lama)
  expect_identical(getwd(), lama)
})

test_that("Bab 6.1.1: skrip diamonds (heksagon, simpan gambar, tulis CSV)", {
  skip_if_not_installed("hexbin")
  asli <- ggplot(diamonds, aes(x = carat, y = price)) + geom_hex()
  lokal <- vis_ggplot(berlian, grf_estetika(x = karat, y = harga)) + grf_geometrik_heksagon()
  expect_equal(
    suppressWarnings(ggplot2::layer_data(lokal)),
    suppressWarnings(ggplot2::layer_data(asli))
  )

  f_asli <- file.path(tempdir(), "diamonds-asli.png")
  f_lokal <- file.path(tempdir(), "diamonds-lokal.png")
  ggsave(f_asli, plot = asli)
  vis_ggplot_simpan(f_lokal, plot = lokal)
  expect_true(file.exists(f_lokal))
  expect_equal(file.size(f_lokal), file.size(f_asli), tolerance = 0.05)
})

test_that("Bab 6.1.1: write_csv(diamonds) menjadi inp_tulis_csv(berlian)", {
  csv_asli <- tempfile(fileext = ".csv")
  csv_lokal <- tempfile(fileext = ".csv")
  write_csv(diamonds, csv_asli)
  inp_tulis_csv(berlian, csv_lokal)
  baris_asli <- readLines(csv_asli)
  baris_lokal <- readLines(csv_lokal)
  expect_identical(length(baris_lokal), length(baris_asli))
  expect_identical(length(baris_lokal), nrow(diamonds) + 1L)
  # `cut` diterjemahkan; kolom lain identik. Bandingkan lewat pembacaan ulang.
  asli <- senyap(imp_baca_csv(csv_asli, tampilkan_tipe_kolom = FALSE))
  lokal <- senyap(imp_baca_csv(csv_lokal, tampilkan_tipe_kolom = FALSE))
  expect_identical(dim(lokal), dim(asli))
  for (i in setdiff(seq_len(ncol(asli)), 2L)) {
    expect_identical(lokal[[i]], asli[[i]], info = names(lokal)[i])
  }
  peta <- c(Fair = "Cukup", Good = "Baik", `Very Good` = "Sangat Baik", Premium = "Premium", Ideal = "Ideal")
  expect_identical(lokal[[2]], unname(peta[asli[[2]]]))
})

test_that("Bab 6.1.1: `x y <- 10` adalah galat sintaksis di R, dan `3 == NA` adalah NA", {
  expect_error(parse(text = "x y <- 10"))
  expect_identical(3 == NA, NA)
  expect_identical(dsr_adalah_na(NA), TRUE)
})
