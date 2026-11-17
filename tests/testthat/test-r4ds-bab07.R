# Kompatibilitas R4DS 2e, Bab 7 (Data import).
#
# Buku mengunduh berkas dari internet, dan pengujian otomatis tidak boleh bergantung
# jaringan. Karena itu setiap contoh dijalankan pada berkas sementara yang dibuat di
# sini: versi ASLI memakai judul kolom Inggris dan fungsi readr/dplyr persis seperti
# di buku; versi LOKAL memakai judul kolom Indonesia dan fungsi tidyversindonesia.
# Isi (nilai) kedua berkas sama, sehingga hasil dibandingkan menurut ISI kolom.
# Berkas contoh yang dibawa paket diuji terpisah di bagian akhir.
#
# Fungsi asli dibuat tersedia dengan nama aslinya hanya di berkas uji ini.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

read_csv <- readr::read_csv
read_csv2 <- readr::read_csv2
read_tsv <- readr::read_tsv
read_delim <- readr::read_delim
write_csv <- readr::write_csv
write_rds <- readr::write_rds
read_rds <- readr::read_rds
problems <- readr::problems
cols <- readr::cols
cols_only <- readr::cols_only
col_double <- readr::col_double
col_character <- readr::col_character
parse_number <- readr::parse_number
rename <- dplyr::rename
mutate <- dplyr::mutate
if_else <- dplyr::if_else
pull <- dplyr::pull
tibble <- tibble::tibble
tribble <- tibble::tribble
ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_point <- ggplot2::geom_point

# --- alat bantu -------------------------------------------------------------
# Tabel hasil readr membawa atribut `spec` (memuat nama kolom) dan `problems` (penunjuk
# memori yang selalu berbeda). Karena itu yang dibandingkan hanya ISI tiap kolom.
isi_kolom <- function(d) unname(lapply(seq_len(ncol(d)), function(i) d[[i]]))

sama_tabel <- function(lokal, asli, info = NULL) {
  a <- isi_kolom(lokal)
  b <- isi_kolom(asli)
  if (identical(a, b)) succeed() else expect_equal(a, b, info = info)
  expect_identical(dim(lokal), dim(asli), info = info)
}

# Berkas asli menulis usia lima dengan kata `five`; berkas lokal `lima`. Samakan dulu.
samakan_kata <- function(d, kolom) {
  d[[kolom]][d[[kolom]] %in% "five"] <- "lima"
  d
}

senyap <- function(x) suppressMessages(x)

