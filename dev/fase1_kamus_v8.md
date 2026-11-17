# tidyversindonesia: Kamus Usulan v8 (DRAFT untuk ditinjau)

Menggantikan `fase1_kamus_v7.md`. Inventaris sumber ada di `fase1_audit_r4ds.md`.
**Semua nama adalah usulan sampai Anda setujui. Tidak ada kode yang sudah dijalankan.**
Diverifikasi dari dokumentasi resmi (lewat web): argumen `labs()`, kolom `mpg`, daftar `theme_*` ggplot2 4.0.x, lisensi dan kolom `flights` (nycflights13), serta kolom dan satuan `mtcars` (paket datasets). Selebihnya masih dari audit buku dan ingatan saya.

## 1. Perubahan dari v7 akibat jawaban Anda

| Hal | v7 | Sekarang |
|---|---|---|
| `geom_boxplot()` | `grf_geometrik_kotak` | `grf_geometrik_boxplot` |
| `mtcars` | `mobil_mtcars` (sudah dirancang) | **ditunda**; tidak dikerjakan di Phase 2 |
| argumen `scales` pada faset | `skala` (alternatif `kebebasan_skala`) | tetap `skala`; awalan `grf_faset_skala_` dicadangkan (tafsiran saya, mohon dikoreksi bila keliru) |

Perubahan v5 ke v6 dan v6 ke v7 (rename `trn_*`, `alfa`, `tipe_garis`, `c()` tanpa pembungkus, dst.) tetap berlaku dan sudah tercermin di seluruh dokumen ini.

### Arsitektur keluarga fungsi

| Alur kerja | Fungsi utama | Pembantu | Dibantu oleh |
|---|---|---|---|
| Impor data | `imp_` | `inp_` | `dsr_`, `dtr_` |
| Merapikan data | `rpi_` | `frm_` (dipakai bersama `trn_`) | `dsr_`, `dtr_` |
| Transformasi data | `trn_` | `frm_` | `dsr_`, `dtr_` |
| Visualisasi | `vis_` | `grf_` | `dsr_`, `dtr_` |

Pola yang saya baca, mohon koreksi bila keliru:
- **`vis_`** membuat, menyimpan, atau mengambil objek plot; **`grf_`** adalah komponen yang ditambahkan ke plot (geometri, faset, skala, tema, label) beserta `grf_estetika()`.
- **`trn_`** adalah kata kerja transformasi; **`frm_`** adalah pendukung yang dipakai di dalamnya (pemilih kolom, pengurut menurun, penghitung, `if_else`).
- **`imp_`** membaca data dari berkas; **`inp_`** berisi pembuat data di R (`inp_tibble`, `inp_tribble`) dan penulis berkas (`inp_tulis_*`).
- **`dsr_`** (dasar R) dan **`dtr_`** (inspeksi data) mendukung semua alur.

### Apakah `rpi_` perlu pembantu untuk argumennya?
Rekomendasi saya: **tidak perlu keluarga baru sekarang.** Alasannya:
1. **Sudah ada pembantu.** Argumen `kolom`, `kolom_id`, `nama_dari`, dan `nilai_dari` menerima pemilihan kolom, dan itu dilayani `frm_` (misalnya `kolom = frm_diawali("wk")`). Itu sebabnya tabel di atas mencantumkan `frm_` untuk `rpi_`.
2. **Argumen lain menerima nilai biasa.** `nama_ke`, `nilai_ke`, `pemisah_nama`, `pola_nama`, `awalan_nama`, dan `buang_nilai_na` menerima teks atau TRUE/FALSE. `fungsi_nilai` dan `transformasi_nama` menerima fungsi biasa. Di delapan bab tidak ada fungsi pembantu khusus tidyr untuk argumen-argumen ini (dari audit).
3. **Nilai khusus `".value"` harus tetap teks.** Aturan master prompt: nilai argumen tidak diterjemahkan. Pembungkus fungsi untuk `".value"` akan melanggarnya.
4. **Kapan ditinjau ulang:** bila lingkup nanti melampaui delapan bab dan memuat fungsi tidyr yang memakai pembantu (dugaan saya `complete()` atau `expand()` dengan `nesting()` dan `crossing()`; belum diverifikasi). Saat itu awalan pembantu `rpi_` bisa ditentukan.

## 2. Hal yang masih perlu keputusan Anda

Tidak ada pertanyaan terbuka tentang nama fungsi. Pertanyaan yang tersisa hanya soal teknis di Phase 2.

