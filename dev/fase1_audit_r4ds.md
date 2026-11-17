# Audit R4DS 2e, Part I (Whole Game): Inventaris untuk tidyversindonesia

**Sumber:** delapan bab dibaca langsung dari https://r4ds.hadley.nz pada 23 Oktober 2026.
**Yang sudah diverifikasi:** fungsi dan argumen *yang muncul di teks dan contoh kode bab*, serta argumen `labs()` (dari dokumentasi ggplot2 4.0.x).
**Yang BELUM diverifikasi:** daftar lengkap `formals()` tiap fungsi (butuh R), lisensi dataset, dan perilaku kode apa pun. Tidak ada kode yang dijalankan.

Kelas: **A** = dibungkus (berlokalisasi), **B** = sintaks dasar R, tidak diubah, **C** = paket/alat lain, didokumentasikan saja (atau dibungkus bila disetujui).

## 1. Versi paket yang dipakai buku (dari keluaran bab)

tidyverse 2.0.0, dplyr 1.2.1, readr 2.2.0, ggplot2 4.0.3, tibble 3.3.1, tidyr 1.3.2, forcats 1.0.1, purrr 1.2.2, stringr 1.6.0, lubridate 1.9.5.
Paket tambahan: palmerpenguins, ggthemes (Bab 1); nycflights13 (Bab 3, 4, 6); Lahman (Bab 3); janitor, arrow (Bab 7); reprex (Bab 8); styler (Bab 4); usethis (Bab 6).

## 2. Inventaris per bab

### Bab 1. Data visualization
| Fungsi | Argumen yang muncul | Kelas |
|---|---|---|
| `ggplot()` | `data`, `mapping` | A |
| `aes()` | `x`, `y`, `color`, `shape`, `fill`, `size`, `linewidth` (latihan) | A |
| `geom_point()` | `mapping`, `na.rm` (latihan) | A |
| `geom_smooth()` | `method`, `se` | A |
| `geom_bar()` | `position`, `color`, `fill` | A |
| `geom_histogram()` | `binwidth`, `bins` (latihan) | A |
| `geom_density()` | `linewidth`, `alpha` | A |
| `geom_boxplot()` | (tanpa argumen) | A |
| `facet_wrap()` | formula `~island` | A |
| `labs()` | `title`, `subtitle`, `caption` (latihan), `x`, `y`, `color`, `shape` | A |
| `ggsave()` | `filename`, `plot`, `width`, `height` (disebut) | A |
| `fct_infreq()` | satu argumen (faktor) | A (lihat catatan 4.1) |
| `scale_color_colorblind()` | tanpa argumen | C (paket ggthemes) |
| `glimpse()`, `View()`, `?penguins` | | A / C |
| `library()`, `install.packages()`, `\|>`, `~` | | B |

Dataset: `penguins` (palmerpenguins), `mpg`, `diamonds` (ggplot2).
Nilai argumen yang harus tetap: `"lm"`, `"fill"`, `"red"`, `0.5`, `0.75`, `200`, `"penguin-plot.png"`.

### Bab 2. Workflow: basics
`<-`, operator aritmetika, `^`, `sin()`, `pi`, `c()`, `seq(from, to)`, komentar `#`. Latihan memuat kode yang sengaja salah ketik (`libary`, `dTA =`, `maping =`).
Kelas: operator dan `<-`, `c()`, `pi`: B. `sin()`, `seq()`: A (ragu, lihat pertanyaan di dokumen kamus).

### Bab 3. Data transformation
| Fungsi | Argumen yang muncul | Kelas |
|---|---|---|
| `filter()` | kondisi; `&`, `,`, `\|`, `%in%`, `!` | A |
| `arrange()`, `desc()` | kolom | A |
| `distinct()` | `.keep_all` | A |
| `count()` | `sort` | A |
| `mutate()` | `.before`, `.after`, `.keep` (`"used"`) | A |
| `select()` | `:`, `!`, `where()`, `starts_with()`, `ends_with()`, `contains()`, `num_range()`, `matches()`, `any_of()` (latihan), `ignore.case` (latihan, implisit) | A |
| `rename()`, `relocate()` | `.before`, `.after` | A |
| `group_by()`, `ungroup()` | | A |
| `summarize()` / `summarise()` | `.groups` (`"drop_last"`, `"drop"`, `"keep"`), `.by` | A |
| `n()` | | A |
| `slice_head/tail/min/max/sample()` | `n`, `prop`, `with_ties` | A |
| `mean()` | `na.rm` | A (dsr_) |
| `sum()`, `is.na()`, `%in%`, `==`, `!=`, `<`, `>`, `&`, `\|` | | `sum`, `is.na`: A; operator: B |
| `tibble()`, `c()` | | A / B |
| `print(x, width = Inf)`, `glimpse()`, `View()` | | A |
| `%>%` (magrittr) | catatan sampingan | B (dipertahankan apa adanya) |

