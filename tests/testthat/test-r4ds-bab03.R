# Kompatibilitas R4DS 2e, Bab 3 (Data transformation).
#
# Tiap contoh dan latihan berkode dijalankan dua kali: versi ASLI (kode persis seperti
# di buku, pada nycflights13::flights) dan versi LOKAL (fungsi tidyversindonesia pada
# `penerbangan`). Karena nama kolom berbeda, hasil dibandingkan menurut ISI kolom
# (tanpa nama), urutan baris, dan jumlah kelompok.
#
# Fungsi dplyr dibuat tersedia dengan nama aslinya hanya di berkas uji ini agar kode
# buku dapat disalin persis.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

filter <- dplyr::filter
arrange <- dplyr::arrange
desc <- dplyr::desc
distinct <- dplyr::distinct
count <- dplyr::count
mutate <- dplyr::mutate
select <- dplyr::select
rename <- dplyr::rename
relocate <- dplyr::relocate
group_by <- dplyr::group_by
ungroup <- dplyr::ungroup
summarize <- dplyr::summarize
slice_max <- dplyr::slice_max
slice_min <- dplyr::slice_min
slice_head <- dplyr::slice_head
starts_with <- dplyr::starts_with
ends_with <- dplyr::ends_with
contains <- dplyr::contains
num_range <- dplyr::num_range
any_of <- dplyr::any_of
where <- dplyr::where
n <- dplyr::n
glimpse <- dplyr::glimpse
tibble <- tibble::tibble
`%>%` <- dplyr::`%>%`
ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_point <- ggplot2::geom_point
geom_smooth <- ggplot2::geom_smooth
if (requireNamespace("nycflights13", quietly = TRUE)) {
  flights <- nycflights13::flights
}

# --- alat bantu -------------------------------------------------------------
senyap <- function(x) suppressMessages(x)

sama_tabel <- function(lokal, asli, info = NULL) {
  a <- unname(as.list(dplyr::ungroup(lokal)))
  b <- unname(as.list(dplyr::ungroup(asli)))
  if (identical(a, b)) {
    succeed()
  } else {
    expect_equal(a, b, info = info)
  }
  expect_identical(dim(lokal), dim(asli), info = info)
  expect_identical(dplyr::n_groups(lokal), dplyr::n_groups(asli), info = info)
  expect_identical(
    length(dplyr::group_vars(lokal)), length(dplyr::group_vars(asli)),
    info = info
  )
}

# dplyr dapat membatasi seberapa sering pesan pengelompokan ditampilkan (sekali per sesi),
# sehingga memeriksa teks pesan secara langsung rapuh. Kumpulkan semua pesan dengan
# verbositas penuh, lalu bandingkan pesan versi asli dan lokal.
kumpulkan_pesan <- function(kode) {
  lama <- options(rlib_message_verbosity = "verbose")
  on.exit(options(lama), add = TRUE)
  pesan <- character()
  withCallingHandlers(
    force(kode),
    message = function(m) {
      pesan <<- c(pesan, conditionMessage(m))
      invokeRestart("muffleMessage")
    }
  )
  pesan
}

data_lapisan <- function(plot, i = 1L) {
  suppressWarnings(suppressMessages(ggplot2::layer_data(plot, i)))
}

# --- 3.1.2 nycflights13 -----------------------------------------------------
test_that("Bab 3.1.2: penerbangan, glimpse, dan print setara flights", {
  skip_if_not_installed("nycflights13")
  expect_identical(dim(penerbangan), dim(flights))
  expect_identical(
    capture.output(dtr_sekilas(penerbangan))[1:2],
    capture.output(glimpse(flights))[1:2]
  )
  expect_identical(
    capture.output(print(penerbangan, width = Inf))[1],
    capture.output(print(flights, width = Inf))[1]
  )
})

