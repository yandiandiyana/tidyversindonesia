# Kompatibilitas R4DS 2e, Bab 5 (Data tidying).
#
# Tiap contoh berkode dijalankan dua kali: versi ASLI (kode persis seperti di buku, pada
# dataset tidyr) dan versi LOKAL (fungsi tidyversindonesia pada dataset lokal). Hasil
# dibandingkan menurut ISI kolom (tanpa nama) dan urutan baris. Kolom yang nilainya
# memang diterjemahkan (mis. `child1` menjadi `anak1`) dibandingkan lewat peta terjemahan.
#
# Fungsi asli dibuat tersedia dengan nama aslinya hanya di berkas uji ini agar kode buku
# dapat disalin persis.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

pivot_longer <- tidyr::pivot_longer
pivot_wider <- tidyr::pivot_wider
mutate <- dplyr::mutate
group_by <- dplyr::group_by
summarize <- dplyr::summarize
filter <- dplyr::filter
distinct <- dplyr::distinct
select <- dplyr::select
pull <- dplyr::pull
n <- dplyr::n
starts_with <- dplyr::starts_with
tribble <- tibble::tribble
parse_number <- readr::parse_number
ggplot <- ggplot2::ggplot
aes <- ggplot2::aes
geom_line <- ggplot2::geom_line
geom_point <- ggplot2::geom_point
scale_x_continuous <- ggplot2::scale_x_continuous
scale_y_reverse <- ggplot2::scale_y_reverse
table1 <- tidyr::table1
table2 <- tidyr::table2
table3 <- tidyr::table3
billboard <- tidyr::billboard
who2 <- tidyr::who2
household <- tidyr::household
cms_patient_experience <- tidyr::cms_patient_experience

# --- alat bantu -------------------------------------------------------------
sama_tabel <- function(lokal, asli, info = NULL) {
  a <- unname(as.list(dplyr::ungroup(lokal)))
  b <- unname(as.list(dplyr::ungroup(asli)))
  if (identical(a, b)) {
    succeed()
  } else {
    expect_equal(a, b, info = info)
  }
  expect_identical(dim(lokal), dim(asli), info = info)
}

data_lapisan <- function(plot, i = 1L) {
  suppressWarnings(suppressMessages(ggplot2::layer_data(plot, i)))
}

# --- 5.2 data rapi ------------------------------------------------------------
test_that("Bab 5.2: tabel1, tabel2, tabel3 setara table1, table2, table3", {
  sama_tabel(tabel1, table1)
  expect_identical(tabel2$jumlah, table2$count)
  expect_identical(
    tabel2$jenis,
    unname(c(cases = "kasus", population = "populasi")[table2$type])
  )
  expect_identical(tabel2$negara, table2$country)
  sama_tabel(tabel3, table3)
  expect_identical(names(tabel1), c("negara", "tahun", "kasus", "populasi"))
})

test_that("Bab 5.2: menghitung laju dan total kasus pada tabel rapi", {
  sama_tabel(
    tabel1 |> trn_mutasi(rasio = kasus / populasi * 10000),
    table1 |> mutate(rate = cases / population * 10000)
  )
  sama_tabel(
    tabel1 |> trn_gabung_kelompok(tahun) |> trn_statistik_ringkas(total_kasus = dsr_jumlah(kasus)),
    table1 |> group_by(year) |> summarize(total_cases = sum(cases))
  )
})

test_that("Bab 5.2: visualisasi perubahan kasus seiring waktu", {
  asli <- ggplot(table1, aes(x = year, y = cases)) +
    geom_line(aes(group = country), color = "grey50") +
    geom_point(aes(color = country, shape = country)) +
    scale_x_continuous(breaks = c(1999, 2000))
  lokal <- vis_ggplot(tabel1, grf_estetika(x = tahun, y = kasus)) +
    grf_geometrik_garis(grf_estetika(kelompok = negara), warna = "grey50") +
    grf_geometrik_titik(grf_estetika(warna = negara, bentuk = negara)) +
    grf_skala_x_kontinu(posisi_tanda = c(1999, 2000))
  expect_equal(data_lapisan(lokal, 1L), data_lapisan(asli, 1L))
  expect_equal(data_lapisan(lokal, 2L), data_lapisan(asli, 2L))
})