Dataset: `flights` (nycflights13), `mtcars` (hanya di catatan `%>%`), `Lahman::Batting` (studi kasus), `df` kecil buatan sendiri di latihan.
Kasus khusus: `geom_point(alpha = 1/10)`, `geom_smooth(se = FALSE)`.

### Bab 4. Workflow: code style
`styler` (C), `%/%`, `%%` (B), `is.na()`, `count()`, `geom_smooth(method = "loess", span = 0.5, se = FALSE, color = "white", linewidth = 4)`, `geom_line()`, `geom_point()`. Latihan restyle memakai `sched_dep_time > 0900`, `%in%`, `sum(is.na(arr_delay))`.

### Bab 5. Data tidying
| Fungsi | Argumen | Kelas |
|---|---|---|
| `pivot_longer()` | `cols`, `names_to`, `values_to`, `values_drop_na`, `names_sep`; nilai khusus `".value"`; `names_pattern` (disebut) | A |
| `pivot_wider()` | `names_from`, `values_from`, `id_cols`; `values_fn` (muncul di pesan peringatan) | A |
| `parse_number()` (readr) | | A |
| `tribble()` | | A |
| `pull()`, `distinct()`, `group_by()`, `summarize(.groups = "drop")` | | A |
| `geom_line()` | `alpha`, `aes(group = )`, `color = "grey50"` | A |
| `scale_x_continuous()` | `breaks` | A |
| `scale_y_reverse()` | | A |

Dataset: `table1`, `table2`, `table3`, `billboard`, `who2`, `household`, `cms_patient_experience` (semuanya dari tidyr).
Catatan: pesan peringatan `pivot_wider()` berbahasa Inggris.

### Bab 6. Workflow: scripts and projects
`getwd()`, `setwd()` (B/A), `usethis::use_blank_slate()` (C), `ggplot(diamonds, aes(carat, price)) + geom_hex()`, `ggsave("diamonds.png")`, `write_csv(diamonds, "data/diamonds.csv")`, `filter(!is.na(...))`, `summarize(mean = mean(...))`.
Catatan: `geom_hex()` memerlukan paket **hexbin** (pengetahuan saya, belum diverifikasi). Kebiasaan yang diajarkan: tanpa `install.packages()` di skrip, jalur relatif.

### Bab 7. Data import
| Fungsi | Argumen | Kelas |
|---|---|---|
| `read_csv()` | `file`, `na`, `skip`, `comment`, `col_names`, `col_types`, `id`, `guess_max`, `show_col_types`, `quote` (latihan) | A |
| `I()` (untuk teks langsung) | | B |
| `read_csv2()`, `read_tsv()`, `read_delim()`, `read_fwf()`, `read_table()`, `read_log()` | | A |
| `fwf_widths()`, `fwf_positions()` | | A |
| `cols()`, `cols_only()`, `col_logical()`, `col_double()`, `col_integer()`, `col_character()`, `col_factor()`, `col_date()`, `col_datetime()`, `col_number()`, `col_skip()` | `.default` | A |
| `problems()`, `spec()` | | A |
| `write_csv()`, `write_tsv()` | `x`, `file`, `na`, `append` | A |
| `write_rds()`, `read_rds()` | | A |
| `if_else()` | `test`, `yes`, `no` (dijelaskan) | A |
| `factor()`, `list.files()` (`pattern`, `full.names`), `rnorm()`, `length()` | | A |
| `tibble()`, `tribble()` | | A |
| `janitor::clean_names()` | | C |
| `arrow::write_parquet()`, `read_parquet()` | | C |

Berkas data buku: `students.csv`, `01-sales.csv` sampai `03-sales.csv`, diunduh dari tautan pos.it (butuh internet).
Perilaku penting: di readr 2.2.0 teks CSV langsung memicu peringatan kecuali dibungkus `I()`.

