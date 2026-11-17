# Kompatibilitas R4DS 2e, Bab 1 (Data visualization).
#
# Tiap contoh buku dijalankan dua kali: versi ASLI (kode persis seperti di buku,
# dengan paket asli) dan versi LOKAL (fungsi, argumen, dan dataset tidyversindonesia).
# Hasilnya dibandingkan lewat data lapisan ggplot (`layer_data`), label, dan faset.
#
# Agar kode asli dapat disalin persis dari buku, fungsi ggplot2 dibuat tersedia
# dengan nama aslinya hanya di berkas uji ini.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_point <- ggplot2::geom_point
geom_smooth <- ggplot2::geom_smooth
geom_bar <- ggplot2::geom_bar
geom_histogram <- ggplot2::geom_histogram
geom_density <- ggplot2::geom_density
geom_boxplot <- ggplot2::geom_boxplot
facet_wrap <- ggplot2::facet_wrap
labs <- ggplot2::labs
ggsave <- ggplot2::ggsave
mpg <- ggplot2::mpg
diamonds <- ggplot2::diamonds
if (requireNamespace("palmerpenguins", quietly = TRUE)) {
  penguins <- palmerpenguins::penguins
}
if (requireNamespace("forcats", quietly = TRUE)) {
  fct_infreq <- forcats::fct_infreq
}
if (requireNamespace("ggthemes", quietly = TRUE)) {
  scale_color_colorblind <- ggthemes::scale_color_colorblind
}

# --- alat bantu -------------------------------------------------------------
data_lapisan <- function(plot, i = 1L) {
  suppressWarnings(suppressMessages(ggplot2::layer_data(plot, i)))
}

# Bandingkan data lapisan versi lokal dan asli. `kecuali` memuat kolom yang
# memang boleh berbeda (mis. warna, bila urutan level kategori ikut diterjemahkan).
sama_lapisan <- function(lokal, asli, lapisan = 1L, kecuali = character()) {
  for (i in lapisan) {
    a <- data_lapisan(lokal, i)
    b <- data_lapisan(asli, i)
    expect_identical(sort(names(a)), sort(names(b)), info = paste("kolom lapisan", i))
    kolom <- setdiff(names(b), kecuali)
    expect_equal(a[kolom], b[kolom], info = paste("lapisan", i))
  }
}

# get_labs() membangun plot; peringatan "Removed 2 rows" memang muncul pada kode buku,
# jadi disenyapkan di sini agar keluaran uji bersih.
etiket <- function(plot) suppressWarnings(ggplot2::get_labs(plot))
kunci_label <- function(plot) sort(names(etiket(plot)))

# --- 1.2.1 data frame penguins ---------------------------------------------
test_that("Bab 1.2.1: penguin dan glimpse setara penguins", {
  skip_if_not_installed("palmerpenguins")
  expect_identical(dim(penguin), dim(penguins))
  lokal <- capture.output(dtr_sekilas(penguin))
  asli <- capture.output(dplyr::glimpse(penguins))
  expect_identical(lokal[1:2], asli[1:2])
  expect_identical(
    names(penguin),
    c("spesies", "pulau", "panjang_paruh_mm", "kedalaman_paruh_mm",
      "panjang_sirip_mm", "massa_tubuh_g", "jenis_kelamin", "tahun")
  )
})

# --- 1.2.3 membuat ggplot ---------------------------------------------------
test_that("Bab 1.2.3: kanvas kosong, pemetaan, dan geom_point", {
  skip_if_not_installed("palmerpenguins")
  expect_true(inherits(ggplot(data = penguins), "ggplot"))
  expect_true(inherits(vis_ggplot(data = penguin), "ggplot"))

  asli <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point()
  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)
})