# --- 3.1.3 dasar dplyr -------------------------------------------------------
test_that("Bab 3.1.3: contoh jalur pipa ke IAH", {
  skip_if_not_installed("nycflights13")
  asli <- senyap(
    flights |>
      filter(dest == "IAH") |>
      group_by(year, month, day) |>
      summarize(arr_delay = mean(arr_delay, na.rm = TRUE))
  )
  lokal <- senyap(
    penerbangan |>
      trn_filter(tujuan == "IAH") |>
      trn_gabung_kelompok(tahun, bulan, hari) |>
      trn_statistik_ringkas(
        keterlambatan_tiba = dsr_rerata(keterlambatan_tiba, buang_na = TRUE)
      )
  )
  sama_tabel(lokal, asli)
})

# --- 3.2 baris ---------------------------------------------------------------
test_that("Bab 3.2.1: filter", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_filter(keterlambatan_berangkat > 120),
    flights |> filter(dep_delay > 120)
  )
  sama_tabel(
    penerbangan |> trn_filter(bulan == 1 & hari == 1),
    flights |> filter(month == 1 & day == 1)
  )
  sama_tabel(
    penerbangan |> trn_filter(bulan == 1 | bulan == 2),
    flights |> filter(month == 1 | month == 2)
  )
  sama_tabel(
    penerbangan |> trn_filter(bulan %in% c(1, 2)),
    flights |> filter(month %in% c(1, 2))
  )
  # dua kondisi dipisah koma sama dengan `&`
  sama_tabel(
    penerbangan |> trn_filter(bulan == 1, hari == 1),
    flights |> filter(month == 1, day == 1)
  )

  jan1_lokal <- penerbangan |> trn_filter(bulan == 1 & hari == 1)
  jan1 <- flights |> filter(month == 1 & day == 1)
  sama_tabel(jan1_lokal, jan1)
})

test_that("Bab 3.2.2: kesalahan umum filter", {
  skip_if_not_installed("nycflights13")
  # `=` alih-alih `==`: galat yang sama (pesan tetap bahasa Inggris)
  expect_error(flights |> filter(month = 1), "named input")
  expect_error(penerbangan |> trn_filter(bulan = 1), "named input")
  # `|` ala bahasa Inggris tidak galat, dan hasilnya sama
  sama_tabel(
    penerbangan |> trn_filter(bulan == 1 | 2),
    flights |> filter(month == 1 | 2)
  )
})

test_that("Bab 3.2.3: arrange", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_urutkan(tahun, bulan, hari, waktu_berangkat),
    flights |> arrange(year, month, day, dep_time)
  )
  sama_tabel(
    penerbangan |> trn_urutkan(frm_turun(keterlambatan_berangkat)),
    flights |> arrange(desc(dep_delay))
  )
})

test_that("Bab 3.2.4: distinct dan count", {
  skip_if_not_installed("nycflights13")
  sama_tabel(penerbangan |> trn_unik(), flights |> distinct())
  sama_tabel(
    penerbangan |> trn_unik(asal, tujuan),
    flights |> distinct(origin, dest)
  )
  sama_tabel(
    penerbangan |> trn_unik(asal, tujuan, .simpan_semua = TRUE),
    flights |> distinct(origin, dest, .keep_all = TRUE)
  )
  sama_tabel(
    penerbangan |> trn_hitung(asal, tujuan, urut = TRUE),
    flights |> count(origin, dest, sort = TRUE)
  )
})

test_that("Bab 3.2.5 latihan 1: kondisi penyaringan", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_filter(keterlambatan_tiba >= 120),
    flights |> filter(arr_delay >= 120)
  )
  sama_tabel(
    penerbangan |> trn_filter(tujuan %in% c("IAH", "HOU")),
    flights |> filter(dest %in% c("IAH", "HOU"))
  )
  sama_tabel(
    penerbangan |> trn_filter(maskapai %in% c("UA", "AA", "DL")),
    flights |> filter(carrier %in% c("UA", "AA", "DL"))
  )
  sama_tabel(
    penerbangan |> trn_filter(bulan %in% c(7, 8, 9)),
    flights |> filter(month %in% c(7, 8, 9))
  )
  sama_tabel(
    penerbangan |> trn_filter(keterlambatan_tiba > 120 & keterlambatan_berangkat <= 0),
    flights |> filter(arr_delay > 120 & dep_delay <= 0)
  )
  sama_tabel(
    penerbangan |> trn_filter(
      keterlambatan_berangkat >= 60 & keterlambatan_berangkat - keterlambatan_tiba > 30
    ),
    flights |> filter(dep_delay >= 60 & dep_delay - arr_delay > 30)
  )
})

