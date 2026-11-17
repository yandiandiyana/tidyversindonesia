# Dataset `mobil` (dari datasets::mtcars): alur kerja nyata.
#
# Uji struktur dan nilai ada di test-data-3d.R (dihasilkan generator). Berkas ini
# menguji `mobil` bersama fungsi lokal: transformasi, inspeksi, dan visualisasi,
# dibandingkan dengan kode tidyverse standar pada `datasets::mtcars`.

test_that("mobil: nama baris menjadi kolom pertama dan tidak ada nama baris tersisa", {
  expect_identical(names(mobil)[1], "mobil")
  expect_type(mobil$mobil, "character")
  expect_identical(mobil$mobil[1], "Mazda RX4")
  expect_identical(mobil$mobil, rownames(datasets::mtcars))
  expect_false(tibble::has_rownames(mobil))
})

test_that("mobil: alur transformasi setara kode standar", {
  lokal <- mobil |>
    trn_filter(silinder == 4) |>
    trn_urutkan(frm_turun(efisiensi_mpg)) |>
    trn_pilih(mobil, efisiensi_mpg)

  asli <- tibble::rownames_to_column(datasets::mtcars, "mobil") |>
    dplyr::filter(cyl == 4) |>
    dplyr::arrange(dplyr::desc(mpg)) |>
    dplyr::select(mobil, mpg)

  expect_equal(unname(as.list(lokal)), unname(as.list(asli)))
  expect_identical(nrow(lokal), 11L)
})

test_that("mobil: ringkasan per kelompok setara kode standar", {
  lokal <- mobil |>
    trn_gabung_kelompok(silinder) |>
    trn_statistik_ringkas(rerata_mpg = dsr_rerata(efisiensi_mpg))

  asli <- datasets::mtcars |>
    dplyr::group_by(cyl) |>
    dplyr::summarise(rerata_mpg = mean(mpg))

  expect_equal(unname(as.list(lokal)), unname(as.list(asli)))
})

test_that("mobil: dtr_sekilas() dan dtr_kepala() bekerja", {
  expect_output(dtr_sekilas(mobil), "32")
  kepala <- dtr_kepala(mobil, n = 3)
  expect_identical(nrow(kepala), 3L)
  expect_identical(kepala$mobil[1], "Mazda RX4")
})

test_that("mobil: alur visualisasi dari dataset sampai label setara kode standar", {
  lokal <- mobil |>
    vis_ggplot(grf_estetika(x = berat_ribu_lb, y = efisiensi_mpg)) +
    grf_geometrik_titik(
      bentuk = 21, isian = "blue", warna = "black", ukuran = 3
    ) +
    grf_label(
      judul = "Hubungan berat dan efisiensi",
      subjudul = "Data mobil",
      sumbu_x = "Berat (ribu lb)",
      sumbu_y = "Efisiensi (mpg)"
    )

  asli <- ggplot2::ggplot(
    datasets::mtcars, ggplot2::aes(x = wt, y = mpg)
  ) +
    ggplot2::geom_point(shape = 21, fill = "blue", colour = "black", size = 3) +
    ggplot2::labs(
      title = "Hubungan berat dan efisiensi",
      subtitle = "Data mobil",
      x = "Berat (ribu lb)",
      y = "Efisiensi (mpg)"
    )

  expect_s3_class(lokal, "ggplot")
  expect_equal(ggplot2::layer_data(lokal), ggplot2::layer_data(asli))
  expect_identical(ggplot2::get_labs(lokal)$title, "Hubungan berat dan efisiensi")
  expect_identical(ggplot2::get_labs(lokal)$x, "Berat (ribu lb)")
  expect_identical(ggplot2::get_labs(lokal)$y, "Efisiensi (mpg)")
})