# --- 5.3.1 data pada nama kolom --------------------------------------------------
test_that("Bab 5.3.1: billboard menjadi tangga_lagu, dan pivot_longer dasar", {
  expect_identical(dim(tangga_lagu), dim(billboard))
  expect_identical(names(tangga_lagu)[1:3], c("artis", "lagu", "tanggal_masuk"))
  expect_identical(
    names(tangga_lagu)[-(1:3)],
    sub("^wk", "minggu", names(billboard)[-(1:3)])
  )

  asli <- billboard |>
    pivot_longer(cols = starts_with("wk"), names_to = "week", values_to = "rank")
  lokal <- tangga_lagu |>
    rpi_panjang(kolom = frm_diawali("minggu"), nama_ke = "minggu", nilai_ke = "peringkat")
  expect_identical(dim(lokal), dim(asli))
  expect_identical(nrow(lokal), 24092L)
  # nilai kolom nama berawalan `minggu` (asli: `wk`); kolom lain identik
  expect_identical(lokal$minggu, sub("^wk", "minggu", asli$week))
  expect_identical(lokal$peringkat, asli$rank)
  expect_identical(lokal$artis, asli$artist)

  # cols dapat ditulis dengan tanda seru juga
  alternatif <- tangga_lagu |>
    rpi_panjang(
      kolom = !c(artis, lagu, tanggal_masuk),
      nama_ke = "minggu", nilai_ke = "peringkat"
    )
  expect_identical(alternatif, lokal)
})

test_that("Bab 5.3.1: values_drop_na, parse_number, dan plot peringkat", {
  asli <- billboard |>
    pivot_longer(
      cols = starts_with("wk"), names_to = "week", values_to = "rank",
      values_drop_na = TRUE
    )
  lokal <- tangga_lagu |>
    rpi_panjang(
      kolom = frm_diawali("minggu"), nama_ke = "minggu", nilai_ke = "peringkat",
      buang_nilai_na = TRUE
    )
  expect_identical(nrow(lokal), 5307L)
  expect_identical(lokal$peringkat, asli$rank)

  billboard_longer <- billboard |>
    pivot_longer(
      cols = starts_with("wk"), names_to = "week", values_to = "rank",
      values_drop_na = TRUE
    ) |>
    mutate(week = parse_number(week))
  tangga_lagu_panjang <- tangga_lagu |>
    rpi_panjang(
      kolom = frm_diawali("minggu"), nama_ke = "minggu", nilai_ke = "peringkat",
      buang_nilai_na = TRUE
    ) |>
    trn_mutasi(minggu = imp_urai_angka(minggu))
  sama_tabel(tangga_lagu_panjang, billboard_longer)

  p_asli <- billboard_longer |>
    ggplot(aes(x = week, y = rank, group = track)) +
    geom_line(alpha = 0.25) +
    scale_y_reverse()
  p_lokal <- tangga_lagu_panjang |>
    vis_ggplot(grf_estetika(x = minggu, y = peringkat, kelompok = lagu)) +
    grf_geometrik_garis(alfa = 0.25) +
    grf_skala_y_balik()
  expect_equal(data_lapisan(p_lokal), data_lapisan(p_asli))
})

