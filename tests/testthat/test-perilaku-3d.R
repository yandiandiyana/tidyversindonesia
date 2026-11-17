# Kesetaraan perilaku Phase 3d: fungsi dasar R (dsr_) dan inspeksi data (dtr_).

test_that("dsr_ aritmetika dan deret setara fungsi asli", {
  v <- c(1, NA, 3)
  expect_equal(dsr_jumlah(v, buang_na = TRUE), sum(v, na.rm = TRUE))
  expect_equal(dsr_jumlah(1, 2, 3), sum(1, 2, 3))
  expect_equal(dsr_sinus(pi / 2), sin(pi / 2))
  expect_equal(dsr_adalah_na(v), is.na(v))
  expect_equal(dsr_panjang(v), length(v))

  expect_equal(
    dsr_urutan(dari = 1, sampai = 10, selisih = 3),
    seq(from = 1, to = 10, by = 3)
  )
  expect_equal(dsr_urutan(1, 10), seq(1, 10))
  expect_equal(
    dsr_urutan(dari = 1, panjang_keluaran = 5),
    seq(from = 1, length.out = 5)
  )
  expect_equal(
    dsr_urutan(sepanjang = c("a", "b", "c")),
    seq(along.with = c("a", "b", "c"))
  )
})

test_that("dsr_acak_normal setara rnorm dengan benih sama", {
  set.seed(1)
  lokal <- dsr_acak_normal(3, rerata = 10, sd = 2)
  set.seed(1)
  asli <- rnorm(3, mean = 10, sd = 2)
  expect_equal(lokal, asli)
})

test_that("dsr_faktor setara factor", {
  x <- c("a", "b", "a")
  expect_equal(
    dsr_faktor(x, level = c("b", "a"), label_level = c("B", "A"), berurut = TRUE),
    factor(x, levels = c("b", "a"), labels = c("B", "A"), ordered = TRUE)
  )
  expect_equal(dsr_faktor(x, kecualikan = "a"), factor(x, exclude = "a"))
})

test_that("dsr_daftar_berkas setara list.files", {
  folder <- tempfile()
  dir.create(folder)
  invisible(file.create(file.path(folder, c("a.csv", "b.txt"))))
  expect_equal(dsr_daftar_berkas(folder), list.files(folder))
  expect_equal(
    dsr_daftar_berkas(folder, pola = "csv$", nama_lengkap = TRUE),
    list.files(folder, pattern = "csv$", full.names = TRUE)
  )
})

test_that("dsr_dir_kerja dan dsr_set_dir_kerja setara getwd dan setwd", {
  expect_equal(dsr_dir_kerja(), getwd())
  hasil <- withVisible(dsr_set_dir_kerja(tempdir()))
  expect_false(hasil$visible)
  expect_equal(normalizePath(getwd()), normalizePath(tempdir()))
  dsr_set_dir_kerja(hasil$value)
  expect_equal(getwd(), hasil$value)
})

test_that("dsr_dput setara dput dan mengembalikan tak terlihat", {
  x <- c(a = 1, b = 2)
  expect_identical(capture.output(dsr_dput(x)), capture.output(dput(x)))
  expect_identical(
    capture.output(dsr_dput(x, kontrol = "all")),
    capture.output(dput(x, control = "all"))
  )
  hasil <- NULL
  capture.output(hasil <- withVisible(dsr_dput(x)))
  expect_false(hasil$visible)
})

test_that("dtr_kepala dan dtr_ekor setara head dan tail", {
  d <- tibble::tibble(x = 1:10)
  expect_equal(dtr_kepala(d, n = 3), head(d, n = 3))
  expect_equal(dtr_kepala(d), head(d))
  expect_equal(dtr_kepala(1:10, n = 3), head(1:10, n = 3))
  expect_equal(dtr_ekor(d, n = 3), tail(d, n = 3))
  expect_equal(dtr_ekor(1:10, n = 3), tail(1:10, n = 3))
  expect_equal(
    dtr_ekor(d, n = 3, pertahankan_nomor = TRUE),
    tail(d, n = 3, keepnums = TRUE)
  )
})