Catatan desain (tidak perlu dijawab bila setuju):
- **`trn_gabung_kelompok`.** Awalan `trn_gabung_` kelak mungkin dipakai juga oleh fungsi `*_join()` dplyr (di luar delapan bab). Saat mengetik `trn_gabung_` di RStudio, `group_by()` dan fungsi join akan tampil bersama. Tidak masalah untuk lingkup sekarang; hanya perlu diingat bila lingkup meluas. Pasangannya `trn_lepas_kelompok` (`ungroup()`) tetap.
- **`trn_filter`.** Namanya sama dengan fungsi asli `filter()`; ini disengaja karena "filter" kata Indonesia. Di panduan migrasi, fungsi ini cukup dicatat sebagai "hanya awalan yang dihapus".
- **Q-F.** Ukuran `penerbangan` baru bisa diukur di Phase 2.

## 3. Keluarga fungsi

### vis_ (objek plot)
| Lokal | Asli |
|---|---|
| `vis_ggplot()` | `ggplot()` |
| `vis_ggplot_simpan()` | `ggsave()` |
| `vis_ggplot_terakhir()` | `last_plot()` |

Argumen `ggplot()`: `data` → `data`, `mapping` → `pemetaan`. Argumen `ggsave()`: `filename` → `nama_berkas`, `plot` → `plot`, `width` → `lebar`, `height` → `tinggi`.

### grf_ (komponen grafik)
**Estetika dan label**

| Lokal | Asli |
|---|---|
| `grf_estetika()` | `aes()` |
| `grf_label()` | `labs()` (lihat §4) |

**Geometri.** Semua `geom_*` memakai pola `grf_geometrik_<nama>()`. Yang dipakai buku:

| Lokal | Asli |
|---|---|
| `grf_geometrik_titik()` | `geom_point()` |
| `grf_geometrik_garis()` | `geom_line()` |
| `grf_geometrik_batang()` | `geom_bar()` |
| `grf_geometrik_histogram()` | `geom_histogram()` |
| `grf_geometrik_densitas()` | `geom_density()` |
| `grf_geometrik_boxplot()` | `geom_boxplot()` |
| `grf_geometrik_haluskan()` | `geom_smooth()` |
| `grf_geometrik_heksagon()` | `geom_hex()` (butuh paket hexbin; belum diverifikasi) |

Geometri lain (`geom_tile`, `geom_area`, `geom_jitter`, dst.) menunggu keputusan apakah seluruh `geom_*` dimasukkan atau hanya yang dipakai buku. Rekomendasi saya: hanya yang dipakai buku dulu.

**Faset**

| Lokal | Asli |
|---|---|
| `grf_faset_bungkus()` | `facet_wrap()` |
| `grf_faset_jendela()` | `facet_grid()` |

Argumen `scales` pada kedua fungsi faset tetap `skala`. Awalan `grf_faset_skala_` dicadangkan untuk fungsi terkait skala faset di masa depan (tidak ada di delapan bab).

**Skala**

| Lokal | Asli |
|---|---|
| `grf_skala_x_kontinu()` | `scale_x_continuous()` |
| `grf_skala_y_balik()` | `scale_y_reverse()` |
| `grf_skalawarna_butawarna()` | `ggthemes::scale_color_colorblind()` |
| `grf_skalaisian_butawarna()` (usulan) | `ggthemes::scale_fill_colorblind()` |

Pola yang saya baca: `grf_skala_x_*` / `grf_skala_y_*` untuk sumbu, `grf_skalawarna_*` untuk skala warna, `grf_skalaisian_*` untuk skala isian. `ggthemes` masuk **Suggests**; fungsi memberi pesan jelas bila paket belum terpasang.

**Tema.** Daftar `theme_*` diverifikasi dari dokumentasi ggplot2 4.0.x (10 fungsi). Usulan nama:

| Lokal | Asli |
|---|---|
| `grf_tema_abu()` | `theme_grey()` dan `theme_gray()` (alias, satu pembungkus) |
| `grf_tema_hitamputih()` | `theme_bw()` |
| `grf_tema_gambar_garis()` | `theme_linedraw()` |
| `grf_tema_terang()` | `theme_light()` |
| `grf_tema_gelap()` | `theme_dark()` |
| `grf_tema_minimal()` | `theme_minimal()` |
| `grf_tema_klasik()` | `theme_classic()` (nama dari Anda) |
| `grf_tema_kosong()` | `theme_void()` |
| `grf_tema_uji()` | `theme_test()` |

Argumen tema (ggplot2 4.0): `base_size` → `ukuran_dasar`, `base_family` → `keluarga_font_dasar`, `header_family` → `keluarga_font_judul`, `base_line_size` → `ketebalan_garis_dasar`, `base_rect_size` → `ukuran_persegi_dasar`, `ink` → `tinta`, `paper` → `kertas`, `accent` → `aksen`. Fungsi `theme()` sendiri (menyetel elemen satu per satu) tidak dipakai di delapan bab; belum dimasukkan.