# --- 5.3.2 bagaimana pivoting bekerja ----------------------------------------------
test_that("Bab 5.3.2: tribble dan pivot_longer pada data tekanan darah", {
  df_asli <- tribble(
    ~id,  ~bp1, ~bp2,
     "A",  100,  120,
     "B",  140,  115,
     "C",  120,  125
  )
  df <- inp_tribble(
    ~id,  ~bp1, ~bp2,
     "A",  100,  120,
     "B",  140,  115,
     "C",  120,  125
  )
  expect_identical(df, df_asli)

  sama_tabel(
    df |> rpi_panjang(kolom = bp1:bp2, nama_ke = "pengukuran", nilai_ke = "nilai"),
    df_asli |> pivot_longer(cols = bp1:bp2, names_to = "measurement", values_to = "value")
  )
})

# --- 5.3.3 banyak variabel pada nama kolom ---------------------------------------------
test_that("Bab 5.3.3: tb_who dan names_sep", {
  expect_identical(dim(tb_who), dim(who2))
  expect_identical(names(tb_who)[1:2], c("negara", "tahun"))
  # kode kolom WHO tidak diterjemahkan
  expect_identical(names(tb_who)[-(1:2)], names(who2)[-(1:2)])

  asli <- who2 |>
    pivot_longer(
      cols = !(country:year),
      names_to = c("diagnosis", "gender", "age"),
      names_sep = "_",
      values_to = "count"
    )
  lokal <- tb_who |>
    rpi_panjang(
      kolom = !(negara:tahun),
      nama_ke = c("diagnosis", "jenis_kelamin", "umur"),
      pemisah_nama = "_",
      nilai_ke = "jumlah"
    )
  sama_tabel(lokal, asli)
  expect_identical(nrow(lokal), 405440L)
  expect_identical(names(lokal), c("negara", "tahun", "diagnosis", "jenis_kelamin", "umur", "jumlah"))
})

# --- 5.3.4 nama variabel dan data pada judul kolom ----------------------------------------
test_that("Bab 5.3.4: household, `.value`, dan values_drop_na", {
  expect_identical(
    names(rumah_tangga),
    c("keluarga", "lahir_anak1", "lahir_anak2", "nama_anak1", "nama_anak2")
  )
  asli <- household |>
    pivot_longer(
      cols = !family,
      names_to = c(".value", "child"),
      names_sep = "_",
      values_drop_na = TRUE
    )
  lokal <- rumah_tangga |>
    rpi_panjang(
      kolom = !keluarga,
      nama_ke = c(".value", "anak"),
      pemisah_nama = "_",
      buang_nilai_na = TRUE
    )
  expect_identical(nrow(lokal), 9L)
  # nama kolom hasil mengikuti bagian pertama nama kolom lokal (`lahir`, `nama`)
  expect_identical(names(lokal), c("keluarga", "anak", "lahir", "nama"))
  expect_identical(lokal$keluarga, asli$family)
  expect_identical(lokal$anak, sub("^child", "anak", asli$child))
  expect_identical(lokal$lahir, asli$dob)
  expect_identical(lokal$nama, asli$name)
})

# --- 5.4 memperlebar data ----------------------------------------------------------------
test_that("Bab 5.4: pengalaman_pasien dan pivot_wider", {
  expect_identical(
    names(pengalaman_pasien),
    c("organisasi_id", "organisasi_nama", "ukuran_kode", "ukuran_judul", "tingkat_kinerja")
  )
  sama_sebagian <- function(lokal, asli) {
    expect_identical(unname(as.list(lokal)), unname(as.list(asli)))
  }

  sama_sebagian(
    pengalaman_pasien |> trn_unik(ukuran_kode, ukuran_judul),
    cms_patient_experience |> distinct(measure_cd, measure_title)
  )

  # tanpa id_cols: masih 500 baris
  asli <- cms_patient_experience |>
    pivot_wider(names_from = measure_cd, values_from = prf_rate)
  lokal <- pengalaman_pasien |>
    rpi_lebar(nama_dari = ukuran_kode, nilai_dari = tingkat_kinerja)
  sama_tabel(lokal, asli)
  expect_identical(dim(lokal), c(500L, 9L))

  # dengan id_cols = starts_with("org"): 95 baris, 8 kolom
  asli <- cms_patient_experience |>
    pivot_wider(
      id_cols = starts_with("org"),
      names_from = measure_cd,
      values_from = prf_rate
    )
  lokal <- pengalaman_pasien |>
    rpi_lebar(
      kolom_id = frm_diawali("organisasi"),
      nama_dari = ukuran_kode,
      nilai_dari = tingkat_kinerja
    )
  sama_tabel(lokal, asli)
  expect_identical(dim(lokal), c(95L, 8L))
  expect_identical(names(lokal)[3:8], names(asli)[3:8])
})