test_that("Bab 3.2.5 latihan 2 sampai 6: urutan, penerbangan tercepat, hari, jarak", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_urutkan(frm_turun(keterlambatan_berangkat)),
    flights |> arrange(desc(dep_delay))
  )
  sama_tabel(
    penerbangan |> trn_urutkan(waktu_berangkat),
    flights |> arrange(dep_time)
  )
  # latihan 3: perhitungan di dalam arrange
  sama_tabel(
    penerbangan |> trn_urutkan(frm_turun(jarak / waktu_terbang)),
    flights |> arrange(desc(distance / air_time))
  )
  # latihan 4: apakah ada penerbangan setiap hari pada 2013?
  hari_lokal <- penerbangan |> trn_unik(tahun, bulan, hari)
  hari_asli <- flights |> distinct(year, month, day)
  sama_tabel(hari_lokal, hari_asli)
  expect_identical(nrow(hari_lokal), 365L)
  # latihan 5: jarak terjauh dan terdekat
  sama_tabel(
    penerbangan |> trn_urutkan(frm_turun(jarak)),
    flights |> arrange(desc(distance))
  )
  sama_tabel(penerbangan |> trn_urutkan(jarak), flights |> arrange(distance))
  # latihan 6: urutan filter dan arrange tidak memengaruhi hasil
  sama_tabel(
    penerbangan |> trn_filter(tujuan == "IAH") |> trn_urutkan(frm_turun(jarak)),
    penerbangan |> trn_urutkan(frm_turun(jarak)) |> trn_filter(tujuan == "IAH")
  )
})

# --- 3.3 kolom ----------------------------------------------------------------
test_that("Bab 3.3.1: mutate dengan .before, .after, dan .keep", {
  skip_if_not_installed("nycflights13")
  asli <- flights |>
    mutate(gain = dep_delay - arr_delay, speed = distance / air_time * 60)
  lokal <- penerbangan |>
    trn_mutasi(
      gain = keterlambatan_berangkat - keterlambatan_tiba,
      kecepatan = jarak / waktu_terbang * 60
    )
  sama_tabel(lokal, asli)

  sama_tabel(
    penerbangan |> trn_mutasi(
      gain = keterlambatan_berangkat - keterlambatan_tiba,
      kecepatan = jarak / waktu_terbang * 60, .sebelum = 1
    ),
    flights |> mutate(
      gain = dep_delay - arr_delay, speed = distance / air_time * 60, .before = 1
    )
  )
  sama_tabel(
    penerbangan |> trn_mutasi(
      gain = keterlambatan_berangkat - keterlambatan_tiba,
      kecepatan = jarak / waktu_terbang * 60, .setelah = hari
    ),
    flights |> mutate(
      gain = dep_delay - arr_delay, speed = distance / air_time * 60, .after = day
    )
  )
  sama_tabel(
    penerbangan |> trn_mutasi(
      gain = keterlambatan_berangkat - keterlambatan_tiba,
      jam_terbang = waktu_terbang / 60,
      gain_per_jam = gain / jam_terbang,
      .simpan = "used"
    ),
    flights |> mutate(
      gain = dep_delay - arr_delay, hours = air_time / 60,
      gain_per_hour = gain / hours, .keep = "used"
    )
  )
})

test_that("Bab 3.3.2: select dan pembantu pemilihan", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_pilih(tahun, bulan, hari),
    flights |> select(year, month, day)
  )
  sama_tabel(
    penerbangan |> trn_pilih(tahun:hari),
    flights |> select(year:day)
  )
  sama_tabel(
    penerbangan |> trn_pilih(!tahun:hari),
    flights |> select(!year:day)
  )
  sama_tabel(
    penerbangan |> trn_pilih(frm_di_mana(is.character)),
    flights |> select(where(is.character))
  )
  # mengganti nama sambil memilih
  sama_tabel(
    penerbangan |> trn_pilih(nomor_ekor_baru = nomor_ekor),
    flights |> select(tail_num = tailnum)
  )
})