**Argumen estetika dan umum** (usulan; daftar lengkap menunggu pengecekan dokumentasi tiap fungsi):

| Asli | Lokal |
|---|---|
| `colour` / `color` | `warna` |
| `fill` | `isian` |
| `shape` | `bentuk` |
| `size` | `ukuran` |
| `alpha` | `alfa` |
| `linetype` | `tipe_garis` |
| `linewidth` | `ketebalan_garis` |
| `group` | `kelompok` |
| `position` | `posisi` |
| `method` | `metode` |
| `se` | `selang_kepercayaan` |
| `span` | `rentang` |
| `binwidth` / `bins` | `lebar_bin` / `jumlah_bin` |
| `na.rm` | `buang_na` |
| `breaks` | `posisi_tanda` |
| `facets` / `rows` / `cols` | `faset` / `baris` / `kolom` |

Nilai tetap: `"lm"`, `"loess"`, `"fill"`, `"red"`, `"grey50"`, `21`, `0.5`.

### imp_ (impor)
| Lokal | Asli |
|---|---|
| `imp_baca_csv()` | `read_csv()` |
| `imp_baca_csv2()` | `read_csv2()` |
| `imp_baca_tsv()` | `read_tsv()` |
| `imp_baca_delim()` | `read_delim()` |
| `imp_baca_lebar_tetap()` | `read_fwf()` |
| `imp_baca_tabel()` | `read_table()` |
| `imp_baca_log()` | `read_log()` |
| `imp_baca_rds()` | `read_rds()` |
| `imp_baca_parquet()` (usulan) | `arrow::read_parquet()` |
| `imp_lebar_kolom()` / `imp_posisi_kolom()` | `fwf_widths()` / `fwf_positions()` |
| `imp_masalah()` / `imp_spesifikasi()` | `problems()` / `spec()` |
| `imp_kolom()` / `imp_kolom_saja()` | `cols()` / `cols_only()` |
| `imp_kolom_logika()`, `_desimal()`, `_bulat()`, `_teks()`, `_faktor()`, `_tanggal()`, `_waktu()`, `_angka()`, `_lewati()` | `col_logical()`, `col_double()`, `col_integer()`, `col_character()`, `col_factor()`, `col_date()`, `col_datetime()`, `col_number()`, `col_skip()` |
| `imp_urai_angka()` | `parse_number()` |

Argumen `read_csv()`: `file` → `berkas`, `na` → `na`, `skip` → `lewati`, `comment` → `komentar`, `col_names` → `nama_kolom`, `col_types` → `tipe_kolom`, `id` → `id`, `guess_max` → `maks_tebakan`, `show_col_types` → `tampilkan_tipe_kolom`, `quote` → `kutip`, `.default` → `.bawaan`. Nilai tetap: `"N/A"`, `"#"`, `"."`, `FALSE`, `I(...)`.

### inp_ (memasukkan data)
| Lokal | Asli |
|---|---|
| `inp_tibble()` | `tibble()` |
| `inp_tribble()` | `tribble()` |
| `inp_tulis_csv()` | `write_csv()` |
| `inp_tulis_tsv()` | `write_tsv()` |
| `inp_tulis_rds()` | `write_rds()` |
| `inp_tulis_parquet()` | `arrow::write_parquet()` |

Argumen `write_csv()`: `x` → `x`, `file` → `berkas`, `na` → `na`, `append` → `tambahkan`. `arrow` masuk **Suggests**.

### rpi_ (rapi)
Tanpa keluarga pembantu untuk saat ini (lihat bagian 1).

`rpi_panjang()` → `pivot_longer()`, `rpi_lebar()` → `pivot_wider()`.
Argumen: `cols` → `kolom`, `names_to` → `nama_ke`, `values_to` → `nilai_ke`, `values_drop_na` → `buang_nilai_na`, `names_sep` → `pemisah_nama`, `names_pattern` → `pola_nama`, `names_prefix` → `awalan_nama`, `names_transform` → `transformasi_nama`, `names_from` → `nama_dari`, `values_from` → `nilai_dari`, `id_cols` → `kolom_id`, `values_fn` → `fungsi_nilai`. Nilai tetap: `".value"`.