# --- 5.4.1 bagaimana pivot_wider bekerja ------------------------------------------------
test_that("Bab 5.4.1: pivot_wider pada data kecil dan langkah-langkahnya", {
  df_asli <- tribble(
    ~id, ~measurement, ~value,
    "A",        "bp1",    100,
    "B",        "bp1",    140,
    "B",        "bp2",    115,
    "A",        "bp2",    120,
    "A",        "bp3",    105
  )
  df <- inp_tribble(
    ~id, ~measurement, ~value,
    "A",        "bp1",    100,
    "B",        "bp1",    140,
    "B",        "bp2",    115,
    "A",        "bp2",    120,
    "A",        "bp3",    105
  )
  expect_identical(df, df_asli)

  sama_tabel(
    df |> rpi_lebar(nama_dari = measurement, nilai_dari = value),
    df_asli |> pivot_wider(names_from = measurement, values_from = value)
  )
  expect_identical(
    df |> trn_unik(measurement) |> trn_tarik(),
    df_asli |> distinct(measurement) |> pull()
  )
  sama_tabel(
    df |> trn_pilih(!measurement & !value) |> trn_unik(),
    df_asli |> select(!measurement & !value) |> distinct()
  )
  sama_tabel(
    df |> trn_pilih(!measurement & !value) |> trn_unik() |> trn_mutasi(x = NA, y = NA, z = NA),
    df_asli |> select(!measurement & !value) |> distinct() |> mutate(x = NA, y = NA, z = NA)
  )
})

test_that("Bab 5.4.1: nilai ganda menghasilkan list-column dan peringatan yang sama", {
  df_asli <- tribble(
    ~id, ~measurement, ~value,
    "A",        "bp1",    100,
    "A",        "bp1",    102,
    "A",        "bp2",    120,
    "B",        "bp1",    140,
    "B",        "bp2",    115
  )
  df <- inp_tribble(
    ~id, ~measurement, ~value,
    "A",        "bp1",    100,
    "A",        "bp1",    102,
    "A",        "bp2",    120,
    "B",        "bp1",    140,
    "B",        "bp2",    115
  )
  # peringatan tetap berbahasa Inggris pada keduanya
  expect_warning(
    asli <- df_asli |> pivot_wider(names_from = measurement, values_from = value),
    "not uniquely identified"
  )
  expect_warning(
    lokal <- df |> rpi_lebar(nama_dari = measurement, nilai_dari = value),
    "not uniquely identified"
  )
  sama_tabel(lokal, asli)
  expect_true(is.list(lokal$bp1))

  # mencari baris ganda
  sama_tabel(
    df |>
      trn_gabung_kelompok(id, measurement) |>
      trn_statistik_ringkas(n = frm_jumlah(), .hasil_kelompok = "drop") |>
      trn_filter(n > 1),
    df_asli |>
      group_by(id, measurement) |>
      summarize(n = n(), .groups = "drop") |>
      filter(n > 1)
  )
  # tanpa peringatan bila nilai ganda diringkas dengan fungsi_nilai
  sama_tabel(
    df |> rpi_lebar(nama_dari = measurement, nilai_dari = value, fungsi_nilai = sum),
    df_asli |> pivot_wider(names_from = measurement, values_from = value, values_fn = sum)
  )
})
