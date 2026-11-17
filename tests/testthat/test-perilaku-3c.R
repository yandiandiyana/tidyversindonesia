# Kesetaraan perilaku Phase 3c: vis_ dan grf_ vs ggplot2.

d <- tibble::tibble(
  a = c(1, 2, 3, 4, 5, 6),
  b = c(2, 4, 3, 6, 5, 8),
  g = rep(c("u", "v"), 3)
)

data_lapisan <- function(plot, i = 1L) ggplot2::layer_data(plot, i)

test_that("geometri garis, batang, histogram, densitas setara ggplot2", {
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) +
    grf_geometrik_garis(warna = "red", ketebalan_garis = 1, orientasi = "x")
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
    ggplot2::geom_line(colour = "red", linewidth = 1, orientation = "x")
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  lokal <- vis_ggplot(d, grf_estetika(x = g, isian = g)) +
    grf_geometrik_batang(posisi = "stack", perataan = 0.5)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = g, fill = g)) +
    ggplot2::geom_bar(position = "stack", just = 0.5)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  lokal <- vis_ggplot(d, grf_estetika(x = b)) + grf_geometrik_histogram(lebar_bin = 1)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = b)) + ggplot2::geom_histogram(binwidth = 1)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  lokal <- vis_ggplot(d, grf_estetika(x = b)) + grf_geometrik_histogram(jumlah_bin = 3)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = b)) + ggplot2::geom_histogram(bins = 3)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  lokal <- vis_ggplot(d, grf_estetika(x = b)) + grf_geometrik_densitas(tipe_kontur = "full")
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = b)) + ggplot2::geom_density(outline.type = "full")
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
})

test_that("geometri boxplot setara ggplot2, termasuk sinonim colour/color", {
  lokal <- vis_ggplot(d, grf_estetika(x = g, y = b)) +
    grf_geometrik_boxplot(
      pencilan = FALSE, warna_pencilan = "red", lebar_variabel = TRUE,
      takik = FALSE, warna_kotak = "blue"
    )
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = g, y = b)) +
    ggplot2::geom_boxplot(
      outliers = FALSE, outlier.colour = "red", varwidth = TRUE,
      notch = FALSE, box.colour = "blue"
    )
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  # nama asli (sinonim color) diterima apa adanya
  sinonim <- vis_ggplot(d, grf_estetika(x = g, y = b)) +
    grf_geometrik_boxplot(outlier.color = "red")
  baku <- ggplot2::ggplot(d, ggplot2::aes(x = g, y = b)) +
    ggplot2::geom_boxplot(outlier.colour = "red")
  expect_equal(data_lapisan(sinonim), data_lapisan(baku))

  expect_error(
    grf_geometrik_boxplot(warna_pencilan = "red", outlier.color = "blue"),
    "Konflik argumen"
  )
})

test_that("geometri penghalus dan heksagon setara ggplot2", {
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) +
    grf_geometrik_haluskan(metode = "lm", tingkat_kepercayaan = 0.9)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
    ggplot2::geom_smooth(method = "lm", level = 0.9)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) +
    grf_geometrik_haluskan(metode = "lm", selang_kepercayaan = FALSE, rumus = y ~ x)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) +
    ggplot2::geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))

  skip_if_not_installed("hexbin")
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_heksagon(jumlah_bin = 3)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) + ggplot2::geom_hex(bins = 3)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
})

test_that("faset setara ggplot2", {
  lokal <- grf_faset_bungkus(~g, jumlah_kolom = 1, skala = "free")
  asli <- ggplot2::facet_wrap(~g, ncol = 1, scales = "free")
  expect_equal(lokal$params$ncol, asli$params$ncol)
  expect_equal(lokal$params$free, asli$params$free)

  lokal <- grf_faset_jendela(g ~ ., skala = "free_y")
  asli <- ggplot2::facet_grid(g ~ ., scales = "free_y")
  expect_equal(lokal$params$free, asli$params$free)

  # dalam plot utuh: kolom PANEL pada data lapisan ikut sama
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik() +
    grf_faset_bungkus(~g, jumlah_kolom = 1)
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) + ggplot2::geom_point() +
    ggplot2::facet_wrap(~g, ncol = 1)
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
})

test_that("skala sumbu setara ggplot2", {
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik() +
    grf_skala_x_kontinu(
      nama = "X", posisi_tanda = c(1, 3, 5), batas = c(0, 7), perluasan = c(0, 0)
    )
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) + ggplot2::geom_point() +
    ggplot2::scale_x_continuous(
      name = "X", breaks = c(1, 3, 5), limits = c(0, 7), expand = c(0, 0)
    )
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
  expect_equal(ggplot2::get_labs(lokal)$x, ggplot2::get_labs(asli)$x)

  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik() +
    grf_skala_y_balik(nama = "Y", batas = c(0, 10))
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b)) + ggplot2::geom_point() +
    ggplot2::scale_y_reverse(name = "Y", limits = c(0, 10))
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
  expect_equal(ggplot2::get_labs(lokal)$y, ggplot2::get_labs(asli)$y)
})