### trn_ (transformasi)
| Lokal | Asli |
|---|---|
| `trn_filter()` | `filter()` |
| `trn_urutkan()` | `arrange()` |
| `trn_unik()` | `distinct()` |
| `trn_hitung()` | `count()` |
| `trn_mutasi()` | `mutate()` |
| `trn_pilih()` | `select()` |
| `trn_ubah_nama()` | `rename()` |
| `trn_pindah()` | `relocate()` |
| `trn_tarik()` | `pull()` |
| `trn_gabung_kelompok()` | `group_by()` |
| `trn_lepas_kelompok()` | `ungroup()` |
| `trn_statistik_ringkas()` | `summarize()` / `summarise()` |
| `trn_iris_kepala()` / `trn_iris_ekor()` | `slice_head()` / `slice_tail()` |
| `trn_iris_min()` / `trn_iris_maks()` | `slice_min()` / `slice_max()` |
| `trn_iris_acak()` | `slice_sample()` |
| `trn_rapikan_nama()` | `janitor::clean_names()` |

Argumen: `.before` → `.sebelum`, `.after` → `.setelah`, `.keep` → `.simpan`, `.keep_all` → `.simpan_semua`, `.groups` → `.hasil_kelompok`, `.by` → `.berdasarkan`, `sort` → `urut`, `prop` → `proporsi`, `with_ties` → `dengan_seri`. Hanya argumen formal yang diterjemahkan; nama kolom baru lewat `...` tidak disentuh. `janitor` masuk **Suggests**.

### frm_ (pendukung transformasi; dari "transFORMasi")
`frm_diawali()` ← `starts_with()`, `frm_diakhiri()` ← `ends_with()`, `frm_memuat()` ← `contains()`, `frm_cocok()` ← `matches()`, `frm_rentang_angka()` ← `num_range()`, `frm_semua()` ← `everything()`, `frm_di_mana()` ← `where()`, `frm_salah_satu()` ← `any_of()`, `frm_turun()` ← `desc()`, `frm_jumlah()` ← `n()`, `frm_jika_lain()` ← `if_else()`.
Argumen: `match` → `cocok`, `ignore.case` → `abaikan_kapital`, `vars` → `variabel`; `test` → `uji`, `yes` → `ya`, `no` → `tidak`.

### dsr_ dan dtr_
`dsr_rerata()` ← `mean()` (`na.rm` → `buang_na`), `dsr_jumlah()` ← `sum()`, `dsr_adalah_na()` ← `is.na()`, `dsr_urutan()` ← `seq()`, `dsr_daftar_berkas()` ← `list.files()`, `dsr_faktor()` ← `factor()`, `dsr_panjang()` ← `length()`, `dsr_dir_kerja()` / `dsr_set_dir_kerja()` ← `getwd()` / `setwd()`.
`dtr_sekilas()` ← `glimpse()`, `dtr_kepala()` / `dtr_ekor()` ← `head()` / `tail()`, `dtr_lihat()` ← `View()`.

Tetap tanpa pembungkus: `<-`, `|>`, `%>%`, `%in%`, `%/%`, `%%`, operator aritmetika dan logika, `c()`, `pi`, `library()`, `I()`, `~`.

Fungsi paket lain yang masih kelas C (hanya didokumentasikan): `reprex::reprex()`, `styler`, `usethis::use_blank_slate()`, `tidyverse_update()`. Mau dibungkus juga?

## 4. `grf_label()` (tervalidasi terhadap ggplot2 4.0.x)

Argumen formal `labs()`: `title`, `subtitle`, `caption`, `tag`, `alt`, `alt_insight`, `dictionary`, ditambah label estetika lewat `...`.

| Asli | Lokal |
|---|---|
| `title` | `judul` |
| `subtitle` | `subjudul` |
| `caption` | `keterangan` |
| `tag` | `tag` |
| `alt` | `teks_alternatif` |
| `alt_insight` | `wawasan_alternatif` |
| `dictionary` | `kamus` |
| `x` / `y` | `sumbu_x` / `sumbu_y` |
| `colour`, `color` | `warna` |
| `fill` | `isian` |
| `shape` | `bentuk` |
| `size` | `ukuran` |
| `alpha` | `alfa` |
| `linetype` | `tipe_garis` |
| `linewidth` | `ketebalan_garis` |

`label()` pada v3 dihapus. `ggplot2::labs()` asli tetap bisa dipakai bersama fungsi lokal.

Contoh API (ilustrasi, belum dijalankan):

```r
mobil_mpg |>
  vis_ggplot(grf_estetika(x = kapasitas_mesin, y = mpg_jalan_raya)) +
  grf_geometrik_titik(bentuk = 21, isian = "blue", warna = "black", ukuran = 3) +
  grf_tema_klasik() +
  grf_label(
    judul = "Kapasitas mesin dan efisiensi bahan bakar",
    sumbu_x = "Kapasitas mesin (liter)",
    sumbu_y = "Efisiensi jalan raya (MPG)"
  )
```

## 5. Dataset