test_that("Bab 3.3.2: pembantu pemilihan pada nama kolom lokal", {
  skip_if_not_installed("nycflights13")
  # Perhatikan: padanan awalan `starts_with("dep")` tidak langsung berlaku, karena
  # dalam bahasa Indonesia kata pengubah ada di belakang (waktu_berangkat, bukan
  # berangkat_waktu). Pemilihan memakai `frm_cocok()` atau `frm_salah_satu()`.
  sama_tabel(
    penerbangan |> trn_pilih(frm_cocok("^(waktu|keterlambatan)_(berangkat|tiba)$")),
    flights |> select(starts_with("dep"), starts_with("arr"))
  )
  # `frm_diakhiri()` menjaring juga kolom terjadwal: bukan padanan `starts_with("arr")`
  expect_gt(
    ncol(penerbangan |> trn_pilih(frm_diakhiri("_tiba"))),
    ncol(flights |> select(starts_with("arr")))
  )
  # `contains("TIME")` mengabaikan huruf besar/kecil secara bawaan, dan padanannya
  # `frm_memuat("WAKTU")` menjaring kolom yang sama (menurut posisi)
  sama_tabel(
    penerbangan |> trn_pilih(frm_memuat("WAKTU")),
    flights |> select(contains("TIME"))
  )
  sama_tabel(
    penerbangan |> trn_pilih(frm_memuat("WAKTU", abaikan_kapital = FALSE)),
    flights |> select(contains("TIME", ignore.case = FALSE))
  )
  # `num_range()`
  campur <- tibble(x1 = 1, x2 = 2, x3 = 3, y = 4)
  expect_identical(
    trn_pilih(campur, frm_rentang_angka("x", 1:3)),
    select(campur, num_range("x", 1:3))
  )
})

test_that("Bab 3.3.3 dan 3.3.4: rename dan relocate", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_ubah_nama(nomor_ekor_baru = nomor_ekor),
    flights |> rename(tail_num = tailnum)
  )
  sama_tabel(
    penerbangan |> trn_pindah(waktu_jam, waktu_terbang),
    flights |> relocate(time_hour, air_time)
  )
  sama_tabel(
    penerbangan |> trn_pindah(tahun:waktu_berangkat, .setelah = waktu_jam),
    flights |> relocate(year:dep_time, .after = time_hour)
  )
  # `relocate(starts_with("arr"), .before = dep_time)`: kolom kedatangan non-terjadwal
  sama_tabel(
    penerbangan |> trn_pindah(
      frm_salah_satu(c("waktu_tiba", "keterlambatan_tiba")),
      .sebelum = waktu_berangkat
    ),
    flights |> relocate(starts_with("arr"), .before = dep_time)
  )
})

test_that("Bab 3.3.3: rapikan nama dengan janitor", {
  skip_if_not_installed("janitor")
  kotor <- tibble(`Nama Kolom` = 1, `Nilai Ke-2` = 2)
  expect_identical(trn_rapikan_nama(kotor), janitor::clean_names(kotor))
})

