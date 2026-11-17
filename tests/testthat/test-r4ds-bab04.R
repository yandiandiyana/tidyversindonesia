# Kompatibilitas R4DS 2e, Bab 4 (Workflow: code style).
# Bab ini tentang gaya penulisan kode (nama, spasi, pipa, ggplot2, pemisah bagian). Operator
# `%/%` dan `%%` tidak berubah. Contoh berkode dijalankan pada `flights` (asli) dan
# `penerbangan` (lokal) dan dibandingkan menurut isi kolom.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

filter <- dplyr::filter
group_by <- dplyr::group_by
summarize <- dplyr::summarize
mutate <- dplyr::mutate
count <- dplyr::count
n <- dplyr::n
ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_point <- ggplot2::geom_point
geom_line <- ggplot2::geom_line
geom_smooth <- ggplot2::geom_smooth
if (requireNamespace("nycflights13", quietly = TRUE)) flights <- nycflights13::flights

senyap <- function(x) suppressMessages(x)
isi_kolom <- function(d) unname(lapply(seq_len(ncol(d)), function(i) d[[i]]))
sama_tabel <- function(lokal, asli, info = NULL) {
  a <- isi_kolom(lokal)
  b <- isi_kolom(asli)
  if (identical(a, b)) succeed() else expect_equal(a, b, info = info)
  expect_identical(dim(lokal), dim(asli), info = info)
}
data_lapisan <- function(plot, i = 1L) {
  suppressWarnings(suppressMessages(ggplot2::layer_data(plot, i)))
}

test_that("Bab 4.1 dan 4.2: nama objek dan operator `%/%` dan `%%`", {
  skip_if_not_installed("nycflights13")
  short_flights <- flights |> filter(air_time < 60)
  penerbangan_pendek <- penerbangan |> trn_filter(waktu_terbang < 60)
  sama_tabel(penerbangan_pendek, short_flights)

  asli <- flights |>
    mutate(
      speed = distance / air_time,
      dep_hour = dep_time %/% 100,
      dep_minute = dep_time %% 100
    )
  lokal <- penerbangan |>
    trn_mutasi(
      kecepatan = jarak / waktu_terbang,
      jam_berangkat = waktu_berangkat %/% 100,
      menit_berangkat = waktu_berangkat %% 100
    )
  sama_tabel(lokal, asli)
})

test_that("Bab 4.4: gaya pipa pada filter, count, dan summarize", {
  skip_if_not_installed("nycflights13")
  sama_tabel(
    penerbangan |>
      trn_filter(!dsr_adalah_na(keterlambatan_tiba), !dsr_adalah_na(nomor_ekor)) |>
      trn_hitung(tujuan),
    flights |>
      filter(!is.na(arr_delay), !is.na(tailnum)) |>
      count(dest)
  )
  # `!is.na()` dari R dasar juga tetap berfungsi pada fungsi lokal
  sama_tabel(
    penerbangan |>
      trn_filter(!is.na(keterlambatan_tiba), !is.na(nomor_ekor)) |>
      trn_hitung(tujuan),
    flights |>
      filter(!is.na(arr_delay), !is.na(tailnum)) |>
      count(dest)
  )
  sama_tabel(
    penerbangan |>
      trn_gabung_kelompok(nomor_ekor) |>
      trn_statistik_ringkas(
        keterlambatan = dsr_rerata(keterlambatan_tiba, buang_na = TRUE),
        n = frm_jumlah()
      ),
    flights |>
      group_by(tailnum) |>
      summarize(delay = mean(arr_delay, na.rm = TRUE), n = n())
  )
})

test_that("Bab 4.5: gaya ggplot2 setelah pipa", {
  skip_if_not_installed("nycflights13")
  asli <- flights |>
    group_by(month) |>
    summarize(delay = mean(arr_delay, na.rm = TRUE)) |>
    ggplot(aes(x = month, y = delay)) +
    geom_point() +
    geom_line()
  lokal <- penerbangan |>
    trn_gabung_kelompok(bulan) |>
    trn_statistik_ringkas(keterlambatan = dsr_rerata(keterlambatan_tiba, buang_na = TRUE)) |>
    vis_ggplot(grf_estetika(x = bulan, y = keterlambatan)) +
    grf_geometrik_titik() +
    grf_geometrik_garis()
  expect_equal(data_lapisan(lokal, 1L), data_lapisan(asli, 1L))
  expect_equal(data_lapisan(lokal, 2L), data_lapisan(asli, 2L))

  # penghalus dengan `span`, `se`, `color`, dan `linewidth`
  halus_asli <- asli + geom_smooth(
    method = "loess", span = 0.5, se = FALSE, color = "white", linewidth = 4
  )
  halus_lokal <- lokal + grf_geometrik_haluskan(
    metode = "loess", rentang = 0.5, selang_kepercayaan = FALSE,
    warna = "white", ketebalan_garis = 4
  )
  expect_equal(data_lapisan(halus_lokal, 3L), data_lapisan(halus_asli, 3L))
})

test_that("Bab 4.6 latihan 1: kode yang dirapikan setara kode asli yang berantakan", {
  skip_if_not_installed("nycflights13")
  # versi berantakan (seperti di buku), tanpa spasi
  asli_1 <- senyap(flights|>filter(dest=="IAH")|>group_by(year,month,day)|>summarize(n=n(),delay=mean(arr_delay,na.rm=TRUE))|>filter(n>10))
  lokal_1 <- senyap(
    penerbangan |>
      trn_filter(tujuan == "IAH") |>
      trn_gabung_kelompok(tahun, bulan, hari) |>
      trn_statistik_ringkas(
        n = frm_jumlah(),
        keterlambatan = dsr_rerata(keterlambatan_tiba, buang_na = TRUE)
      ) |>
      trn_filter(n > 10)
  )
  sama_tabel(lokal_1, asli_1)

  asli_2 <- flights|>filter(carrier=="UA",dest%in%c("IAH","HOU"),sched_dep_time>0900,sched_arr_time<2000)|>group_by(flight)|>summarize(delay=mean(arr_delay,na.rm=TRUE),cancelled=sum(is.na(arr_delay)),n=n())|>filter(n>10)
  lokal_2 <- penerbangan |>
    trn_filter(
      maskapai == "UA",
      tujuan %in% c("IAH", "HOU"),
      waktu_jadwal_berangkat > 0900,
      waktu_jadwal_tiba < 2000
    ) |>
    trn_gabung_kelompok(nomor_penerbangan) |>
    trn_statistik_ringkas(
      keterlambatan = dsr_rerata(keterlambatan_tiba, buang_na = TRUE),
      dibatalkan = dsr_jumlah(dsr_adalah_na(keterlambatan_tiba)),
      n = frm_jumlah()
    ) |>
    trn_filter(n > 10)
  sama_tabel(lokal_2, asli_2)
})
