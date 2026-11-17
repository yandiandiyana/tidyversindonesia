# Kesetaraan perilaku Phase 3b: impor data dan penulisan berkas.

buat_berkas <- function(isi, ekstensi = ".csv") {
  berkas <- tempfile(fileext = ekstensi)
  writeLines(isi, berkas)
  berkas
}

test_that("pembaca teks bertabel setara readr", {
  csv <- buat_berkas(c("nama,nilai", "a,1", "b,2"))
  expect_equal(
    imp_baca_csv(csv, tampilkan_tipe_kolom = FALSE),
    readr::read_csv(csv, show_col_types = FALSE),
    ignore_attr = TRUE
  )

  csv2 <- buat_berkas(c("nama;nilai", "a;1,5", "b;2,5"))
  expect_equal(
    imp_baca_csv2(csv2, tampilkan_tipe_kolom = FALSE),
    readr::read_csv2(csv2, show_col_types = FALSE),
    ignore_attr = TRUE
  )

  tab <- intToUtf8(9)
  tsv <- buat_berkas(
    c(paste("nama", "nilai", sep = tab), paste("a", 1, sep = tab)),
    ".tsv"
  )
  expect_equal(
    imp_baca_tsv(tsv, tampilkan_tipe_kolom = FALSE),
    readr::read_tsv(tsv, show_col_types = FALSE),
    ignore_attr = TRUE
  )

  pipa <- buat_berkas(c("nama|nilai", "a|1", "b|2"))
  expect_equal(
    imp_baca_delim(pipa, pembatas = "|", tampilkan_tipe_kolom = FALSE),
    readr::read_delim(pipa, delim = "|", show_col_types = FALSE),
    ignore_attr = TRUE
  )

  spasi <- buat_berkas(c("nama nilai", "a 1", "b 2"), ".txt")
  expect_equal(
    imp_baca_tabel(spasi, tampilkan_tipe_kolom = FALSE),
    readr::read_table(spasi, show_col_types = FALSE),
    ignore_attr = TRUE
  )
})

test_that("argumen imp_baca_csv diteruskan dengan benar", {
  csv <- buat_berkas(c("# catatan", "nama,nilai", "a,-", "b,2"))
  expect_equal(
    imp_baca_csv(
      csv, komentar = "#", na = "-", tampilkan_tipe_kolom = FALSE
    ),
    readr::read_csv(csv, comment = "#", na = "-", show_col_types = FALSE),
    ignore_attr = TRUE
  )
  expect_equal(
    imp_baca_csv(csv, lewati = 1, maks_baris = 1, tampilkan_tipe_kolom = FALSE),
    readr::read_csv(csv, skip = 1, n_max = 1, show_col_types = FALSE),
    ignore_attr = TRUE
  )
  expect_equal(
    imp_baca_csv(csv, perbaikan_nama = "minimal", lewati = 1, tampilkan_tipe_kolom = FALSE),
    readr::read_csv(csv, name_repair = "minimal", skip = 1, show_col_types = FALSE),
    ignore_attr = TRUE
  )
  # nama asli juga diterima
  expect_equal(
    imp_baca_csv(csv, comment = "#", show_col_types = FALSE),
    readr::read_csv(csv, comment = "#", show_col_types = FALSE),
    ignore_attr = TRUE
  )
})

test_that("pembaca lebar tetap setara readr", {
  fwf <- buat_berkas(c("a110", "b220"), ".txt")
  expect_equal(
    imp_baca_lebar_tetap(
      fwf,
      posisi_kolom = imp_lebar_kolom(c(2, 2), c("kode", "nilai")),
      tampilkan_tipe_kolom = FALSE
    ),
    readr::read_fwf(
      fwf, readr::fwf_widths(c(2, 2), c("kode", "nilai")),
      show_col_types = FALSE
    ),
    ignore_attr = TRUE
  )
  expect_equal(
    imp_lebar_kolom(c(2, 2), c("kode", "nilai")),
    readr::fwf_widths(c(2, 2), c("kode", "nilai"))
  )
  expect_equal(
    imp_posisi_kolom(c(1, 3), c(2, 4), c("kode", "nilai")),
    readr::fwf_positions(c(1, 3), c(2, 4), c("kode", "nilai"))
  )
})

test_that("imp_baca_log setara readr::read_log", {
  contoh <- tryCatch(readr::readr_example("example.log"), error = function(e) "")
  skip_if(!nzchar(contoh), "berkas contoh readr tidak ditemukan")
  expect_equal(
    imp_baca_log(contoh, tampilkan_tipe_kolom = FALSE),
    readr::read_log(contoh, show_col_types = FALSE),
    ignore_attr = TRUE
  )
})

test_that("imp_baca_rds setara readr::read_rds", {
  df <- tibble::tibble(x = 1:3, y = c("a", "b", "c"))
  rds <- tempfile(fileext = ".rds")
  saveRDS(df, rds)
  expect_equal(imp_baca_rds(rds), readr::read_rds(rds))
})