# --- 1.2.4 estetika dan lapisan --------------------------------------------
test_that("Bab 1.2.4: warna, geom_smooth, pemetaan lokal, dan bentuk", {
  skip_if_not_installed("palmerpenguins")

  asli <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
  ) +
    geom_point()
  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies)
  ) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli2 <- asli + geom_smooth(method = "lm")
  lokal2 <- lokal + grf_geometrik_haluskan(metode = "lm")
  sama_lapisan(lokal2, asli2, 1:2)

  asli3 <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point(mapping = aes(color = species)) +
    geom_smooth(method = "lm")
  lokal3 <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik(pemetaan = grf_estetika(warna = spesies)) +
    grf_geometrik_haluskan(metode = "lm")
  sama_lapisan(lokal3, asli3, 1:2)

  asli4 <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point(mapping = aes(color = species, shape = species)) +
    geom_smooth(method = "lm")
  lokal4 <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik(pemetaan = grf_estetika(warna = spesies, bentuk = spesies)) +
    grf_geometrik_haluskan(metode = "lm")
  sama_lapisan(lokal4, asli4, 1:2)
})

test_that("Bab 1.2.4: label dan skala warna ramah buta warna (plot tujuan akhir)", {
  skip_if_not_installed("palmerpenguins")
  skip_if_not_installed("ggthemes")

  asli <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point(aes(color = species, shape = species)) +
    geom_smooth(method = "lm") +
    labs(
      title = "Body mass and flipper length",
      subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
      x = "Flipper length (mm)", y = "Body mass (g)",
      color = "Species", shape = "Species"
    ) +
    scale_color_colorblind()

  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik(grf_estetika(warna = spesies, bentuk = spesies)) +
    grf_geometrik_haluskan(metode = "lm") +
    grf_label(
      judul = "Massa tubuh dan panjang sirip",
      subjudul = "Dimensi penguin Adelie, Chinstrap, dan Gentoo",
      sumbu_x = "Panjang sirip (mm)", sumbu_y = "Massa tubuh (g)",
      warna = "Spesies", bentuk = "Spesies"
    ) +
    grf_skalawarna_butawarna()

  sama_lapisan(lokal, asli, 1:2)
  expect_identical(kunci_label(lokal), kunci_label(asli))
  expect_identical(etiket(lokal)$title, "Massa tubuh dan panjang sirip")
  expect_identical(etiket(lokal)$x, "Panjang sirip (mm)")
})

# --- 1.2.5 latihan ----------------------------------------------------------
test_that("Bab 1.2.5 latihan 3, 4, 5, 6: sebar kedalaman paruh, geom, galat, na.rm", {
  skip_if_not_installed("palmerpenguins")

  # latihan 3
  asli <- ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) + geom_point()
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_paruh_mm, y = kedalaman_paruh_mm)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  # latihan 4
  asli <- ggplot(penguins, aes(x = species, y = bill_depth_mm)) + geom_point()
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies, y = kedalaman_paruh_mm)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  # latihan 5: tanpa pemetaan harus galat, keduanya (pesan tetap bahasa Inggris)
  asli <- ggplot(data = penguins) + geom_point()
  lokal <- vis_ggplot(data = penguin) + grf_geometrik_titik()
  expect_error(data_lapisan(asli))
  expect_error(data_lapisan(lokal))

  # latihan 6: na.rm
  asli <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(na.rm = TRUE)
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik(buang_na = TRUE)
  sama_lapisan(lokal, asli)
  expect_no_warning(ggplot2::ggplot_build(lokal))
})

