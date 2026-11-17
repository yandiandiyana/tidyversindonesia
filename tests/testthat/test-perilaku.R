# Kesetaraan perilaku: fungsi lokal vs fungsi asli dengan masukan setara.

df <- tibble::tibble(x = 1:6, g = rep(c("a", "b"), 3))

test_that("trn_filter setara dplyr::filter", {
  expect_equal(trn_filter(df, x > 2), dplyr::filter(df, x > 2))
  expect_equal(
    trn_filter(df, x == max(x), .berdasarkan = g),
    dplyr::filter(df, x == max(x), .by = g)
  )
  # nama asli juga diterima
  expect_equal(
    trn_filter(df, x == max(x), .by = g),
    dplyr::filter(df, x == max(x), .by = g)
  )
})

test_that("trn_filter meneruskan data masking dan variabel lingkungan", {
  batas <- 4
  expect_equal(trn_filter(df, x > batas), dplyr::filter(df, x > batas))
})

test_that("trn_mutasi setara dplyr::mutate", {
  expect_equal(
    trn_mutasi(df, y = x * 2, .setelah = x),
    dplyr::mutate(df, y = x * 2, .after = x)
  )
  expect_equal(
    trn_mutasi(df, y = x * 2, .simpan = "used"),
    dplyr::mutate(df, y = x * 2, .keep = "used")
  )
  # nama kolom buatan pengguna yang mirip nama estetika tidak diterjemahkan
  expect_named(trn_mutasi(df, ukuran = x * 2), c("x", "g", "ukuran"))
})

test_that("trn_gabung_kelompok dan trn_statistik_ringkas setara dplyr", {
  lokal <- df |>
    trn_gabung_kelompok(g) |>
    trn_statistik_ringkas(rerata = dsr_rerata(x))
  asli <- df |>
    dplyr::group_by(g) |>
    dplyr::summarise(rerata = mean(x))
  expect_equal(lokal, asli)
  expect_equal(
    trn_statistik_ringkas(df, total = sum(x), .berdasarkan = g),
    dplyr::summarise(df, total = sum(x), .by = g)
  )
})

test_that("inp_tibble setara tibble::tibble", {
  expect_equal(inp_tibble(x = 1:3, y = x * 2), tibble::tibble(x = 1:3, y = x * 2))
  expect_equal(
    suppressMessages(inp_tibble(a = 1, a = 2, .perbaikan_nama = "unique")),
    suppressMessages(tibble::tibble(a = 1, a = 2, .name_repair = "unique"))
  )
})

test_that("imp_baca_csv setara readr::read_csv", {
  berkas <- tempfile(fileext = ".csv")
  writeLines(c("a,b", "1,2", "3,4"), berkas)
  expect_equal(
    imp_baca_csv(berkas, tampilkan_tipe_kolom = FALSE),
    readr::read_csv(berkas, show_col_types = FALSE),
    ignore_attr = TRUE
  )
  expect_equal(
    imp_baca_csv(
      berkas, lewati = 1, nama_kolom = c("p", "q"),
      tampilkan_tipe_kolom = FALSE
    ),
    readr::read_csv(
      berkas, skip = 1, col_names = c("p", "q"), show_col_types = FALSE
    ),
    ignore_attr = TRUE
  )
})

test_that("rpi_panjang setara tidyr::pivot_longer, termasuk frm_diawali", {
  lebar <- tibble::tibble(id = 1:2, wk1 = c(1, 2), wk2 = c(3, 4))
  expect_equal(
    rpi_panjang(lebar, kolom = c(wk1, wk2), nama_ke = "minggu", nilai_ke = "nilai"),
    tidyr::pivot_longer(lebar, cols = c(wk1, wk2), names_to = "minggu", values_to = "nilai")
  )
  expect_equal(
    rpi_panjang(
      lebar, kolom = frm_diawali("wk"), nama_ke = "minggu",
      awalan_nama = "wk", nilai_ke = "nilai"
    ),
    tidyr::pivot_longer(
      lebar, cols = tidyselect::starts_with("wk"), names_to = "minggu",
      names_prefix = "wk", values_to = "nilai"
    )
  )
})

