# Kesetaraan perilaku Phase 3a: fungsi lokal vs fungsi asli.

d <- tibble::tibble(
  x = c(3, 1, 2, 2),
  g = c("a", "b", "a", "b"),
  y = c(10, 20, 30, 40)
)

test_that("inp_tribble setara tibble::tribble", {
  expect_equal(
    inp_tribble(~a, ~b, 1, "x", 2, "y"),
    tibble::tribble(~a, ~b, 1, "x", 2, "y")
  )
})

test_that("rpi_lebar setara tidyr::pivot_wider", {
  panjang <- tibble::tibble(
    id = c(1, 1, 2, 2), kunci = c("a", "b", "a", "b"), nilai = 1:4
  )
  expect_equal(
    rpi_lebar(panjang, nama_dari = kunci, nilai_dari = nilai),
    tidyr::pivot_wider(panjang, names_from = kunci, values_from = nilai)
  )
  expect_equal(
    rpi_lebar(panjang, nama_dari = kunci, nilai_dari = nilai, awalan_nama = "k_"),
    tidyr::pivot_wider(
      panjang, names_from = kunci, values_from = nilai, names_prefix = "k_"
    )
  )
})

test_that("trn_urutkan setara dplyr::arrange", {
  expect_equal(trn_urutkan(d, x), dplyr::arrange(d, x))
  expect_equal(
    trn_urutkan(d, frm_turun(x)),
    dplyr::arrange(d, dplyr::desc(x))
  )
  dg <- dplyr::group_by(d, g)
  expect_equal(
    trn_urutkan(dg, x, .per_kelompok = TRUE),
    dplyr::arrange(dg, x, .by_group = TRUE)
  )
})

test_that("trn_unik dan trn_hitung setara dplyr", {
  expect_equal(trn_unik(d, g), dplyr::distinct(d, g))
  expect_equal(
    trn_unik(d, g, .simpan_semua = TRUE),
    dplyr::distinct(d, g, .keep_all = TRUE)
  )
  expect_equal(trn_hitung(d, g), dplyr::count(d, g))
  expect_equal(
    trn_hitung(d, g, urut = TRUE, nama = "banyak"),
    dplyr::count(d, g, sort = TRUE, name = "banyak")
  )
  expect_equal(trn_hitung(d, g, bobot = y), dplyr::count(d, g, wt = y))
})

test_that("trn_pilih, trn_ubah_nama, trn_pindah, trn_tarik setara dplyr", {
  expect_equal(trn_pilih(d, x, g), dplyr::select(d, x, g))
  expect_equal(trn_pilih(d, !y), dplyr::select(d, !y))
  expect_equal(trn_ubah_nama(d, baru = x), dplyr::rename(d, baru = x))
  expect_equal(
    trn_pindah(d, y, .sebelum = x),
    dplyr::relocate(d, y, .before = x)
  )
  expect_equal(trn_tarik(d, y), dplyr::pull(d, y))
  expect_equal(trn_tarik(d, y, nama = g), dplyr::pull(d, y, name = g))
  expect_equal(trn_tarik(d, variabel = y), dplyr::pull(d, var = y))
})

test_that("trn_lepas_kelompok setara dplyr::ungroup", {
  dg <- dplyr::group_by(d, g)
  expect_equal(trn_lepas_kelompok(dg), dplyr::ungroup(dg))
})

test_that("keluarga trn_iris setara dplyr::slice", {
  expect_equal(trn_iris(d, 1:2), dplyr::slice(d, 1:2))
  expect_equal(
    trn_iris(d, 1, .berdasarkan = g),
    dplyr::slice(d, 1, .by = g)
  )
  expect_equal(trn_iris_kepala(d, n = 2), dplyr::slice_head(d, n = 2))
  expect_equal(
    trn_iris_kepala(d, n = 1, berdasarkan = g),
    dplyr::slice_head(d, n = 1, by = g)
  )
  expect_equal(
    trn_iris_kepala(d, proporsi = 0.5),
    dplyr::slice_head(d, prop = 0.5)
  )
  expect_equal(trn_iris_ekor(d, n = 2), dplyr::slice_tail(d, n = 2))
  expect_equal(trn_iris_min(d, x, n = 2), dplyr::slice_min(d, x, n = 2))
  expect_equal(
    trn_iris_min(d, x, n = 1, dengan_seri = FALSE),
    dplyr::slice_min(d, x, n = 1, with_ties = FALSE)
  )
  expect_equal(
    trn_iris_maks(d, urutan_oleh = x, n = 1),
    dplyr::slice_max(d, order_by = x, n = 1)
  )
})