test_that("Bab 1.2.5 latihan 7, 8, 9, 10: keterangan, warna kedalaman paruh, se, dua cara", {
  skip_if_not_installed("palmerpenguins")

  # latihan 7
  asli <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(na.rm = TRUE) +
    labs(caption = "Data come from the palmerpenguins package.")
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik(buang_na = TRUE) +
    grf_label(keterangan = "Data berasal dari paket palmerpenguins.")
  expect_identical(kunci_label(lokal), kunci_label(asli))
  expect_identical(
    etiket(lokal)$caption,
    "Data berasal dari paket palmerpenguins."
  )

  # latihan 8: bill_depth_mm dipetakan ke warna pada tingkat geom
  asli <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point(mapping = aes(color = bill_depth_mm)) +
    geom_smooth()
  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik(pemetaan = grf_estetika(warna = kedalaman_paruh_mm)) +
    grf_geometrik_haluskan()
  sama_lapisan(lokal, asli, 1:2)

  # latihan 9
  asli <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
  ) +
    geom_point() +
    geom_smooth(se = FALSE)
  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g, warna = pulau)
  ) +
    grf_geometrik_titik() +
    grf_geometrik_haluskan(selang_kepercayaan = FALSE)
  sama_lapisan(lokal, asli, 1:2)

  # latihan 10: dua cara menulis plot yang sama
  asli_a <- ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point() +
    geom_smooth()
  asli_b <- ggplot() +
    geom_point(
      data = penguins,
      mapping = aes(x = flipper_length_mm, y = body_mass_g)
    ) +
    geom_smooth(
      data = penguins,
      mapping = aes(x = flipper_length_mm, y = body_mass_g)
    )
  lokal_a <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
  ) +
    grf_geometrik_titik() +
    grf_geometrik_haluskan()
  lokal_b <- vis_ggplot() +
    grf_geometrik_titik(
      data = penguin,
      pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
    ) +
    grf_geometrik_haluskan(
      data = penguin,
      pemetaan = grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)
    )
  sama_lapisan(lokal_a, asli_a, 1:2)
  sama_lapisan(lokal_b, asli_b, 1:2)
  expect_equal(data_lapisan(lokal_a, 2L), data_lapisan(lokal_b, 2L))
})

# --- 1.3 gaya ggplot2 ringkas dan pipa -------------------------------------
test_that("Bab 1.3: bentuk ringkas dan pipa", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli_pipa <- penguins |>
    ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()
  lokal_pipa <- penguin |>
    vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik()
  sama_lapisan(lokal_pipa, asli_pipa)
  sama_lapisan(lokal_pipa, lokal)
})

# --- 1.4 distribusi ---------------------------------------------------------
test_that("Bab 1.4.1: diagram batang dan fct_infreq", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(x = species)) + geom_bar()
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies)) + grf_geometrik_batang()
  sama_lapisan(lokal, asli)

  skip_if_not_installed("forcats")
  asli <- ggplot(penguins, aes(x = fct_infreq(species))) + geom_bar()
  lokal <- vis_ggplot(penguin, grf_estetika(x = frm_faktor_frekuensi(spesies))) +
    grf_geometrik_batang()
  sama_lapisan(lokal, asli)
})

test_that("Bab 1.4.2: histogram dan kurva densitas", {
  skip_if_not_installed("palmerpenguins")
  for (lebar in c(200, 20, 2000)) {
    asli <- ggplot(penguins, aes(x = body_mass_g)) + geom_histogram(binwidth = lebar)
    lokal <- vis_ggplot(penguin, grf_estetika(x = massa_tubuh_g)) +
      grf_geometrik_histogram(lebar_bin = lebar)
    sama_lapisan(lokal, asli)
  }
  asli <- ggplot(penguins, aes(x = body_mass_g)) + geom_density()
  lokal <- vis_ggplot(penguin, grf_estetika(x = massa_tubuh_g)) + grf_geometrik_densitas()
  sama_lapisan(lokal, asli)
})

test_that("Bab 1.4.3 latihan: sumbu y, warna dan isian, bins, histogram karat", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(y = species)) + geom_bar()
  lokal <- vis_ggplot(penguin, grf_estetika(y = spesies)) + grf_geometrik_batang()
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = species)) + geom_bar(color = "red")
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies)) + grf_geometrik_batang(warna = "red")
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = species)) + geom_bar(fill = "red")
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies)) + grf_geometrik_batang(isian = "red")
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = body_mass_g)) + geom_histogram(bins = 15)
  lokal <- vis_ggplot(penguin, grf_estetika(x = massa_tubuh_g)) +
    grf_geometrik_histogram(jumlah_bin = 15)
  sama_lapisan(lokal, asli)

  asli <- ggplot(diamonds, aes(x = carat)) + geom_histogram(binwidth = 0.1)
  lokal <- vis_ggplot(berlian, grf_estetika(x = karat)) + grf_geometrik_histogram(lebar_bin = 0.1)
  sama_lapisan(lokal, asli)
})