Lisensi yang sudah diperiksa: `nycflights13` (CC0), `palmerpenguins` (CC0), `ggplot2` 4.0.3 (MIT + file LICENSE), `tidyr` 1.3.2 (MIT + file LICENSE). Belum diverifikasi: status hukum data asal EPA, CMS dan `diamonds`. Lisensi paket `datasets` tidak lagi menghalangi karena `mobil_mtcars` ditunda. Rincian di `fase1_argumen_v2.md`, bagian 6.

### `mobil_mpg` (dari `ggplot2::mpg`)
| Asli | Lokal | Satuan / catatan |
|---|---|---|
| `manufacturer` | `produsen` | nilai tidak diubah |
| `model` | `model` | nilai tidak diubah |
| `displ` | `kapasitas_mesin` | liter |
| `year` | `tahun` | |
| `cyl` | `silinder` | |
| `trans` | `transmisi` | awalan `auto` menjadi `otomatis`; `manual` tetap; kode di dalam kurung tetap |
| `drv` | `penggerak` | `f` → `depan`, `r` → `belakang`, `4` → `4_roda` |
| `cty` | `mpg_jalan_kota` | mil per galon, tidak dikonversi |
| `hwy` | `mpg_jalan_raya` | mil per galon, tidak dikonversi |
| `fl` | `bahan_bakar` | `p` → `bensin_premium`, `r` → `bensin_reguler`, `e` → `etanol`, `d` → `diesel`, `c` → `CNG` |
| `class` | `kelas` | `2seater` → `2_penumpang`, `compact` → `kompak`, `midsize` → `ukuran_menengah`, `minivan` → `minivan`, `pickup` → `pikap`, `subcompact` → `subkompak`, `suv` → `suv` |

Nilai `transmisi` yang diperkirakan ada (dari ingatan saya, **belum diverifikasi**): `auto(av)`, `auto(l3)`, `auto(l4)`, `auto(l5)`, `auto(l6)`, `auto(s4)`, `auto(s5)`, `auto(s6)`, `manual(m5)`, `manual(m6)`. Aturannya satu: ganti awalan `auto` dengan `otomatis`. Verifikasi di mesin Anda: `unique(ggplot2::mpg$trans)`, `unique(ggplot2::mpg$fl)`, `unique(ggplot2::mpg$class)`.
Dampak pada contoh buku: `filter(drv == "f")` menjadi `trn_filter(penggerak == "depan")`. Ini masuk kelas "didukung setelah lokalisasi sistematis".

Dokumentasi roxygen (usulan; sudah memuat terjemahan `transmisi` dan `@seealso` yang dikoreksi):

```r
#' Efisiensi bahan bakar mobil populer 1999-2008
#'
#' Data efisiensi bahan bakar 38 model mobil populer tahun 1999-2008.
#' Ini adalah versi Bahasa Indonesia dari dataset `mpg` pada paket
#' ggplot2. Nilai numerik tidak diubah; satuan tetap mil per galon (MPG).
#'
#' @format Sebuah tibble dengan 234 baris dan 11 kolom:
#' \describe{
#'   \item{produsen}{Produsen mobil. Asli: `manufacturer`.}
#'   \item{model}{Nama model mobil. Asli: `model`.}
#'   \item{kapasitas_mesin}{Kapasitas mesin dalam liter. Asli: `displ`.}
#'   \item{tahun}{Tahun produksi. Asli: `year`.}
#'   \item{silinder}{Jumlah silinder. Asli: `cyl`.}
#'   \item{transmisi}{Jenis transmisi, `otomatis(...)` atau `manual(...)`.
#'   Asli: `trans` (`auto(...)`, `manual(...)`).}
#'   \item{penggerak}{`depan`, `belakang`, atau `4_roda`. Asli: `drv`
#'   (`f`, `r`, `4`).}
#'   \item{mpg_jalan_kota}{MPG di jalan kota. Asli: `cty`.}
#'   \item{mpg_jalan_raya}{MPG di jalan raya. Asli: `hwy`.}
#'   \item{bahan_bakar}{`bensin_premium`, `bensin_reguler`, `etanol`,
#'   `diesel`, atau `CNG`. Asli: `fl` (`p`, `r`, `e`, `d`, `c`).}
#'   \item{kelas}{`2_penumpang`, `kompak`, `ukuran_menengah`, `minivan`,
#'   `pikap`, `subkompak`, atau `suv`. Asli: `class`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom serta nilai `transmisi`, `penggerak`, `bahan_bakar`, dan
#' `kelas` diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan
#' nilai hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `ggplot2::mpg`.
#'
#' @source Data asli dari EPA Fuel Economy Data,
#' \url{https://fueleconomy.gov/}, melalui `ggplot2::mpg`.
#'
#' @seealso [ggplot2::mpg]
"mobil_mpg"
```
Catatan: format `` `kode` `` di roxygen memerlukan `Roxygen: list(markdown = TRUE)` di DESCRIPTION. Kata "tibble" dan "38 model" mengikuti dokumen Anda; "tibble" perlu dicek dengan `class(ggplot2::mpg)`.