# Kumpulkan nilai, galat, dan jumlah peringatan. Peringatan lifecycle dan pesan rlang dapat
# dibatasi frekuensinya, jadi dipaksa tampil agar asli dan lokal sebanding.
kumpulkan <- function(kode) {
  lama <- options(lifecycle_verbosity = "warning", rlib_message_verbosity = "verbose")
  on.exit(options(lama), add = TRUE)
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

sama_hasil <- function(lokal, asli, info = NULL) {
  expect_identical(lokal$galat, asli$galat, info = info)
  expect_identical(lokal$jumlah_peringatan, asli$jumlah_peringatan, info = info)
  if (!is.null(asli$nilai)) {
    expect_equal(isi_kolom(lokal$nilai), isi_kolom(asli$nilai), info = info)
  }
}

baris_siswa <- c(
  "1,Rina Putri,Nasi goreng,Makan siang saja,4",
  "2,Budi Santoso,Bakso,Makan siang saja,5",
  "3,Sari Dewi,N/A,Sarapan dan makan siang,7",
  "4,Agus Wijaya,Sate ayam,Makan siang saja,",
  "5,Dewi Lestari,Soto,Sarapan dan makan siang,%s",
  "6,Eko Prasetyo,Es campur,Makan siang saja,6"
)

tulis_siswa <- function(header, kata_lima) {
  berkas <- tempfile(fileext = ".csv")
  writeLines(c(header, sub("%s", kata_lima, baris_siswa, fixed = TRUE)), berkas)
  berkas
}

# --- 7.2 membaca berkas teks -------------------------------------------------------------
test_that("Bab 7.2: membaca berkas dengan judul kolom ber-spasi, na, dan nama non-sintaksis", {
  siswa_asli <- tulis_siswa("Student ID,Full Name,favourite.food,mealPlan,AGE", "five")
  siswa_lokal <- tulis_siswa("ID Siswa,Nama Lengkap,makanan.favorit,paketMakan,USIA", "lima")

  asli <- senyap(read_csv(siswa_asli))
  lokal <- senyap(imp_baca_csv(siswa_lokal))
  sama_tabel(lokal, samakan_kata(asli, "AGE"))
  expect_identical(
    names(lokal),
    c("ID Siswa", "Nama Lengkap", "makanan.favorit", "paketMakan", "USIA")
  )

  # `N/A` dan sel kosong menjadi NA
  asli <- senyap(read_csv(siswa_asli, na = c("N/A", "")))
  lokal <- senyap(imp_baca_csv(siswa_lokal, na = c("N/A", "")))
  sama_tabel(lokal, samakan_kata(asli, "AGE"))
  expect_true(is.na(lokal$makanan.favorit[3]))

  # mengganti nama kolom yang non-sintaksis dengan tanda kutip terbalik
  asli_r <- asli |> rename(student_id = `Student ID`, full_name = `Full Name`)
  lokal_r <- lokal |> trn_ubah_nama(id_siswa = `ID Siswa`, nama_lengkap = `Nama Lengkap`)
  sama_tabel(lokal_r, samakan_kata(asli_r, "AGE"))
  expect_identical(names(lokal_r)[1:2], c("id_siswa", "nama_lengkap"))
})

test_that("Bab 7.2: clean_names, factor, if_else, dan parse_number pada data siswa", {
  skip_if_not_installed("janitor")
  siswa_asli <- tulis_siswa("Student ID,Full Name,favourite.food,mealPlan,AGE", "five")
  siswa_lokal <- tulis_siswa("ID Siswa,Nama Lengkap,makanan.favorit,paketMakan,USIA", "lima")
  asli <- senyap(read_csv(siswa_asli, na = c("N/A", "")))
  lokal <- senyap(imp_baca_csv(siswa_lokal, na = c("N/A", "")))

  asli_c <- asli |> janitor::clean_names()
  lokal_c <- lokal |> trn_rapikan_nama()
  sama_tabel(lokal_c, samakan_kata(asli_c, "age"))
  expect_identical(
    names(lokal_c),
    c("id_siswa", "nama_lengkap", "makanan_favorit", "paket_makan", "usia")
  )

  asli_f <- asli_c |> mutate(meal_plan = factor(meal_plan))
  lokal_f <- lokal_c |> trn_mutasi(paket_makan = dsr_faktor(paket_makan))
  sama_tabel(lokal_f, samakan_kata(asli_f, "age"))

  asli_u <- asli_f |>
    mutate(age = parse_number(if_else(age == "five", "5", age)))
  lokal_u <- lokal_f |>
    trn_mutasi(usia = imp_urai_angka(frm_jika_lain(usia == "lima", "5", usia)))
  sama_tabel(lokal_u, asli_u)
  expect_identical(lokal_u$usia, c(4, 5, 7, NA, 5, 6))
})

test_that("Bab 7.2.1: data literal harus dibungkus I(), dan peringatannya sama", {
  # tanpa I(): peringatan (readr 2.2) pada kedua versi
  sama_hasil(
    kumpulkan(imp_baca_csv("a,b,c\n1,2,3\n4,5,6")),
    kumpulkan(read_csv("a,b,c\n1,2,3\n4,5,6"))
  )
  # dengan I(): tanpa peringatan, hasil sama
  asli <- senyap(read_csv(I("a,b,c\n1,2,3\n4,5,6")))
  lokal <- senyap(imp_baca_csv(I("a,b,c\n1,2,3\n4,5,6")))
  sama_tabel(lokal, asli)
  expect_identical(kumpulkan(imp_baca_csv(I("a,b,c\n1,2,3")))$jumlah_peringatan, 0L)
})

test_that("Bab 7.2.1: lewati, komentar, tanpa judul kolom, dan nama kolom sendiri", {
  teks_lewati <- "Baris metadata pertama\nBaris metadata kedua\nx,y,z\n1,2,3"
  sama_tabel(
    senyap(imp_baca_csv(I(teks_lewati), lewati = 2)),
    senyap(read_csv(I(teks_lewati), skip = 2))
  )
  teks_komentar <- "# Sebuah komentar\nx,y,z\n1,2,3"
  sama_tabel(
    senyap(imp_baca_csv(I(teks_komentar), komentar = "#")),
    senyap(read_csv(I(teks_komentar), comment = "#"))
  )
  teks_data <- "1,2,3\n4,5,6"
  sama_tabel(
    senyap(imp_baca_csv(I(teks_data), nama_kolom = FALSE)),
    senyap(read_csv(I(teks_data), col_names = FALSE))
  )
  sama_tabel(
    senyap(imp_baca_csv(I(teks_data), nama_kolom = c("x", "y", "z"))),
    senyap(read_csv(I(teks_data), col_names = c("x", "y", "z")))
  )
  expect_identical(
    names(senyap(imp_baca_csv(I(teks_data), nama_kolom = FALSE))), c("X1", "X2", "X3")
  )
})

# --- 7.3 mengendalikan tipe kolom -------------------------------------------------------------
test_that("Bab 7.3.1 dan 7.3.2: tebakan tipe, data hilang, dan masalah pembacaan", {
  sama_tabel(
    senyap(imp_baca_csv(I("logik,angka,tanggal\nTRUE,1,2021-01-15\nTRUE,45,2021-02-15\nFALSE,1234,2021-02-16"))),
    senyap(read_csv(I("logical,numeric,date\nTRUE,1,2021-01-15\nTRUE,45,2021-02-15\nFALSE,1234,2021-02-16")))
  )

  # data hilang bertanda `.`
  sama_tabel(
    senyap(imp_baca_csv(I("x\n10\n.\n20\n30"), na = ".")),
    senyap(read_csv(I("x\n10\n.\n20\n30"), na = "."))
  )

  # `.` tanpa na: kolom menjadi teks
  lokal <- senyap(imp_baca_csv(I("x\n10\n.\n20\n30")))
  asli <- senyap(read_csv(I("x\n10\n.\n20\n30")))
  sama_tabel(lokal, asli)
  expect_type(lokal$x, "character")

  # tipe kolom dipaksa: ada masalah pembacaan, dan problems() menjelaskannya
  simple_csv <- "x\n10\n.\n20\n30"
  asli <- suppressWarnings(senyap(read_csv(I(simple_csv), col_types = list(x = col_double()))))
  lokal <- suppressWarnings(senyap(imp_baca_csv(I(simple_csv), tipe_kolom = list(x = imp_kolom_desimal()))))
  sama_tabel(lokal, asli)
  masalah_asli <- problems(asli)
  masalah_lokal <- imp_masalah(lokal)
  kolom <- c("row", "col", "expected", "actual")
  expect_equal(masalah_lokal[kolom], masalah_asli[kolom])
  expect_identical(nrow(masalah_lokal), 1L)
})

test_that("Bab 7.3.3: cols(.default) dan cols_only()", {
  teks <- "x,y,z\n1,2,3\n4,5,6"
  sama_tabel(
    senyap(imp_baca_csv(I(teks), tipe_kolom = imp_kolom(.bawaan = imp_kolom_teks()))),
    senyap(read_csv(I(teks), col_types = cols(.default = col_character())))
  )
  sama_tabel(
    senyap(imp_baca_csv(I(teks), tipe_kolom = imp_kolom_saja(x = imp_kolom_teks()))),
    senyap(read_csv(I(teks), col_types = cols_only(x = col_character())))
  )
  expect_equal(
    imp_kolom(.bawaan = imp_kolom_teks()),
    cols(.default = col_character())
  )
})

# --- 7.2.4 latihan -------------------------------------------------------------------------------
test_that("Bab 7.2.4 latihan 1 sampai 4: pemisah, argumen umum, fwf, dan kutip", {
  # 1: berkas dengan pemisah `|`
  teks <- "x|y|z\n1|2|3"
  sama_tabel(
    senyap(imp_baca_delim(I(teks), pembatas = "|")),
    senyap(read_delim(I(teks), delim = "|"))
  )
  # 2: argumen yang sama pada read_csv() dan read_tsv()
  umum_asli <- intersect(names(formals(readr::read_csv)), names(formals(readr::read_tsv)))
  umum_lokal <- intersect(
    setdiff(names(formals(imp_baca_csv)), "..."),
    setdiff(names(formals(imp_baca_tsv)), "...")
  )
  expect_identical(length(umum_lokal), length(umum_asli))
  expect_true(all(c("nama_kolom", "tipe_kolom", "lewati", "komentar") %in% umum_lokal))
  # 3: argumen terpenting read_fwf()
  expect_true("posisi_kolom" %in% names(formals(imp_baca_lebar_tetap)))
  expect_true("berkas" %in% names(formals(imp_baca_lebar_tetap)))
  # 4: kutip tunggal
  sama_tabel(
    senyap(imp_baca_csv(I("x,y\n1,'a,b'"), kutip = "'")),
    senyap(read_csv(I("x,y\n1,'a,b'"), quote = "'"))
  )
})

test_that("Bab 7.2.4 latihan 5: lima berkas CSV bermasalah memberi hasil yang sama", {
  kasus <- c(
    "a,b\n1,2,3\n4,5,6",
    "a,b,c\n1,2\n1,2,3,4",
    "a,b\n\"1",
    "a,b\n1,2\na,b",
    "a;b\n1;3"
  )
  for (i in seq_along(kasus)) {
    sama_hasil(
      kumpulkan(imp_baca_csv(kasus[i])),
      kumpulkan(read_csv(kasus[i])),
      info = paste("kasus", i)
    )
  }
  # versi bertitik koma dibaca benar oleh read_csv2()
  sama_tabel(
    senyap(imp_baca_csv2(I("a;b\n1;3"))),
    senyap(read_csv2(I("a;b\n1;3")))
  )
})

test_that("Bab 7.2.4 latihan 6: nama kolom non-sintaksis pada tibble", {
  set.seed(1)
  annoying <- tibble(`1` = 1:10, `2` = `1` * 2 + rnorm(length(`1`)))
  set.seed(1)
  annoying_lokal <- inp_tibble(`1` = 1:10, `2` = `1` * 2 + dsr_acak_normal(dsr_panjang(`1`)))
  expect_identical(annoying_lokal, annoying)

  expect_identical(annoying_lokal |> trn_tarik(`1`), annoying |> pull(`1`))
  sama_tabel(
    annoying_lokal |> trn_mutasi(`3` = `2` / `1`),
    annoying |> mutate(`3` = `2` / `1`)
  )
  sama_tabel(
    annoying_lokal |> trn_mutasi(`3` = `2` / `1`) |>
      trn_ubah_nama(satu = `1`, dua = `2`, tiga = `3`),
    annoying |> mutate(`3` = `2` / `1`) |>
      rename(one = `1`, two = `2`, three = `3`)
  )
  asli_plot <- ggplot(annoying, aes(x = `1`, y = `2`)) + geom_point()
  lokal_plot <- vis_ggplot(annoying_lokal, grf_estetika(x = `1`, y = `2`)) +
    grf_geometrik_titik()
  expect_equal(
    suppressWarnings(ggplot2::layer_data(lokal_plot)),
    suppressWarnings(ggplot2::layer_data(asli_plot))
  )
})

# --- 7.4 membaca banyak berkas --------------------------------------------------------------------
test_that("Bab 7.4: membaca beberapa berkas sekaligus dengan id", {
  folder_asli <- tempfile("data-asli")
  folder_lokal <- tempfile("data-lokal")
  dir.create(folder_asli)
  dir.create(folder_lokal)
  for (i in 1:3) {
    baris <- readLines(imp_berkas_contoh(sprintf("%02d-penjualan.csv", i)))
    writeLines(baris, file.path(folder_lokal, sprintf("%02d-penjualan.csv", i)))
    baris[1] <- "month,year,brand,item,n"
    writeLines(baris, file.path(folder_asli, sprintf("%02d-sales.csv", i)))
  }
  # daftar berkas dengan pola
  sales_files <- list.files(folder_asli, pattern = "sales\\.csv$", full.names = TRUE)
  berkas_lokal <- dsr_daftar_berkas(folder_lokal, pola = "penjualan\\.csv$", nama_lengkap = TRUE)
  expect_identical(length(berkas_lokal), 3L)
  expect_identical(
    sub("penjualan", "sales", basename(berkas_lokal)), basename(sales_files)
  )

  asli <- senyap(read_csv(sales_files, id = "file"))
  lokal <- senyap(imp_baca_csv(berkas_lokal, id = "file"))
  expect_identical(dim(lokal), dim(asli))
  expect_identical(nrow(lokal), 11L)
  # isi kolom selain `file` sama; `file` memuat nama berkas masing-masing
  expect_identical(isi_kolom(lokal[-1]), isi_kolom(asli[-1]))
  expect_identical(
    sub("penjualan", "sales", basename(lokal$file)), basename(asli$file)
  )
  expect_identical(length(unique(lokal$file)), 3L)
})

# --- 7.5 menulis ke berkas -------------------------------------------------------------------------
test_that("Bab 7.5: write_csv(), write_rds(), dan parquet", {
  siswa <- inp_tibble(
    nomor = 1:3, nama = c("Rina", "Budi", "Sari"),
    paket = factor(c("a", "b", "a"))
  )
  f_asli <- tempfile(fileext = ".csv")
  f_lokal <- tempfile(fileext = ".csv")
  write_csv(siswa, f_asli)
  inp_tulis_csv(siswa, f_lokal)
  expect_identical(readLines(f_lokal), readLines(f_asli))
  # CSV tidak mempertahankan faktor: kembali menjadi teks
  kembali <- senyap(imp_baca_csv(f_lokal))
  expect_type(kembali$paket, "character")

  r_asli <- tempfile(fileext = ".rds")
  r_lokal <- tempfile(fileext = ".rds")
  write_rds(siswa, r_asli)
  inp_tulis_rds(siswa, r_lokal)
  expect_identical(imp_baca_rds(r_lokal), read_rds(r_asli))
  # RDS mempertahankan faktor
  expect_s3_class(imp_baca_rds(r_lokal)$paket, "factor")
})

test_that("Bab 7.5: parquet menulis dan membaca setara arrow", {
  skip_if_not_installed("arrow")
  siswa <- inp_tibble(
    nomor = 1:3, nama = c("Rina", "Budi", "Sari"),
    paket = factor(c("a", "b", "a"))
  )
  p_asli <- tempfile(fileext = ".parquet")
  p_lokal <- tempfile(fileext = ".parquet")
  arrow::write_parquet(siswa, p_asli)
  inp_tulis_parquet(siswa, p_lokal)
  expect_equal(imp_baca_parquet(p_lokal), arrow::read_parquet(p_asli))
  # parquet mempertahankan tipe, termasuk faktor
  expect_s3_class(imp_baca_parquet(p_lokal)$paket, "factor")
})

# --- 7.6 memasukkan data langsung ------------------------------------------------------------------
test_that("Bab 7.6: tibble() dan tribble()", {
  expect_identical(
    inp_tibble(x = c(1, 2, 5), y = c("h", "m", "g"), z = c(0.08, 0.83, 0.60)),
    tibble(x = c(1, 2, 5), y = c("h", "m", "g"), z = c(0.08, 0.83, 0.60))
  )
  expect_identical(
    inp_tribble(
      ~x, ~y, ~z,
      1, "h", 0.08,
      2, "m", 0.83,
      5, "g", 0.60
    ),
    tribble(
      ~x, ~y, ~z,
      1, "h", 0.08,
      2, "m", 0.83,
      5, "g", 0.60
    )
  )
})

# --- berkas contoh yang dibawa paket -------------------------------------------------------------------
test_that("imp_berkas_contoh(): daftar, lokasi, dan galat", {
  expect_setequal(
    imp_berkas_contoh(),
    c("siswa.csv", "01-penjualan.csv", "02-penjualan.csv", "03-penjualan.csv")
  )
  expect_true(file.exists(imp_berkas_contoh("siswa.csv")))
  expect_error(imp_berkas_contoh("tidak-ada.csv"), "tidak ditemukan")
})

test_that("berkas contoh siswa.csv memuat keanehan yang dijanjikan", {
  mentah <- senyap(imp_baca_csv(imp_berkas_contoh("siswa.csv")))
  expect_identical(dim(mentah), c(6L, 5L))
  expect_identical(
    names(mentah),
    c("ID Siswa", "Nama Lengkap", "makanan.favorit", "paketMakan", "USIA")
  )
  expect_type(mentah$USIA, "character")

  siswa <- senyap(imp_baca_csv(imp_berkas_contoh("siswa.csv"), na = c("N/A", "")))
  expect_true(is.na(siswa$makanan.favorit[3]))
  expect_true(is.na(siswa$USIA[4]))
  expect_identical(siswa$USIA[5], "lima")
})

test_that("berkas contoh penjualan terbagi ke tiga berkas dengan 11 baris", {
  berkas <- dsr_daftar_berkas(
    dirname(imp_berkas_contoh("01-penjualan.csv")),
    pola = "penjualan\\.csv$", nama_lengkap = TRUE
  )
  hasil <- senyap(imp_baca_csv(berkas, id = "berkas"))
  expect_identical(nrow(hasil), 11L)
  expect_identical(length(unique(hasil$berkas)), 3L)
  expect_identical(names(hasil), c("berkas", "bulan", "tahun", "merek", "barang", "jumlah"))
})