test_that("dtr_lihat diterjemahkan ke utils::View (tidak dijalankan: interaktif)", {
  hasil <- .susun_panggilan("dtr_lihat", quote(dtr_lihat(d, judul = "J")))
  expect_identical(deparse(hasil[[1L]]), "utils::View")
  expect_identical(names(hasil)[-1L], c("", "title"))
})

test_that("alur kerja pada mobil_mpg setara kode standar pada ggplot2::mpg", {
  skip_if_not(exists("mobil_mpg"), "dataset `mobil_mpg` belum dibuat (jalankan data-raw/semua.R)")
  lokal <- mobil_mpg |>
    trn_filter(penggerak == "depan") |>
    trn_hitung(kelas)
  asli <- ggplot2::mpg |>
    dplyr::filter(drv == "f") |>
    dplyr::count(class)
  peta <- c(
    `2seater` = "2_penumpang", compact = "kompak", midsize = "ukuran_menengah",
    minivan = "minivan", pickup = "pikap", subcompact = "subkompak", suv = "suv"
  )
  hasil <- stats::setNames(lokal$n, lokal$kelas)
  expect_equal(unname(hasil[unname(peta[asli$class])]), asli$n)

  p <- mobil_mpg |>
    vis_ggplot(grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya, warna = kelas)) +
    grf_geometrik_titik()
  q <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(x = displ, y = hwy, colour = class)) +
    ggplot2::geom_point()
  expect_equal(ggplot2::layer_data(p)$x, ggplot2::layer_data(q)$x)
  expect_equal(ggplot2::layer_data(p)$y, ggplot2::layer_data(q)$y)
})

test_that("alur rapi pada tabel2 menghasilkan kolom setara tabel1", {
  skip_if_not(exists("tabel2") && exists("tabel1"), "dataset belum dibuat (jalankan data-raw/semua.R)")
  lebar <- rpi_lebar(tabel2, nama_dari = jenis, nilai_dari = jumlah)
  expect_named(lebar, c("negara", "tahun", "kasus", "populasi"))
  expect_equal(lebar, tabel1)
})

test_that("alur rapi pada tangga_lagu dan rumah_tangga memakai awalan lokal", {
  skip_if_not(exists("tangga_lagu") && exists("rumah_tangga"), "dataset belum dibuat (jalankan data-raw/semua.R)")
  panjang <- tangga_lagu |>
    rpi_panjang(
      kolom = frm_diawali("minggu"), nama_ke = "minggu",
      awalan_nama = "minggu", nilai_ke = "peringkat", buang_nilai_na = TRUE
    )
  asli <- tidyr::billboard |>
    tidyr::pivot_longer(
      cols = tidyselect::starts_with("wk"), names_to = "week",
      names_prefix = "wk", values_to = "rank", values_drop_na = TRUE
    )
  expect_identical(nrow(panjang), nrow(asli))
  expect_equal(panjang$peringkat, asli$rank)

  anak <- rumah_tangga |>
    rpi_panjang(kolom = !keluarga, nama_ke = c(".value", "anak"), pemisah_nama = "_", buang_nilai_na = TRUE)
  expect_named(anak, c("keluarga", "anak", "lahir", "nama"))
})

test_that("dsr_daftar_berkas: harfiah setara fixed (R >= 4.6.0)", {
  skip_if(getRversion() < "4.6.0", "list.files(fixed =) baru ada di R 4.6.0")
  folder <- tempfile()
  dir.create(folder)
  file.create(file.path(folder, c("a.csv", "bcsv.txt")))
  expect_equal(
    dsr_daftar_berkas(folder, pola = ".csv", harfiah = TRUE),
    list.files(folder, pattern = ".csv", fixed = TRUE)
  )
})