### `mobil_mtcars` (dari `datasets::mtcars`): DITUNDA
Ditunda atas keputusan Anda dan tidak diimplementasikan di Phase 2. Di delapan bab, `mtcars` hanya muncul di catatan samping Bab 3 tentang `%>%`. Rancangan di bawah (yang sudah dicocokkan dengan dokumentasi resmi) disimpan untuk nanti.

Diverifikasi dari dokumentasi resmi `datasets`: 32 baris, 11 variabel numerik, data dari majalah Motor Trend US 1974 (model 1973-74), sumber Henderson dan Velleman (1981). `datasets` adalah bagian dari R; lisensinya belum saya verifikasi (lihat `fase1_argumen_v1.md`, bagian 6).

| Asli | Lokal (usulan) | Dokumentasi asli dan catatan |
|---|---|---|
| (nama baris) | `mobil` | kolom baru di posisi pertama |
| `mpg` | `efisiensi_mpg` | mil per galon AS (*Miles/(US) gallon*) |
| `cyl` | `silinder` | jumlah silinder |
| `disp` | `kapasitas_mesin_in3` | inci kubik (*cu.in.*) |
| `hp` | `tenaga_kuda` | *gross horsepower* |
| `drat` | `rasio_gardan` | rasio gardan belakang (*rear axle ratio*) |
| `wt` | `berat_ribu_lb` | ribuan pon (*1000 lbs*) |
| `qsec` | `waktu_seperempat_mil` | dokumentasi hanya menulis "1/4 mile time"; satuan detik belum saya verifikasi |
| `vs` | `bentuk_mesin` | 0 = V, 1 = lurus; angka tidak diubah |
| `am` | `kode_transmisi` | 0 = otomatis, 1 = manual; angka tidak diubah |
| `gear` | `jumlah_gigi` | jumlah gigi maju |
| `carb` | `jumlah_karburator` | jumlah karburator |

Alasan tiga keputusan nama (disetujui):
1. **`efisiensi_mpg`, bukan `konsumsi`.** `mpg` mengukur mil per galon: makin besar makin hemat. Kata "konsumsi" biasanya berarti sebaliknya (liter per 100 km, makin besar makin boros), sehingga pelajar bisa membaca grafik secara terbalik. Contoh di master prompt memakai `konsumsi`; saya sarankan diganti.
2. **Akhiran satuan.** Di `mobil_mpg`, `kapasitas_mesin` berarti liter, sedangkan di `mtcars` `disp` berarti inci kubik. Nama yang sama dengan satuan berbeda berbahaya bila pelajar menggabungkan kedua dataset. Akhiran `_in3` dan `_ribu_lb` mengikuti pola `penguin` (`_mm`, `_g`).
3. **`kode_transmisi`.** Di `mobil_mpg`, `transmisi` berisi teks (`otomatis(l5)`), sedangkan di `mtcars` berisi 0/1. Nama berbeda mencegah tertukar.

Nilai numerik tidak diubah dan tidak ada konversi satuan. Bentuk objek (tibble atau data frame setelah nama baris menjadi kolom) diputuskan di Phase 2 dan akan didokumentasikan.

Dokumentasi roxygen (usulan):