# --- 1.5 hubungan -----------------------------------------------------------
test_that("Bab 1.5.1: boxplot, densitas dengan linewidth, dan alpha", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(x = species, y = body_mass_g)) + geom_boxplot()
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies, y = massa_tubuh_g)) +
    grf_geometrik_boxplot()
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = body_mass_g, color = species)) +
    geom_density(linewidth = 0.75)
  lokal <- vis_ggplot(penguin, grf_estetika(x = massa_tubuh_g, warna = spesies)) +
    grf_geometrik_densitas(ketebalan_garis = 0.75)
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
    geom_density(alpha = 0.5)
  lokal <- vis_ggplot(penguin, grf_estetika(x = massa_tubuh_g, warna = spesies, isian = spesies)) +
    grf_geometrik_densitas(alfa = 0.5)
  sama_lapisan(lokal, asli)
})

test_that("Bab 1.5.2: batang bertumpuk, posisi fill, dan label proporsi", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(x = island, fill = species)) + geom_bar()
  lokal <- vis_ggplot(penguin, grf_estetika(x = pulau, isian = spesies)) + grf_geometrik_batang()
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = island, fill = species)) + geom_bar(position = "fill")
  lokal <- vis_ggplot(penguin, grf_estetika(x = pulau, isian = spesies)) +
    grf_geometrik_batang(posisi = "fill")
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar(position = "fill") +
    labs(y = "proportion")
  lokal <- vis_ggplot(penguin, grf_estetika(x = pulau, isian = spesies)) +
    grf_geometrik_batang(posisi = "fill") +
    grf_label(sumbu_y = "proporsi")
  sama_lapisan(lokal, asli)
  expect_identical(etiket(lokal)$y, "proporsi")
})

test_that("Bab 1.5.4: tiga variabel dan faset", {
  skip_if_not_installed("palmerpenguins")
  asli <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = species, shape = island))
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik(grf_estetika(warna = spesies, bentuk = pulau))
  sama_lapisan(lokal, asli)

  asli <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = species, shape = species)) +
    facet_wrap(~island)
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik(grf_estetika(warna = spesies, bentuk = spesies)) +
    grf_faset_bungkus(~pulau)
  sama_lapisan(lokal, asli)
})

test_that("Bab 1.5.5 latihan 1, 2, 3, 4: mpg menjadi mobil_mpg", {
  expect_identical(dim(mobil_mpg), dim(mpg))
  kategori <- vapply(mobil_mpg, function(x) is.character(x) || is.factor(x), logical(1))
  expect_identical(unname(kategori), unname(vapply(mpg, function(x) is.character(x) || is.factor(x), logical(1))))

  # latihan 2: variabel ketiga ke warna, ukuran, keduanya
  asli <- ggplot(mpg, aes(x = displ, y = hwy, color = cty)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, warna = mpg_jalan_kota)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli <- ggplot(mpg, aes(x = displ, y = hwy, size = cty)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, ukuran = mpg_jalan_kota)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli <- ggplot(mpg, aes(x = displ, y = hwy, color = cty, size = cty)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, warna = mpg_jalan_kota, ukuran = mpg_jalan_kota)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  # variabel numerik tidak dapat dipetakan ke bentuk: keduanya galat
  asli <- ggplot(mpg, aes(x = displ, y = hwy, shape = cty)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, bentuk = mpg_jalan_kota)) +
    grf_geometrik_titik()
  expect_error(data_lapisan(asli))
  expect_error(data_lapisan(lokal))

  # latihan 3 dan 4: linewidth, dan satu variabel ke beberapa estetika
  asli <- ggplot(mpg, aes(x = displ, y = hwy, linewidth = cty)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, ketebalan_garis = mpg_jalan_kota)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli <- ggplot(mpg, aes(x = displ, y = hwy, color = drv, shape = drv)) + geom_point()
  lokal <- vis_ggplot(mobil_mpg, grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, warna = penggerak, bentuk = penggerak)) +
    grf_geometrik_titik()
  # nilai `penggerak` diterjemahkan (f/r/4 menjadi depan/belakang/4_roda), sehingga
  # urutan level, nomor kelompok, warna, dan bentuk bisa berbeda: bandingkan posisi
  sama_lapisan(lokal, asli, kecuali = c("colour", "shape", "group"))
  expect_identical(
    length(unique(data_lapisan(lokal)$colour)),
    length(unique(data_lapisan(asli)$colour))
  )
})