test_that("Bab 3.3.5 latihan: kolom", {
  skip_if_not_installed("nycflights13")
  # 1 dan 2: cara memilih waktu dan keterlambatan
  sama_tabel(
    penerbangan |> trn_pilih(
      waktu_berangkat, waktu_jadwal_berangkat, keterlambatan_berangkat
    ),
    flights |> select(dep_time, sched_dep_time, dep_delay)
  )
  asli <- flights |> select(dep_time, dep_delay, arr_time, arr_delay)
  sama_tabel(
    penerbangan |> trn_pilih(
      waktu_berangkat, keterlambatan_berangkat, waktu_tiba, keterlambatan_tiba
    ),
    asli
  )
  sama_tabel(
    penerbangan |> trn_pilih(frm_cocok("^(waktu|keterlambatan)_(berangkat|tiba)$")),
    asli
  )
  # 3: menyebut kolom yang sama berulang kali tidak berpengaruh
  sama_tabel(
    penerbangan |> trn_pilih(waktu_berangkat, waktu_berangkat),
    flights |> select(dep_time, dep_time)
  )
  # 4: any_of()
  variabel_asli <- c("year", "month", "day", "dep_delay", "arr_delay")
  variabel <- c("tahun", "bulan", "hari", "keterlambatan_berangkat", "keterlambatan_tiba")
  sama_tabel(
    penerbangan |> trn_pilih(frm_salah_satu(variabel)),
    flights |> select(any_of(variabel_asli))
  )
  # 6: ganti nama dan pindahkan ke awal
  sama_tabel(
    penerbangan |>
      trn_ubah_nama(waktu_terbang_menit = waktu_terbang) |>
      trn_pindah(waktu_terbang_menit),
    flights |> rename(air_time_min = air_time) |> relocate(air_time_min)
  )
  # 7: urutan menurut kolom yang sudah tidak ada menghasilkan galat pada keduanya
  expect_error(flights |> select(tailnum) |> arrange(arr_delay), "not found")
  expect_error(
    penerbangan |> trn_pilih(nomor_ekor) |> trn_urutkan(keterlambatan_tiba),
    "not found"
  )
})

# --- 3.4 pipa -------------------------------------------------------------------
test_that("Bab 3.4: pipa, bentuk bersarang, dan objek antara", {
  skip_if_not_installed("nycflights13")
  asli <- flights |>
    filter(dest == "IAH") |>
    mutate(speed = distance / air_time * 60) |>
    select(year:day, dep_time, carrier, flight, speed) |>
    arrange(desc(speed))
  lokal <- penerbangan |>
    trn_filter(tujuan == "IAH") |>
    trn_mutasi(kecepatan = jarak / waktu_terbang * 60) |>
    trn_pilih(tahun:hari, waktu_berangkat, maskapai, nomor_penerbangan, kecepatan) |>
    trn_urutkan(frm_turun(kecepatan))
  sama_tabel(lokal, asli)

  bersarang <- trn_urutkan(
    trn_pilih(
      trn_mutasi(
        trn_filter(penerbangan, tujuan == "IAH"),
        kecepatan = jarak / waktu_terbang * 60
      ),
      tahun:hari, waktu_berangkat, maskapai, nomor_penerbangan, kecepatan
    ),
    frm_turun(kecepatan)
  )
  sama_tabel(bersarang, asli)

  p1 <- trn_filter(penerbangan, tujuan == "IAH")
  p2 <- trn_mutasi(p1, kecepatan = jarak / waktu_terbang * 60)
  p3 <- trn_pilih(p2, tahun:hari, waktu_berangkat, maskapai, nomor_penerbangan, kecepatan)
  sama_tabel(trn_urutkan(p3, frm_turun(kecepatan)), asli)
})

test_that("Bab 3.4: pipa magrittr %>% berfungsi dengan fungsi lokal", {
  skip_if_not_installed("nycflights13")
  asli <- flights %>%
    group_by(month) %>%
    summarize(n = n())
  lokal <- penerbangan %>%
    trn_gabung_kelompok(bulan) %>%
    trn_statistik_ringkas(n = frm_jumlah())
  sama_tabel(lokal, asli)
})

test_that("Bab 3.4: catatan samping mtcars %>% group_by(cyl) %>% summarize(n = n())", {
  asli <- datasets::mtcars %>%
    group_by(cyl) %>%
    summarize(n = n())
  lokal <- mobil %>%
    trn_gabung_kelompok(silinder) %>%
    trn_statistik_ringkas(n = frm_jumlah())
  sama_tabel(lokal, asli)
  expect_identical(nrow(lokal), 3L)
})

