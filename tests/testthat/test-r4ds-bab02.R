# Kompatibilitas R4DS 2e, Bab 2 (Workflow: basics).
# Bab ini hampir seluruhnya sintaks dasar R (aritmetika, `<-`, `c()`), yang tidak dibungkus
# dan tetap berlaku apa adanya. Yang diuji: fungsi yang punya padanan lokal (`sin()`, `seq()`,
# `ggsave()`) dan latihan salah ketik.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_point <- ggplot2::geom_point
geom_smooth <- ggplot2::geom_smooth
geom_bar <- ggplot2::geom_bar
ggsave <- ggplot2::ggsave
mpg <- ggplot2::mpg

data_lapisan <- function(plot, i = 1L) {
  suppressWarnings(suppressMessages(ggplot2::layer_data(plot, i)))
}

kumpulkan <- function(kode) {
  peringatan <- character()
  hasil <- withCallingHandlers(
    tryCatch(
      list(nilai = suppressMessages(kode), galat = NA_character_),
      error = function(e) list(nilai = NULL, galat = conditionMessage(e))
    ),
    warning = function(w) {
      peringatan <<- c(peringatan, class(w)[1])
      invokeRestart("muffleWarning")
    }
  )
  hasil$jumlah_peringatan <- length(peringatan)
  hasil
}

test_that("Bab 2.1: aritmetika dasar tidak berubah, `sin()` menjadi `dsr_sinus()`", {
  expect_equal(1 / 200 * 30, 0.15)
  expect_equal((59 + 73 + 2) / 3, 134 / 3)
  expect_equal(dsr_sinus(pi / 2), sin(pi / 2))
  x <- 3 * 4
  expect_identical(x, 12)
  primes <- c(2, 3, 5, 7, 11, 13)
  expect_identical(primes * 2, c(4, 6, 10, 14, 22, 26))
  expect_identical(primes - 1, c(1, 2, 4, 6, 10, 12))
})

test_that("Bab 2.3: nama objek peka huruf besar-kecil", {
  r_rocks <- 2^3
  expect_identical(r_rocks, 8)
  expect_error(get("r_rock"), "not found")
  expect_error(get("R_rocks"), "not found")
})

test_that("Bab 2.4: seq() menjadi dsr_urutan()", {
  expect_identical(
    dsr_urutan(dari = 1, sampai = 10),
    seq(from = 1, to = 10)
  )
  expect_identical(dsr_urutan(1, 10), seq(1, 10))
  expect_identical(dsr_urutan(1, 10), 1:10)
})

test_that("Bab 2.5 latihan 1: salah ketik nama objek (karakter yang mirip)", {
  my_variable <- 10
  expect_identical(my_variable, 10)
  # `i` tanpa titik (U+0131) menghasilkan galat yang sama seperti kode asli
  expect_error(get("my_var\u0131able"), "not found")
})

test_that("Bab 2.5 latihan 2: perbaikan harfiah masih galat, perbaikan yang benar setara", {
  # Perbaikan harfiah hanya membetulkan salah ketik: `aes()` tetap hanya di geom_point(),
  # sehingga geom_smooth() kehilangan x dan y. Galat ini milik ggplot2 dan sama pada keduanya.
  asli_harfiah <- ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) +
    geom_smooth(method = "lm")
  lokal_harfiah <- vis_ggplot(data = mobil_mpg) +
    grf_geometrik_titik(pemetaan = grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya)) +
    grf_geometrik_haluskan(metode = "lm")
  expect_error(data_lapisan(asli_harfiah), "missing aesthetics")
  expect_error(data_lapisan(lokal_harfiah), "missing aesthetics")

  # Perbaikan yang benar: pemetaan dipindahkan ke ggplot() sehingga dipakai semua lapisan.
  asli <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point() +
    geom_smooth(method = "lm")
  lokal <- vis_ggplot(
    data = mobil_mpg,
    pemetaan = grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya)
  ) +
    grf_geometrik_titik() +
    grf_geometrik_haluskan(metode = "lm")
  expect_equal(data_lapisan(lokal, 1L), data_lapisan(asli, 1L))
  expect_equal(data_lapisan(lokal, 2L), data_lapisan(asli, 2L))
})

test_that("Bab 2.5 latihan 2: salah ketik nama argumen berperilaku sama pada asli dan lokal", {
  # `maping` (salah ketik `mapping`) dan `dTA` (salah ketik `data`): nama yang tidak
  # dikenal tidak diterjemahkan, sehingga fungsi asli menanganinya persis seperti biasa.
  asli <- kumpulkan(
    data_lapisan(
      ggplot(dTA = mpg) + geom_point(maping = aes(x = displ, y = hwy))
    )
  )
  lokal <- kumpulkan(
    data_lapisan(
      vis_ggplot(dTA = mobil_mpg) +
        grf_geometrik_titik(maping = grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya))
    )
  )
  expect_identical(lokal$galat, asli$galat)
  expect_identical(lokal$jumlah_peringatan, asli$jumlah_peringatan)
})

test_that("Bab 2.5 latihan 4: ggsave dengan argumen `plot` menyimpan plot yang diberikan", {
  my_bar_plot <- ggplot(mpg, aes(x = class)) + geom_bar()
  my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) + geom_point()
  f_asli <- file.path(tempdir(), "mpg-asli.png")
  f_lokal <- file.path(tempdir(), "mpg-lokal.png")
  ggsave(filename = f_asli, plot = my_bar_plot)
  plot_batang <- vis_ggplot(mobil_mpg, grf_estetika(x = kelas)) + grf_geometrik_batang()
  plot_sebar <- vis_ggplot(mobil_mpg, grf_estetika(x = mpg_jalan_kota, y = mpg_jalan_raya)) +
    grf_geometrik_titik()
  vis_ggplot_simpan(nama_berkas = f_lokal, plot = plot_batang)
  expect_true(file.exists(f_lokal))
  expect_equal(file.size(f_lokal), file.size(f_asli), tolerance = 0.05)

  # pemetaan argumen: `nama_berkas` menjadi `filename`, `plot` tetap `plot`
  hasil <- .susun_panggilan(
    "vis_ggplot_simpan",
    quote(vis_ggplot_simpan(nama_berkas = "mpg-plot.png", plot = plot_batang))
  )
  expect_identical(names(hasil)[-1L], c("filename", "plot"))
})