test_that("pembangun tipe kolom setara readr", {
  expect_equal(imp_kolom_logika(), readr::col_logical())
  expect_equal(imp_kolom_desimal(), readr::col_double())
  expect_equal(imp_kolom_bulat(), readr::col_integer())
  expect_equal(imp_kolom_teks(), readr::col_character())
  expect_equal(imp_kolom_angka(), readr::col_number())
  expect_equal(imp_kolom_lewati(), readr::col_skip())
  expect_equal(imp_kolom_waktu(), readr::col_datetime())
  expect_equal(
    imp_kolom_faktor(level = c("a", "b"), berurut = TRUE),
    readr::col_factor(levels = c("a", "b"), ordered = TRUE)
  )
  expect_equal(
    imp_kolom_tanggal(format = "%d/%m/%Y"),
    readr::col_date(format = "%d/%m/%Y")
  )
  expect_equal(
    imp_kolom(a = imp_kolom_teks(), .bawaan = imp_kolom_desimal()),
    readr::cols(a = readr::col_character(), .default = readr::col_double())
  )
  expect_equal(
    imp_kolom_saja(a = imp_kolom_bulat()),
    readr::cols_only(a = readr::col_integer())
  )
})

test_that("tipe kolom dipakai saat membaca dan masalah dapat diperiksa", {
  csv <- buat_berkas(c("a", "1", "dua"))
  lokal <- suppressWarnings(imp_baca_csv(
    csv, tipe_kolom = imp_kolom(a = imp_kolom_bulat()),
    tampilkan_tipe_kolom = FALSE
  ))
  asli <- suppressWarnings(readr::read_csv(
    csv, col_types = readr::cols(a = readr::col_integer()),
    show_col_types = FALSE
  ))
  expect_equal(lokal, asli, ignore_attr = TRUE)
  expect_equal(imp_masalah(lokal), readr::problems(lokal))
  expect_equal(imp_spesifikasi(lokal), readr::spec(lokal))
})

test_that("imp_urai_angka setara readr::parse_number", {
  teks <- c("$1,234", "5%")
  expect_equal(imp_urai_angka(teks), readr::parse_number(teks))
  eropa <- readr::locale(decimal_mark = ",", grouping_mark = ".")
  expect_equal(
    imp_urai_angka("1.234,5", lokal = eropa),
    readr::parse_number("1.234,5", locale = eropa)
  )
})

test_that("penulis berkas setara readr dan mengembalikan tak terlihat", {
  d <- tibble::tibble(x = 1:2, y = c("a", NA))

  f1 <- tempfile(fileext = ".csv")
  f2 <- tempfile(fileext = ".csv")
  inp_tulis_csv(d, f1)
  readr::write_csv(d, f2)
  expect_identical(readLines(f1), readLines(f2))

  inp_tulis_csv(d, f1, na = "-", nama_kolom = FALSE, kutip = "all")
  readr::write_csv(d, f2, na = "-", col_names = FALSE, quote = "all")
  expect_identical(readLines(f1), readLines(f2))

  inp_tulis_csv(d, f1)
  inp_tulis_csv(d, f1, tambahkan = TRUE)
  readr::write_csv(d, f2)
  readr::write_csv(d, f2, append = TRUE)
  expect_identical(readLines(f1), readLines(f2))

  expect_invisible(inp_tulis_csv(d, f1))

  t1 <- tempfile(fileext = ".tsv")
  t2 <- tempfile(fileext = ".tsv")
  inp_tulis_tsv(d, t1)
  readr::write_tsv(d, t2)
  expect_identical(readLines(t1), readLines(t2))

  r1 <- tempfile(fileext = ".rds")
  r2 <- tempfile(fileext = ".rds")
  inp_tulis_rds(d, r1)
  readr::write_rds(d, r2)
  expect_identical(readRDS(r1), readRDS(r2))
})

test_that("pembaca dan penulis Parquet setara arrow", {
  skip_if_not_installed("arrow")
  d <- tibble::tibble(x = 1:3, y = c("a", "b", "c"))
  p1 <- tempfile(fileext = ".parquet")
  p2 <- tempfile(fileext = ".parquet")
  inp_tulis_parquet(d, p1)
  arrow::write_parquet(d, p2)
  expect_equal(arrow::read_parquet(p1), arrow::read_parquet(p2))
  expect_equal(imp_baca_parquet(p1), arrow::read_parquet(p1))
})

test_that("alur impor, rapi, transformasi setara kode standar", {
  csv <- buat_berkas(c("id,a,b", "1,10,20", "2,30,40"))
  lokal <- imp_baca_csv(csv, tampilkan_tipe_kolom = FALSE) |>
    rpi_panjang(kolom = !id, nama_ke = "kunci", nilai_ke = "nilai") |>
    trn_filter(nilai > 15)
  asli <- readr::read_csv(csv, show_col_types = FALSE) |>
    tidyr::pivot_longer(cols = !id, names_to = "kunci", values_to = "nilai") |>
    dplyr::filter(nilai > 15)
  expect_equal(lokal, asli, ignore_attr = TRUE)
})