# --- 3.5 kelompok -----------------------------------------------------------------
test_that("Bab 3.5.1 dan 3.5.2: group_by dan summarize", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(bulan),
    flights |> group_by(month)
  )

  # tanpa na.rm: semua NA
  asli <- flights |> group_by(month) |> summarize(avg_delay = mean(dep_delay))
  lokal <- penerbangan |>
    trn_gabung_kelompok(bulan) |>
    trn_statistik_ringkas(rerata_keterlambatan = dsr_rerata(keterlambatan_berangkat))
  sama_tabel(lokal, asli)
  expect_true(all(is.na(lokal[[2]])))

  asli <- flights |>
    group_by(month) |>
    summarize(avg_delay = mean(dep_delay, na.rm = TRUE))
  lokal <- penerbangan |>
    trn_gabung_kelompok(bulan) |>
    trn_statistik_ringkas(
      rerata_keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE)
    )
  sama_tabel(lokal, asli)

  asli <- flights |>
    group_by(month) |>
    summarize(avg_delay = mean(dep_delay, na.rm = TRUE), n = n())
  lokal <- penerbangan |>
    trn_gabung_kelompok(bulan) |>
    trn_statistik_ringkas(
      rerata_keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE),
      n = frm_jumlah()
    )
  sama_tabel(lokal, asli)
})

test_that("Bab 3.5.3: fungsi slice", {
  skip_if_not_installed("nycflights13")
  asli <- flights |>
    group_by(dest) |>
    slice_max(arr_delay, n = 1) |>
    relocate(dest)
  lokal <- penerbangan |>
    trn_gabung_kelompok(tujuan) |>
    trn_iris_maks(keterlambatan_tiba, n = 1) |>
    trn_pindah(tujuan)
  sama_tabel(lokal, asli)
  expect_identical(nrow(lokal), 108L)

  # dengan_seri = FALSE memberi tepat satu baris per tujuan
  asli <- flights |>
    group_by(dest) |>
    slice_max(arr_delay, n = 1, with_ties = FALSE)
  lokal <- penerbangan |>
    trn_gabung_kelompok(tujuan) |>
    trn_iris_maks(keterlambatan_tiba, n = 1, dengan_seri = FALSE)
  sama_tabel(lokal, asli)
  expect_identical(nrow(lokal), 105L)

  # slice_head, slice_tail, slice_min, slice_sample (dengan benih sama), dan prop
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(tujuan) |> trn_iris_kepala(n = 1),
    flights |> group_by(dest) |> slice_head(n = 1)
  )
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(tujuan) |> trn_iris_ekor(n = 1),
    flights |> group_by(dest) |> dplyr::slice_tail(n = 1)
  )
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(tujuan) |> trn_iris_min(keterlambatan_tiba, n = 1),
    flights |> group_by(dest) |> slice_min(arr_delay, n = 1)
  )
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(tujuan) |> trn_iris_kepala(proporsi = 0.1),
    flights |> group_by(dest) |> slice_head(prop = 0.1)
  )
  set.seed(1)
  lokal <- penerbangan |> trn_gabung_kelompok(tujuan) |> trn_iris_acak(n = 1)
  set.seed(1)
  asli <- flights |> group_by(dest) |> dplyr::slice_sample(n = 1)
  sama_tabel(lokal, asli)
})

test_that("Bab 3.5.4: pengelompokan ganda dan argumen .groups", {
  skip_if_not_installed("nycflights13")
  daily_lokal <- penerbangan |> trn_gabung_kelompok(tahun, bulan, hari)
  daily <- flights |> group_by(year, month, day)
  sama_tabel(daily_lokal, daily)
  expect_identical(dplyr::n_groups(daily_lokal), 365L)

  # pesan pengelompokan (bila ada) sama persis pada versi asli dan lokal, berbahasa Inggris
  pesan_asli <- kumpulkan_pesan(daily |> summarize(n = n()))
  pesan_lokal <- kumpulkan_pesan(daily_lokal |> trn_statistik_ringkas(n = frm_jumlah()))
  expect_identical(pesan_lokal, pesan_asli)
  if (length(pesan_asli) > 0L) {
    expect_match(paste(pesan_asli, collapse = " "), "summarise")
  }

  for (nilai in c("drop_last", "drop", "keep")) {
    sama_tabel(
      daily_lokal |> trn_statistik_ringkas(n = frm_jumlah(), .hasil_kelompok = nilai),
      daily |> summarize(n = n(), .groups = nilai),
      info = nilai
    )
  }
})