test_that("Bab 1.5.5 latihan 5, 6, 7: kedalaman paruh, legenda ganda, batang bertumpuk", {
  skip_if_not_installed("palmerpenguins")

  asli <- ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
    geom_point()
  lokal <- vis_ggplot(penguin, grf_estetika(x = panjang_paruh_mm, y = kedalaman_paruh_mm, warna = spesies)) +
    grf_geometrik_titik()
  sama_lapisan(lokal, asli)

  asli_f <- asli + facet_wrap(~species)
  lokal_f <- lokal + grf_faset_bungkus(~spesies)
  sama_lapisan(lokal_f, asli_f)

  # latihan 6: dua legenda karena label `color` saja diubah
  asli <- ggplot(
    data = penguins,
    mapping = aes(
      x = bill_length_mm, y = bill_depth_mm,
      color = species, shape = species
    )
  ) +
    geom_point() +
    labs(color = "Species")
  lokal <- vis_ggplot(
    data = penguin,
    pemetaan = grf_estetika(
      x = panjang_paruh_mm, y = kedalaman_paruh_mm,
      warna = spesies, bentuk = spesies
    )
  ) +
    grf_geometrik_titik() +
    grf_label(warna = "Spesies")
  expect_identical(kunci_label(lokal), kunci_label(asli))
  expect_identical(etiket(lokal)$colour, "Spesies")

  # latihan 7
  asli <- ggplot(penguins, aes(x = species, fill = island)) + geom_bar(position = "fill")
  lokal <- vis_ggplot(penguin, grf_estetika(x = spesies, isian = pulau)) +
    grf_geometrik_batang(posisi = "fill")
  sama_lapisan(lokal, asli)
})

# --- 1.6 menyimpan plot -----------------------------------------------------
test_that("Bab 1.6: ggsave menyimpan plot terakhir", {
  skip_if_not_installed("palmerpenguins")
  f_asli <- file.path(tempdir(), "penguin-asli.png")
  f_lokal <- file.path(tempdir(), "penguin-lokal.png")

  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()
  # peringatan "Removed 2 rows" memang muncul pada kode buku, dan harus sama pada versi lokal
  expect_warning(ggsave(filename = f_asli), "Removed 2 rows")
  vis_ggplot(penguin, grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g)) +
    grf_geometrik_titik()
  expect_warning(vis_ggplot_simpan(nama_berkas = f_lokal), "Removed 2 rows")

  expect_true(file.exists(f_asli))
  expect_true(file.exists(f_lokal))
  # berkas PNG yang sah; ukuran tidak persis sama antar pemanggilan (pembuatan gambar
  # tidak deterministik), jadi dibandingkan dengan toleransi
  expect_identical(readBin(f_lokal, "raw", 4L), readBin(f_asli, "raw", 4L))
  expect_equal(file.size(f_lokal), file.size(f_asli), tolerance = 0.05)
})

test_that("Bab 1.6.1 latihan: plot yang disimpan adalah plot terakhir, dan format PDF", {
  vis_ggplot(mobil_mpg, grf_estetika(x = kelas)) + grf_geometrik_batang()
  terakhir <- vis_ggplot(mobil_mpg, grf_estetika(x = mpg_jalan_kota, y = mpg_jalan_raya)) +
    grf_geometrik_titik()
  expect_equal(data_lapisan(vis_ggplot_terakhir()), data_lapisan(terakhir))

  f_pdf <- file.path(tempdir(), "mpg-plot.pdf")
  vis_ggplot_simpan(f_pdf)
  expect_true(file.exists(f_pdf))
  expect_identical(rawToChar(readBin(f_pdf, "raw", 4L)), "%PDF")
})