```r
#' Uji jalan mobil dari majalah Motor Trend
#'
#' Data diekstrak dari majalah Motor Trend US tahun 1974. Memuat efisiensi
#' bahan bakar dan 10 aspek desain dan kinerja 32 mobil (model 1973-74).
#' Ini adalah versi Bahasa Indonesia dari dataset `mtcars` pada paket
#' datasets. Nilai numerik tidak diubah.
#'
#' @format Sebuah tibble dengan 32 baris dan 12 kolom:
#' \describe{
#'   \item{mobil}{Nama mobil. Asli: nama baris `mtcars`.}
#'   \item{efisiensi_mpg}{Mil per galon AS. Asli: `mpg`.}
#'   \item{silinder}{Jumlah silinder. Asli: `cyl`.}
#'   \item{kapasitas_mesin_in3}{Kapasitas mesin, inci kubik. Asli: `disp`.}
#'   \item{tenaga_kuda}{Tenaga kuda kotor. Asli: `hp`.}
#'   \item{rasio_gardan}{Rasio gardan belakang. Asli: `drat`.}
#'   \item{berat_ribu_lb}{Berat dalam ribuan pon. Asli: `wt`.}
#'   \item{waktu_seperempat_mil}{Waktu menempuh 1/4 mil. Asli: `qsec`.}
#'   \item{bentuk_mesin}{0 = V, 1 = lurus. Asli: `vs`.}
#'   \item{kode_transmisi}{0 = otomatis, 1 = manual. Asli: `am`.}
#'   \item{jumlah_gigi}{Jumlah gigi maju. Asli: `gear`.}
#'   \item{jumlah_karburator}{Jumlah karburator. Asli: `carb`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama baris dipindahkan menjadi kolom `mobil` dan nama kolom
#' diterjemahkan. Nilai, satuan, urutan baris, dan nilai hilang tidak
#' diubah. Dataset asli tetap tersedia sebagai `datasets::mtcars`.
#'
#' @section Catatan dari sumber asli:
#' Dokumentasi asli mencatat bahwa mesin rotari Mazda dikodekan sebagai
#' enam silinder lurus, mesin datar Porsche sebagai V, dan Mercedes 240D
#' (diesel) tetap disertakan agar sebanding dengan analisis terdahulu.
#'
#' @source Henderson dan Velleman (1981), Building multiple regression
#' models interactively. Biometrics, 37, 391-411, melalui `datasets::mtcars`.
#'
#' @seealso [datasets::mtcars]
"mobil_mtcars"
```

### `penerbangan` (dari `nycflights13::flights`)
Dokumen Anda dicocokkan dengan dokumentasi resmi `flights`: 336.776 baris, 19 kolom, definisi kolom cocok, lisensi CC0. Hasil cetak dari berbagai sumber menunjukkan objek ini berupa **tibble**, jadi saya tulis "tibble" meski dokumentasi aslinya menyebut data frame. Pemetaan kolom final (mengikuti dokumen Anda):

| Asli | Lokal | Satuan / catatan |
|---|---|---|
| `year`, `month`, `day` | `tahun`, `bulan`, `hari` | tanggal keberangkatan |
| `dep_time`, `arr_time` | `waktu_berangkat`, `waktu_tiba` | HHMM atau HMM, zona waktu lokal, tidak diubah |
| `sched_dep_time`, `sched_arr_time` | `waktu_jadwal_berangkat`, `waktu_jadwal_tiba` | HHMM atau HMM |
| `dep_delay`, `arr_delay` | `keterlambatan_berangkat`, `keterlambatan_tiba` | menit; negatif = lebih awal |
| `carrier` | `maskapai` | kode dua huruf |
| `flight` | `nomor_penerbangan` | |
| `tailnum` | `nomor_ekor` | |
| `origin`, `dest` | `asal`, `tujuan` | kode bandara |
| `air_time` | `waktu_terbang` | menit |
| `distance` | `jarak` | mil, tidak dikonversi |
| `hour`, `minute` | `jam`, `menit` | jadwal keberangkatan |
| `time_hour` | `waktu_jam` | `POSIXct` |

Dampak pada contoh buku: `sched_dep_time` menjadi `waktu_jadwal_berangkat`, `air_time` menjadi `waktu_terbang`. Dalam bahasa Inggris `flight` dan `flights` mudah tertukar; di sini kolomnya `nomor_penerbangan` dan datasetnya `penerbangan`, jadi tidak bentrok.

Dua koreksi kecil pada dokumen Anda: (1) `@seealso [nycflights13::flights()]` memakai tanda kurung, padahal `flights` adalah data, bukan fungsi; sebaiknya `[nycflights13::flights]`; (2) tiap `\item` sebaiknya diberi "Asli: ..." seperti pada `mobil_mpg` agar pemetaan kolom terdokumentasi (syarat master prompt bagian 9). Saya juga menambahkan bagian "Perbedaan dengan dataset asli".