test_that("Bab 3.5.5 dan 3.5.6: ungroup dan .by", {
  skip_if_not_installed("nycflights13")
  daily_lokal <- penerbangan |> trn_gabung_kelompok(tahun, bulan, hari)
  daily <- flights |> group_by(year, month, day)
  sama_tabel(daily_lokal |> trn_lepas_kelompok(), daily |> ungroup())

  asli <- daily |>
    ungroup() |>
    summarize(avg_delay = mean(dep_delay, na.rm = TRUE), flights = n())
  lokal <- daily_lokal |>
    trn_lepas_kelompok() |>
    trn_statistik_ringkas(
      rerata_keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE),
      penerbangan = frm_jumlah()
    )
  sama_tabel(lokal, asli)
  expect_identical(nrow(lokal), 1L)

  sama_tabel(
    penerbangan |> trn_statistik_ringkas(
      keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE),
      n = frm_jumlah(), .berdasarkan = bulan
    ),
    flights |> summarize(
      delay = mean(dep_delay, na.rm = TRUE), n = n(), .by = month
    )
  )
  sama_tabel(
    penerbangan |> trn_statistik_ringkas(
      keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE),
      n = frm_jumlah(), .berdasarkan = c(asal, tujuan)
    ),
    flights |> summarize(
      delay = mean(dep_delay, na.rm = TRUE), n = n(), .by = c(origin, dest)
    )
  )
})

test_that("Bab 3.5.7 latihan 1 sampai 5: kelompok pada penerbangan", {
  skip_if_not_installed("nycflights13")
  # 1
  sama_tabel(
    penerbangan |>
      trn_gabung_kelompok(maskapai) |>
      trn_statistik_ringkas(rerata = dsr_rerata(keterlambatan_tiba, buang_na = TRUE)) |>
      trn_urutkan(frm_turun(rerata)),
    flights |>
      group_by(carrier) |>
      summarize(rerata = mean(arr_delay, na.rm = TRUE)) |>
      arrange(desc(rerata))
  )
  sama_tabel(
    senyap(penerbangan |> trn_gabung_kelompok(maskapai, tujuan) |> trn_statistik_ringkas(frm_jumlah())),
    senyap(flights |> group_by(carrier, dest) |> summarize(n()))
  )
  # 2
  sama_tabel(
    penerbangan |>
      trn_gabung_kelompok(tujuan) |>
      trn_iris_maks(keterlambatan_berangkat, n = 1),
    flights |> group_by(dest) |> slice_max(dep_delay, n = 1)
  )
  # 3: keterlambatan menurut jam, dan plotnya
  asli <- flights |>
    group_by(hour) |>
    summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE))
  lokal <- penerbangan |>
    trn_gabung_kelompok(jam) |>
    trn_statistik_ringkas(
      rerata_keterlambatan = dsr_rerata(keterlambatan_berangkat, buang_na = TRUE)
    )
  sama_tabel(lokal, asli)
  p_asli <- asli |> ggplot(aes(x = hour, y = avg_dep_delay)) + geom_smooth()
  p_lokal <- lokal |>
    vis_ggplot(grf_estetika(x = jam, y = rerata_keterlambatan)) +
    grf_geometrik_haluskan()
  expect_equal(data_lapisan(p_lokal), data_lapisan(p_asli))
  # 4: n negatif pada slice_min menghasilkan hal yang sama pada keduanya
  hasil <- function(ekspresi) tryCatch(nrow(ekspresi), error = function(e) "galat")
  expect_identical(
    hasil(penerbangan |> trn_iris_min(keterlambatan_berangkat, n = -1)),
    hasil(flights |> slice_min(dep_delay, n = -1))
  )
  # 5: count() sebagai group_by() + summarize(n = n())
  sama_tabel(
    penerbangan |> trn_hitung(asal),
    flights |> count(origin)
  )
  sama_tabel(
    penerbangan |> trn_gabung_kelompok(asal) |> trn_statistik_ringkas(n = frm_jumlah()),
    flights |> group_by(origin) |> summarize(n = n())
  )
  sama_tabel(
    penerbangan |> trn_hitung(tujuan, urut = TRUE),
    flights |> count(dest, sort = TRUE)
  )
})

