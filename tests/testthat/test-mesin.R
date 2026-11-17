test_that(".susun_panggilan hanya memuat nama asli (R4)", {
  hasil <- .susun_panggilan(
    "grf_geometrik_titik",
    quote(grf_geometrik_titik(
      pemetaan = m, warna = "red", isian = "blue", buang_na = TRUE
    ))
  )
  expect_identical(deparse(hasil[[1L]]), "ggplot2::geom_point")
  expect_setequal(names(hasil)[-1L], c("mapping", "colour", "fill", "na.rm"))
})

test_that("nama asli diterima tanpa diubah (R2)", {
  hasil <- .susun_panggilan(
    "trn_filter",
    quote(trn_filter(df, x > 1, .by = g))
  )
  expect_identical(deparse(hasil[[1L]]), "dplyr::filter")
  expect_identical(names(hasil)[-1L], c("", "", ".by"))
})

test_that("argumen posisi dan nama buatan pengguna tidak diubah (R5)", {
  hasil <- .susun_panggilan(
    "trn_mutasi",
    quote(trn_mutasi(df, ukuran = x * 2, .setelah = x))
  )
  # `ukuran` adalah nama kolom buatan pengguna, bukan estetika
  expect_identical(names(hasil)[-1L], c("", "ukuran", ".after"))
})

test_that("konflik nama lokal dan asli adalah galat (R3)", {
  expect_error(
    .susun_panggilan("trn_filter", quote(trn_filter(df, .berdasarkan = g, .by = g))),
    "Konflik argumen"
  )
  expect_error(
    .susun_panggilan("grf_geometrik_titik", quote(grf_geometrik_titik(warna = "red", color = "blue"))),
    "Konflik argumen"
  )
  expect_error(
    .susun_panggilan("grf_geometrik_titik", quote(grf_geometrik_titik(warna = "red", colour = "blue"))),
    "Konflik argumen"
  )
})

test_that("fungsi yang tidak ada di kamus menghasilkan galat internal", {
  expect_error(.susun_panggilan("tidak_ada", quote(tidak_ada())), "tidak ada di kamus")
})

test_that("sinonim colour/color diterima dan memicu konflik bersama nama lokal", {
  aman <- .susun_panggilan(
    "grf_geometrik_boxplot",
    quote(grf_geometrik_boxplot(outlier.color = "red", warna_kotak = "blue"))
  )
  expect_setequal(names(aman)[-1L], c("outlier.color", "box.colour"))
  expect_error(
    .susun_panggilan(
      "grf_geometrik_boxplot",
      quote(grf_geometrik_boxplot(warna_pencilan = "red", outlier.color = "blue"))
    ),
    "Konflik argumen"
  )
  expect_error(
    .susun_panggilan(
      "grf_geometrik_boxplot",
      quote(grf_geometrik_boxplot(warna_pencilan = "red", outlier.colour = "blue"))
    ),
    "Konflik argumen"
  )
})

test_that("argumen yang diterima lewat ... fungsi asli ikut diterjemahkan", {
  hasil <- .susun_panggilan(
    "grf_geometrik_haluskan",
    quote(grf_geometrik_haluskan(metode = "loess", rentang = 0.5, tingkat_kepercayaan = 0.9))
  )
  expect_setequal(names(hasil)[-1L], c("method", "span", "level"))
})