test_that("skala buta warna setara ggthemes", {
  skip_if_not_installed("ggthemes")
  lokal <- vis_ggplot(d, grf_estetika(x = a, y = b, warna = g)) + grf_geometrik_titik() +
    grf_skalawarna_butawarna()
  asli <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b, colour = g)) + ggplot2::geom_point() +
    ggthemes::scale_color_colorblind()
  expect_equal(data_lapisan(lokal)$colour, data_lapisan(asli)$colour)
})

tema <- c(
  grf_tema_abu = "theme_grey", grf_tema_hitamputih = "theme_bw",
  grf_tema_gambar_garis = "theme_linedraw", grf_tema_terang = "theme_light",
  grf_tema_gelap = "theme_dark", grf_tema_minimal = "theme_minimal",
  grf_tema_klasik = "theme_classic", grf_tema_kosong = "theme_void",
  grf_tema_uji = "theme_test"
)
for (nama in names(tema)) {
  local({
    nama <- nama
    asli_nama <- tema[[nama]]
    test_that(paste("tema:", nama, "setara", asli_nama), {
      lokal <- get(nama, mode = "function")(ukuran_dasar = 12, tinta = "navy")
      asli <- getExportedValue("ggplot2", asli_nama)(base_size = 12, ink = "navy")
      expect_equal(lokal, asli)
      expect_equal(get(nama, mode = "function")(), getExportedValue("ggplot2", asli_nama)())
    })
  })
}

test_that("label plot menerima semua argumen yang diterjemahkan", {
  dasar_l <- vis_ggplot(d, grf_estetika(x = a, y = b, ukuran = a)) + grf_geometrik_titik()
  dasar_a <- ggplot2::ggplot(d, ggplot2::aes(x = a, y = b, size = a)) + ggplot2::geom_point()
  lokal <- dasar_l + grf_label(
    teks_alternatif = "alt", wawasan_alternatif = "wawasan", tag = "A",
    keterangan = "K", subjudul = "S", sumbu_y = "Y", ukuran = "Ukuran"
  )
  asli <- dasar_a + ggplot2::labs(
    alt = "alt", alt_insight = "wawasan", tag = "A", caption = "K",
    subtitle = "S", y = "Y", size = "Ukuran"
  )
  expect_equal(ggplot2::get_labs(lokal), ggplot2::get_labs(asli))
})

test_that("vis_ggplot_simpan menyimpan berkas dan mengembalikan tak terlihat", {
  p <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik()
  f1 <- tempfile(fileext = ".png")
  f2 <- tempfile(fileext = ".png")
  hasil <- NULL
  hasil <- withVisible(
    vis_ggplot_simpan(f1, plot = p, lebar = 4, tinggi = 3, satuan = "cm", dpi = 72)
  )
  expect_false(hasil$visible)
  ggplot2::ggsave(f2, plot = p, width = 4, height = 3, units = "cm", dpi = 72)
  expect_true(file.exists(f1))
  expect_true(file.exists(f2))
  # ukuran berkas gambar tidak deterministik antar pemanggilan: bandingkan dengan toleransi
  expect_equal(file.size(f1), file.size(f2), tolerance = 0.05)
})

test_that("vis_ggplot_terakhir setara ggplot2::last_plot", {
  p <- vis_ggplot(d, grf_estetika(x = a, y = b)) + grf_geometrik_titik()
  expect_equal(vis_ggplot_terakhir(), ggplot2::last_plot())
  expect_true(inherits(vis_ggplot_terakhir(), "ggplot"))
})

test_that("alur visualisasi lengkap pada penguin setara kode ggplot2 standar", {
  skip_if_not(exists("penguin"), "dataset `penguin` belum dibuat")
  lokal <- penguin |>
    vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies)) +
    grf_geometrik_titik(alfa = 0.6, buang_na = TRUE) +
    grf_faset_bungkus(~pulau) +
    grf_skala_x_kontinu(posisi_tanda = seq(170, 230, by = 20)) +
    grf_label(judul = "J", sumbu_x = "X", sumbu_y = "Y", warna = "Spesies") +
    grf_tema_klasik()
  asli <- ggplot2::ggplot(
    penguin,
    ggplot2::aes(x = panjang_sirip_mm, y = massa_tubuh_g, colour = spesies)
  ) +
    ggplot2::geom_point(alpha = 0.6, na.rm = TRUE) +
    ggplot2::facet_wrap(~pulau) +
    ggplot2::scale_x_continuous(breaks = seq(170, 230, by = 20)) +
    ggplot2::labs(title = "J", x = "X", y = "Y", colour = "Spesies") +
    ggplot2::theme_classic()
  expect_equal(data_lapisan(lokal), data_lapisan(asli))
  expect_equal(ggplot2::get_labs(lokal), ggplot2::get_labs(asli))
  expect_no_error(ggplot2::ggplot_build(lokal))
})