### Bab 8. Workflow: getting help
`Sys.setenv(LANGUAGE = "en")`, `reprex::reprex()` (C), `dput()`, `tidyverse_update()` (C), `mean()`, `1:4`. Tidak ada fungsi analisis baru.

## 3. Ringkasan dataset

| Dataset asli | Sumber | Bab | Usulan nama lokal | Status |
|---|---|---|---|---|
| `penguins` | palmerpenguins | 1 | `penguin` (disetujui) | lisensi belum dicek |
| `flights` | nycflights13 | 3, 4, 6 | `penerbangan` (disetujui) | lisensi dan ukuran belum dicek |
| `mtcars` | datasets (bawaan R) | 3, 8 | `mobil` (disetujui) | baris nama menjadi kolom `produsen` (disetujui) |
| `mpg` | ggplot2 | 1, 2 | usulan: `konsumsi_bbm` | menunggu persetujuan |
| `diamonds` | ggplot2 | 1, 6 | usulan: `berlian` | menunggu persetujuan |
| `table1`, `table2`, `table3` | tidyr | 5 | usulan: `tabel1`, `tabel2`, `tabel3` | menunggu persetujuan |
| `billboard` | tidyr | 5 | usulan: `tangga_lagu` | menunggu persetujuan |
| `who2` | tidyr | 5 | usulan: `tb_who` | menunggu persetujuan |
| `household` | tidyr | 5 | usulan: `rumah_tangga` | menunggu persetujuan |
| `cms_patient_experience` | tidyr | 5 | usulan: `pengalaman_pasien` | menunggu persetujuan |
| `Lahman::Batting` | Lahman | 3 | belum diputuskan | sangat besar; kemungkinan dibiarkan C |
| `students.csv`, `*-sales.csv` | berkas buku | 7 | usulan: berkas contoh orisinal di `inst/extdata` | lihat catatan 4.3 |

## 4. Temuan yang memengaruhi desain

1. **Daftar fungsi lebih luas dari draf awal.** Bab 7 memakai satu keluarga fungsi `col_*`, `read_*` dan `write_*`. Bab 5 dan 1 memakai fungsi skala. Draf awal belum memuat ini.
2. **Versi baru.** Buku memakai ggplot2 4.0.3 dan dplyr 1.2.1. ggplot2 4.0 berubah cukup besar di bagian dalam, jadi pembungkus `pemetaan()`/`label()` harus diuji khusus terhadap versi itu.
3. **Berkas data bergantung internet.** Contoh Bab 7 mengunduh dari pos.it. Pengujian paket tidak boleh bergantung jaringan, sehingga perlu berkas contoh orisinal yang meniru sifat-sifatnya (nilai `N/A`, `five`, judul kolom ber-spasi). Ini juga menghindari masalah hak cipta berkas buku.
4. **Pesan galat dan peringatan.** Pesan dari dplyr, readr, tidyr dan ggplot2 berbahasa Inggris dan menyebut nama fungsi asli (misalnya `filter()`). Karena prinsip *behavioral fidelity*, pesan tidak diterjemahkan. Ini harus didokumentasikan.
5. **Latihan Bab 2 dan 7** sengaja menghasilkan galat atau peringatan (salah ketik, CSV rusak). Pembungkus harus meneruskan perilaku itu, dan pengujiannya harus memeriksa galat yang sama.
6. **Sumber `penguin`.** Buku memakai `palmerpenguins::penguins` (nama kolom seperti `flipper_length_mm`). Output buku menunjukkan bahwa objek itu menimpa `datasets::penguins`, jadi R terbaru sudah punya `penguins` bawaan. Ingatan saya: versi bawaan R memakai nama kolom berbeda (misalnya `bill_len`). **Belum diverifikasi.** Bila benar, sumber yang cocok dengan buku adalah palmerpenguins.
7. **`.by` masih diberi label eksperimental di teks buku**, sehingga argumen `.by` termasuk lingkup.
8. **Formula dan tidy evaluation** muncul di `facet_wrap(~island)`, `aes()`, `filter()`, `mutate()`, `select()` dan `pivot_longer(cols = ...)`. Semua pembungkus harus meneruskan ekspresi tanpa mengevaluasinya terlalu dini.
