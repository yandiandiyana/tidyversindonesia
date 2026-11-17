test_that("struktur kamus konsisten", {
  expect_gt(length(.kamus_fungsi), 0L)
  for (nama in names(.kamus_fungsi)) {
    spec <- .kamus_fungsi[[nama]]
    expect_match(nama, "^(imp|inp|rpi|trn|frm|vis|grf|dsr|dtr)_", info = nama)
    expect_true(is.character(spec$paket) && length(spec$paket) == 1L, info = nama)
    expect_true(is.character(spec$fungsi) && length(spec$fungsi) == 1L, info = nama)
    if (length(spec$argumen) > 0L) {
      expect_false(is.null(names(spec$argumen)), info = nama)
      expect_false(anyDuplicated(names(spec$argumen)) > 0L, info = nama)
      expect_false(anyDuplicated(unname(spec$argumen)) > 0L, info = nama)
      # nama lokal tidak boleh sama dengan nama asli yang dipetakan
      expect_false(any(names(spec$argumen) == unname(spec$argumen)), info = nama)
    }
    expect_true(is.logical(spec$opsional) && length(spec$opsional) == 1L, info = nama)
    if (length(spec$setara) > 0L) {
      expect_false(is.null(names(spec$setara)), info = nama)
      # sinonim tidak boleh sekaligus menjadi argumen terjemahan atau "sama"
      expect_length(intersect(names(spec$setara), c(unname(spec$argumen), spec$sama)), 0L)
    }
    # nama yang "sama" tidak boleh juga muncul sebagai argumen yang diterjemahkan
    expect_length(intersect(spec$sama, unname(spec$argumen)), 0L)
  }
})

test_that("setiap fungsi yang diekspor ada di kamus, dan sebaliknya", {
  # Yang dibandingkan hanya fungsi berawalan keluarga. Dataset lokal (objek yang dibuat saat
  # dipakai) dan `imp_berkas_contoh` (fungsi bantu buatan sendiri) bukan pembungkus.
  ekspor <- grep(
    "^(imp|inp|rpi|trn|frm|vis|grf|dsr|dtr)_", getNamespaceExports("tidyversindonesia"),
    value = TRUE
  )
  ekspor <- setdiff(ekspor, "imp_berkas_contoh")
  expect_setequal(ekspor, names(.kamus_fungsi))
})

test_that("kamus estetika tidak menimbulkan bentrokan", {
  baku <- vapply(.estetika, function(x) x[1L], character(1))
  expect_false(anyDuplicated(baku) > 0L)
  semua <- unlist(.estetika, use.names = FALSE)
  expect_false(anyDuplicated(semua) > 0L)
})

test_that("semua dataset lokal (kecuali penguin) diekspor sebagai objek yang dibuat saat dipakai", {
  dataset <- c(
    "mobil_mpg", "berlian", "tabel1", "tabel2", "tabel3", "tangga_lagu", "tb_who",
    "rumah_tangga", "pengalaman_pasien", "penerbangan"
  )
  expect_true(all(dataset %in% getNamespaceExports("tidyversindonesia")))
})

test_that("`penerbangan` diekspor sebagai objek dan dibuat dari nycflights13 saat dipakai", {
  expect_true("penerbangan" %in% getNamespaceExports("tidyversindonesia"))
  skip_if_not_installed("nycflights13")
  asli <- nycflights13::flights
  expect_identical(
    names(tidyversindonesia::penerbangan),
    c("tahun", "bulan", "hari", "waktu_berangkat", "waktu_jadwal_berangkat",
      "keterlambatan_berangkat", "waktu_tiba", "waktu_jadwal_tiba",
      "keterlambatan_tiba", "maskapai", "nomor_penerbangan", "nomor_ekor",
      "asal", "tujuan", "waktu_terbang", "jarak", "jam", "menit", "waktu_jam")
  )
  expect_identical(dim(tidyversindonesia::penerbangan), dim(asli))
})