test_that("Bab 3.5.7 latihan 6: tibble kecil df", {
  df_asli <- tibble(
    x = 1:5, y = c("a", "b", "a", "a", "b"), z = c("K", "K", "L", "L", "K")
  )
  df <- inp_tibble(
    x = 1:5, y = c("a", "b", "a", "a", "b"), z = c("K", "K", "L", "L", "K")
  )
  expect_identical(df, df_asli)

  sama_tabel(df |> trn_gabung_kelompok(y), df_asli |> group_by(y))
  sama_tabel(df |> trn_urutkan(y), df_asli |> arrange(y))
  sama_tabel(
    df |> trn_gabung_kelompok(y) |> trn_statistik_ringkas(mean_x = dsr_rerata(x)),
    df_asli |> group_by(y) |> summarize(mean_x = mean(x))
  )
  # d: pesan pengelompokan pada kedua versi sama
  expect_identical(
    kumpulkan_pesan(
      df |> trn_gabung_kelompok(y, z) |> trn_statistik_ringkas(mean_x = dsr_rerata(x))
    ),
    kumpulkan_pesan(
      df_asli |> group_by(y, z) |> summarize(mean_x = mean(x))
    )
  )
  sama_tabel(
    senyap(df |> trn_gabung_kelompok(y, z) |> trn_statistik_ringkas(mean_x = dsr_rerata(x))),
    senyap(df_asli |> group_by(y, z) |> summarize(mean_x = mean(x)))
  )
  # e: .groups = "drop"
  sama_tabel(
    df |> trn_gabung_kelompok(y, z) |>
      trn_statistik_ringkas(mean_x = dsr_rerata(x), .hasil_kelompok = "drop"),
    df_asli |> group_by(y, z) |> summarize(mean_x = mean(x), .groups = "drop")
  )
  # f: summarize dan mutate pada data berkelompok
  sama_tabel(
    df |> trn_gabung_kelompok(y, z) |> trn_mutasi(mean_x = dsr_rerata(x)),
    df_asli |> group_by(y, z) |> mutate(mean_x = mean(x))
  )
})

# --- 3.6 studi kasus -----------------------------------------------------------------
test_that("Bab 3.6: pola studi kasus (ringkasan, saring n, plot) pada penerbangan", {
  skip_if_not_installed("nycflights13")
  # Dataset `Lahman::Batting` ditunda; polanya (ringkasan dengan n(), filter, plot) diuji
  # pada penerbangan dengan fungsi yang persis sama dengan buku.
  asli <- flights |>
    group_by(dest) |>
    summarize(performance = mean(arr_delay, na.rm = TRUE), n = n())
  lokal <- penerbangan |>
    trn_gabung_kelompok(tujuan) |>
    trn_statistik_ringkas(
      performa = dsr_rerata(keterlambatan_tiba, buang_na = TRUE),
      n = frm_jumlah()
    )
  sama_tabel(lokal, asli)

  p_asli <- asli |>
    filter(n > 100) |>
    ggplot(aes(x = n, y = performance)) +
    geom_point(alpha = 1 / 10) +
    geom_smooth(se = FALSE)
  p_lokal <- lokal |>
    trn_filter(n > 100) |>
    vis_ggplot(grf_estetika(x = n, y = performa)) +
    grf_geometrik_titik(alfa = 1 / 10) +
    grf_geometrik_haluskan(selang_kepercayaan = FALSE)
  expect_equal(data_lapisan(p_lokal, 1L), data_lapisan(p_asli, 1L))
  expect_equal(data_lapisan(p_lokal, 2L), data_lapisan(p_asli, 2L))

  sama_tabel(
    lokal |> trn_urutkan(frm_turun(performa)),
    asli |> arrange(desc(performance))
  )
})