```r
#' Penerbangan dari Kota New York, 2013
#'
#' Data ketepatan waktu penerbangan dari Kota New York pada tahun 2013.
#' Ini adalah versi Bahasa Indonesia dari dataset `flights` pada paket
#' nycflights13. Nilai numerik tidak diubah.
#'
#' @format Sebuah tibble dengan 336.776 baris dan 19 kolom:
#' \describe{
#'   \item{tahun, bulan, hari}{Tanggal keberangkatan. Asli: `year`,
#'   `month`, `day`.}
#'   \item{waktu_berangkat, waktu_tiba}{Waktu aktual dalam format HHMM atau
#'   HMM, zona waktu lokal. Asli: `dep_time`, `arr_time`.}
#'   \item{waktu_jadwal_berangkat, waktu_jadwal_tiba}{Waktu terjadwal dalam
#'   format HHMM atau HMM, zona waktu lokal. Asli: `sched_dep_time`,
#'   `sched_arr_time`.}
#'   \item{keterlambatan_berangkat, keterlambatan_tiba}{Keterlambatan dalam
#'   menit; nilai negatif berarti lebih awal. Asli: `dep_delay`,
#'   `arr_delay`.}
#'   \item{maskapai}{Singkatan dua huruf maskapai. Lihat
#'   `nycflights13::airlines`. Asli: `carrier`.}
#'   \item{nomor_penerbangan}{Nomor penerbangan. Asli: `flight`.}
#'   \item{nomor_ekor}{Nomor ekor pesawat. Lihat `nycflights13::planes`.
#'   Asli: `tailnum`.}
#'   \item{asal, tujuan}{Bandara asal dan tujuan. Lihat
#'   `nycflights13::airports`. Asli: `origin`, `dest`.}
#'   \item{waktu_terbang}{Waktu di udara, dalam menit. Asli: `air_time`.}
#'   \item{jarak}{Jarak antarbandara, dalam mil. Asli: `distance`.}
#'   \item{jam, menit}{Waktu keberangkatan terjadwal, dipecah menjadi jam dan
#'   menit. Asli: `hour`, `minute`.}
#'   \item{waktu_jam}{Tanggal dan jam penerbangan terjadwal sebagai
#'   `POSIXct`. Bersama `asal`, dapat dipakai untuk menggabungkan dengan
#'   data cuaca. Asli: `time_hour`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Hanya nama kolom yang diterjemahkan. Nilai, satuan (menit, mil, HHMM),
#' urutan baris, dan nilai hilang tidak diubah. Dataset asli tetap tersedia
#' sebagai `nycflights13::flights`.
#'
#' @source Data asli dari RITA, Bureau of Transportation Statistics,
#' \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236},
#' melalui paket nycflights13 (lisensi CC0).
#'
#' @seealso [nycflights13::flights]
"penerbangan"
```

**Rencana ukuran (Phase 2, belum dikerjakan):** dataset dibuat dari skrip `data-raw/penerbangan.R` yang membaca `nycflights13::flights`, mengganti nama kolom, lalu menyimpannya dengan `usethis::use_data(..., compress = "xz")`. Ukuran hasilnya diperiksa dengan `tools::checkRdaFiles()`. Metadata nycflights13 menunjukkan paket itu memakai kompresi bzip2 untuk datanya, tetapi ukuran total paketnya tidak saya temukan, jadi **belum ada angka**. Bila melebihi batas yang aman untuk CRAN, cadangannya: membuat `penerbangan` dari nycflights13 saat dipanggil. Skrip pembuatannya juga berfungsi sebagai bukti bahwa nilai tidak berubah (diuji dengan perbandingan terhadap data asli).

### `penguin` (dari `palmerpenguins::penguins`)
`species` → `spesies`, `island` → `pulau`, `bill_length_mm` → `panjang_paruh_mm`, `bill_depth_mm` → `kedalaman_paruh_mm`, `flipper_length_mm` → `panjang_sirip_mm`, `body_mass_g` → `massa_tubuh_g`, `sex` → `jenis_kelamin`, `year` → `tahun`.
Nilai: `male` → `jantan`, `female` → `betina` (keputusan Anda). Nilai `spesies` dan `pulau` tetap (nama diri); konfirmasi bila ingin diterjemahkan. `NA` tetap `NA`. Lisensi: CC0 (diverifikasi).

### Dataset lain
`diamonds` → `berlian`, `table1`/`table2`/`table3` → `tabel1`/`tabel2`/`tabel3`, `billboard` → `tangga_lagu`, `who2` → `tb_who`, `household` → `rumah_tangga`, `cms_patient_experience` → `pengalaman_pasien`. Pemetaan kolom menunggu pengecekan dokumentasi tiap dataset.

### Ditunda
- `Lahman::Batting` (studi kasus Bab 3): ditunda atas keputusan Anda. Contoh itu diklasifikasikan "di luar lingkup sementara" dan dicatat di laporan cakupan. Fungsi yang dipakainya (`group_by`, `summarize`, `slice_*`) tetap tercakup oleh keluarga `trn_`.
- `mtcars` (`mobil_mtcars`): ditunda atas keputusan Anda. Contoh catatan samping Bab 3 diklasifikasikan "di luar lingkup sementara" di laporan cakupan.

## 6. Langkah berikut
1. Phase 1 saya anggap selesai bila tidak ada keberatan pada aturan perilaku argumen (R1 sampai R9) dan usulan argumen tambahan di `fase1_argumen_v2.md`.
2. Phase 2: kerangka paket, subset representatif tiap keluarga fungsi, uji drift, dan pengukuran ukuran `penerbangan`.