test_that("trn_iris_acak setara dplyr::slice_sample dengan benih sama", {
  set.seed(1)
  lokal <- trn_iris_acak(d, n = 2)
  set.seed(1)
  asli <- dplyr::slice_sample(d, n = 2)
  expect_equal(lokal, asli)

  set.seed(2)
  lokal <- trn_iris_acak(d, n = 3, dengan_pengembalian = TRUE)
  set.seed(2)
  asli <- dplyr::slice_sample(d, n = 3, replace = TRUE)
  expect_equal(lokal, asli)
})

test_that("trn_rapikan_nama setara janitor::clean_names", {
  skip_if_not_installed("janitor")
  kotor <- tibble::tibble(`Nama Kolom` = 1, `Nilai Ke-2` = 2)
  expect_equal(trn_rapikan_nama(kotor), janitor::clean_names(kotor))
})

test_that("pembantu frm_ setara pemilih tidyselect", {
  s <- tibble::tibble(awal_a = 1, awal_b = 2, lain_a = 3, x1 = 4, x2 = 5, x3 = 6)
  expect_equal(
    dplyr::select(s, frm_diakhiri("_a")),
    dplyr::select(s, dplyr::ends_with("_a"))
  )
  expect_equal(
    dplyr::select(s, frm_memuat("wal")),
    dplyr::select(s, dplyr::contains("wal"))
  )
  expect_equal(
    dplyr::select(s, frm_cocok("^awal")),
    dplyr::select(s, dplyr::matches("^awal"))
  )
  expect_equal(
    dplyr::select(s, frm_rentang_angka("x", 1:2)),
    dplyr::select(s, dplyr::num_range("x", 1:2))
  )
  expect_equal(
    dplyr::select(s, x3, frm_semua()),
    dplyr::select(s, x3, dplyr::everything())
  )
  expect_equal(
    dplyr::select(s, frm_salah_satu(c("awal_a", "tidak_ada"))),
    dplyr::select(s, dplyr::any_of(c("awal_a", "tidak_ada")))
  )
  campur <- tibble::tibble(x = 1, g = "a", y = 2)
  expect_equal(
    dplyr::select(campur, frm_di_mana(is.numeric)),
    dplyr::select(campur, dplyr::where(is.numeric))
  )
})

test_that("frm_jumlah dan frm_jika_lain setara dplyr", {
  expect_equal(
    d |> trn_gabung_kelompok(g) |> trn_statistik_ringkas(banyak = frm_jumlah()),
    d |> dplyr::group_by(g) |> dplyr::summarise(banyak = dplyr::n())
  )
  expect_equal(
    trn_mutasi(d, k = frm_jika_lain(x > 2, "besar", "kecil")),
    dplyr::mutate(d, k = dplyr::if_else(x > 2, "besar", "kecil"))
  )
  expect_equal(
    trn_mutasi(d, k = frm_jika_lain(kondisi = x > 2, benar = "b", salah = "k")),
    dplyr::mutate(d, k = dplyr::if_else(condition = x > 2, true = "b", false = "k"))
  )
})

test_that("frm_faktor_frekuensi setara forcats::fct_infreq", {
  skip_if_not_installed("forcats")
  v <- c("a", "b", "b", "c", "c", "c")
  expect_equal(frm_faktor_frekuensi(v), forcats::fct_infreq(v))
  expect_equal(
    frm_faktor_frekuensi(v, berurut = TRUE),
    forcats::fct_infreq(v, ordered = TRUE)
  )
})

test_that("alur 3a pada penguin setara kode tidyverse standar", {
  skip_if_not_installed("palmerpenguins")
  skip_if_not(exists("penguin"), "dataset `penguin` belum dibuat")
  lokal <- penguin |> trn_hitung(spesies, pulau)
  asli <- palmerpenguins::penguins |> dplyr::count(species, island)
  expect_equal(lokal$n, asli$n)
  expect_identical(as.character(lokal$spesies), as.character(asli$species))
})