test_that("frm_diawali bekerja di dalam select asli", {
  d <- tibble::tibble(awal_a = 1, awal_b = 2, lain = 3)
  expect_equal(
    dplyr::select(d, frm_diawali("awal")),
    dplyr::select(d, dplyr::starts_with("awal"))
  )
  expect_equal(
    dplyr::select(d, frm_diawali("AWAL", abaikan_kapital = FALSE)),
    dplyr::select(d, dplyr::starts_with("AWAL", ignore.case = FALSE))
  )
})

test_that("dsr_rerata setara mean", {
  expect_equal(dsr_rerata(c(1, NA, 3), buang_na = TRUE), 2)
  expect_equal(dsr_rerata(c(1, 2, 3, 100), pangkas = 0.25), mean(c(1, 2, 3, 100), trim = 0.25))
  expect_equal(dsr_rerata(c(1, NA, 3), na.rm = TRUE), 2)
  d <- tibble::tibble(x = c(1, NA, 3))
  expect_equal(
    dplyr::summarise(d, m = dsr_rerata(x, buang_na = TRUE)),
    dplyr::summarise(d, m = mean(x, na.rm = TRUE))
  )
})

test_that("dtr_sekilas setara glimpse dan mengembalikan tak terlihat", {
  expect_identical(
    capture.output(dtr_sekilas(df)),
    capture.output(dplyr::glimpse(df))
  )
  hasil <- NULL
  capture.output(hasil <- withVisible(dtr_sekilas(df)))
  expect_false(hasil$visible)
})

test_that("vis_ggplot, grf_estetika, grf_geometrik_titik setara ggplot2", {
  d <- tibble::tibble(a = 1:3, b = c(2, 4, 6), g = c("u", "v", "u"))
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b, warna = g)) +
    grf_geometrik_titik(ukuran = 3, alfa = 0.5)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b, colour = g)) +
    ggplot2::geom_point(size = 3, alpha = 0.5)
  expect_true(inherits(lokal, "ggplot"))
  expect_equal(ggplot2::layer_data(lokal), ggplot2::layer_data(asli))

  # estetika tetap (bukan pemetaan) pada lapisan
  lokal2 <- vis_ggplot(d, grf_estetika(x = a, y = b)) +
    grf_geometrik_titik(warna = "red", isian = "blue", bentuk = 21)
  asli2 <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
    ggplot2::geom_point(colour = "red", fill = "blue", shape = 21)
  expect_equal(ggplot2::layer_data(lokal2), ggplot2::layer_data(asli2))
})

test_that("grf_estetika mempertahankan data masking", {
  d <- tibble::tibble(a = 1:3, b = c(2, 4, 6))
  lokal <- vis_ggplot(d, grf_estetika(x = a / 2, y = b)) + grf_geometrik_titik()
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a / 2, y = b)) + ggplot2::geom_point()
  expect_equal(ggplot2::layer_data(lokal), ggplot2::layer_data(asli))
})

test_that("grf_label setara labs, termasuk sumbu dan estetika", {
  d <- tibble::tibble(a = 1:3, b = c(2, 4, 6), g = c("u", "v", "u"))
  dasar_lokal <- vis_ggplot(d, grf_estetika(x = a, y = b, warna = g)) + grf_geometrik_titik()
  dasar_asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b, colour = g)) + ggplot2::geom_point()
  lokal <- dasar_lokal +
    grf_label(judul = "J", subjudul = "S", sumbu_x = "X", sumbu_y = "Y", warna = "W")
  asli <- dasar_asli +
    ggplot2::labs(title = "J", subtitle = "S", x = "X", y = "Y", colour = "W")
  expect_equal(ggplot2::get_labs(lokal), ggplot2::get_labs(asli))
})

test_that("konflik nama diteruskan sebagai galat pada pemanggilan nyata", {
  expect_error(
    trn_filter(df, x > 1, .berdasarkan = g, .by = g),
    "Konflik argumen"
  )
  expect_error(
    grf_geometrik_titik(warna = "red", color = "blue"),
    "Konflik argumen"
  )
})
