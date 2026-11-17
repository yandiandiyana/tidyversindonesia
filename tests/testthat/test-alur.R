# Alur kerja terpadu: dataset -> transformasi -> ringkasan -> plot.

test_that("alur transformasi penguin setara kode tidyverse standar", {
  skip_if_not_installed("palmerpenguins")
  skip_if_not(exists("penguin"), "dataset `penguin` belum dibuat (jalankan data-raw/penguin.R)")

  lokal <- penguin |>
    trn_filter(!is.na(massa_tubuh_g)) |>
    trn_gabung_kelompok(spesies) |>
    trn_statistik_ringkas(rerata = dsr_rerata(massa_tubuh_g))

  asli <- palmerpenguins::penguins |>
    dplyr::filter(!is.na(body_mass_g)) |>
    dplyr::group_by(species) |>
    dplyr::summarise(rerata = mean(body_mass_g))

  expect_identical(as.character(lokal$spesies), as.character(asli$species))
  expect_equal(lokal$rerata, asli$rerata)
})

test_that("alur visualisasi penguin dari dataset sampai label", {
  skip_if_not(exists("penguin"), "dataset `penguin` belum dibuat (jalankan data-raw/penguin.R)")

  p <- penguin |>
    vis_ggplot(grf_estetika(
      x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies
    )) +
    grf_geometrik_titik(ukuran = 2, buang_na = TRUE) +
    grf_label(
      judul = "Uji", sumbu_x = "Sirip", sumbu_y = "Massa", warna = "Spesies"
    )

  expect_true(inherits(p, "ggplot"))
  expect_no_error(ggplot2::ggplot_build(p))
  expect_identical(ggplot2::get_labs(p)$title, "Uji")
  expect_identical(ggplot2::get_labs(p)$x, "Sirip")
})
