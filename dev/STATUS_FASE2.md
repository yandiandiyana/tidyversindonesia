# tidyversindonesia: Laporan Status Phase 2

**Tanggal:** 24 Oktober 2026
**Penting:** semua kode di paket ini **belum pernah dijalankan**. Sandbox tempat saya bekerja tidak memiliki R dan tidak punya akses jaringan. Satu-satunya pemeriksaan yang sudah dilakukan adalah pemeriksaan statis dengan Python (lihat bagian 4). Hasil sebenarnya baru diketahui setelah Anda menjalankan langkah di bagian 5.

## 1. Yang dikerjakan

| Berkas | Isi |
|---|---|
| `DESCRIPTION`, `LICENSE`, `LICENSE.md`, `NAMESPACE`, `NEWS.md`, `.Rbuildignore`, `.gitignore`, `*.Rproj` | Metadata paket. Lisensi MIT; R >= 4.1.0 |
| `R/kamus.R` | Kamus fungsi dan argumen (sumber tunggal) |
| `R/mesin.R` | Mesin penerjemah panggilan |
| `R/imp.R`, `inp.R`, `rpi.R`, `trn.R`, `frm.R`, `vis.R`, `grf.R`, `dsr.R`, `dtr.R` | 14 fungsi wakil beserta dokumentasi roxygen |
| `R/data.R`, `data-raw/penguin.R` | Dokumentasi dan skrip pembuat dataset `penguin` |
| `tests/testthat/` | 6 berkas uji: struktur kamus, drift, mesin, perilaku, data, alur kerja |
| `README.Rmd` | Sumber README (belum dirender) |
| `dev/` | Dokumen desain Phase 1 dan laporan ini (tidak ikut build) |

Fungsi wakil: `imp_baca_csv`, `inp_tibble`, `rpi_panjang`, `trn_filter`, `trn_mutasi`, `trn_gabung_kelompok`, `trn_statistik_ringkas`, `frm_diawali`, `vis_ggplot`, `grf_estetika`, `grf_geometrik_titik`, `grf_label`, `dsr_rerata`, `dtr_sekilas`.

## 2. Desain inti: penerjemah panggilan

Setiap fungsi lokal tidak menghitung apa pun. Ia mengambil panggilannya (`sys.call()`), mengganti nama fungsi dan nama argumen menurut kamus, lalu mengevaluasi panggilan asli di lingkungan pemanggil.

Alasan memilih cara ini:
- Ekspresi argumen tidak pernah dievaluasi oleh fungsi lokal, sehingga data masking, tidyselect, formula, dan `...` bekerja seperti fungsi asli.
- Satu mesin untuk semua fungsi; semua kebijakan (R2 nama asli diterima, R3 konflik jadi galat, R4 tidak ada kebocoran nama lokal, R5 nama buatan pengguna tidak disentuh) ada di satu tempat dan bisa diuji.
- Kamus menjadi sumber tunggal sehingga dokumentasi dan kode tidak mudah menyimpang.

Konsekuensi yang perlu diketahui:
- Argumen berbentuk singkatan nama lokal (misalnya `tampilkan_tipe` untuk `tampilkan_tipe_kolom`) tidak diterjemahkan dan akan menghasilkan galat dari fungsi asli. Galatnya jelas, bukan diam-diam.
- Pesan galat dari fungsi asli menyebut nama asli (misalnya `dplyr::filter()`), sesuai prinsip *behavioral fidelity*.
- Fungsi asli dipanggil sekali per pemanggilan lokal, sehingga ada sedikit tambahan waktu (tidak berarti untuk keperluan belajar).

## 3. Nama baru yang saya usulkan (mohon ditinjau)

Argumen berikut belum ada di kamus v8 (kecuali yang tercantum di `fase1_argumen_v2.md`, bagian 5) dan saya tambahkan agar uji drift lengkap:

| Fungsi | Asli | Usulan |
|---|---|---|
| `trn_filter` | `.preserve` | `.pertahankan` |
| `trn_gabung_kelompok` | `.add`, `.drop` | `.tambah`, `.buang_kosong` |
| `imp_baca_csv` dan `rpi_panjang` | argumen tambahan | sesuai `fase1_argumen_v2.md`, bagian 5 |

Pilihan lain yang saya buat sendiri:
- `DESCRIPTION` (Title dan Description) saya tulis dalam **bahasa Inggris** sementara. Kebijakan CRAN tentang bahasa dokumentasi belum saya verifikasi dan akan diperiksa di Phase 6.
- Versi minimum paket (`ggplot2 >= 4.0.0`, `dplyr >= 1.1.0`, `readr >= 2.1.0`, `tibble >= 3.2.0`, `tidyr >= 1.3.0`, `tidyselect >= 1.2.0`) adalah penilaian saya dan belum diuji.
- Belum ada `URL` atau `BugReports` karena repositori belum ada.

## 4. Pemeriksaan yang sudah dilakukan (statis, bukan di R)

Skrip Python memeriksa: kurung seimbang di semua berkas R; kamus = fungsi yang didefinisikan = `NAMESPACE`; setiap fungsi punya `@export` dan setiap argumen punya `@param`; formal fungsi lokal = isi kamus; urutan formal mengikuti urutan fungsi asli **menurut ingatan saya**. Semuanya lolos.

Ini **tidak** membuktikan bahwa kode berjalan, bahwa daftar formal fungsi asli benar, atau bahwa dokumentasi dapat dibangun. Itu tugas langkah berikut.

## 5. Langkah verifikasi untuk Anda

1. **Pasang paket** (sekali saja):
   ```r
   install.packages(c("devtools", "roxygen2", "testthat", "usethis",
                      "palmerpenguins", "dplyr", "ggplot2", "readr",
                      "tibble", "tidyr", "tidyselect", "knitr", "rmarkdown"))
   ```
2. Ekstrak zip, buka `tidyversindonesia.Rproj` di RStudio.
3. **Buat dataset:** `source("data-raw/penguin.R")`.
   Yang diharapkan: pesan `penguin: 344 baris, 8 kolom. Semua pemeriksaan lolos.` (angka 344 dan 8 dari ingatan saya). Bila berhenti dengan galat, kirim galatnya.
4. **Bangun dokumentasi:** `devtools::document()`. Kirim semua peringatan. Perintah ini juga menulis ulang `NAMESPACE`.
5. **Uji cepat:**
   ```r
   devtools::load_all()
   dtr_sekilas(penguin)
   trn_filter(penguin, spesies == "Adelie")
   ```
6. **Jalankan pengujian:** `devtools::test()`. Kirim seluruh keluaran.
7. **Pemeriksaan paket:** `devtools::check()`. Kirim seluruh keluaran, terutama bagian `ERROR`, `WARNING`, `NOTE`.

Anda tidak perlu memperbaiki apa pun sendiri. Kirim keluaran apa adanya (salin dari konsol); saya yang memperbaiki.

## 6. Risiko dan hal yang saya tidak tahu

| Hal | Risiko |
|---|---|
| Mesin penerjemah belum pernah dijalankan | Asumsi saya: `eval()` pada panggilan yang disusun mempertahankan tidy evaluation, kasus `tidyselect` (`frm_diawali` dipanggil dari dalam `select`) bekerja, dan keterlihatan hasil (*visibility*) terjaga. Semua diuji di `test-perilaku.R`. |
| Daftar formal fungsi asli dari ingatan | `test-drift.R` akan menunjukkan bila ada yang salah, dan versi paket yang dipakai (ggplot2 4.0, dplyr 1.2) bisa berbeda dari ingatan saya. |
| `ggplot2::get_labs()` dan `layer_data()` | Dipakai di uji; saya yakin ada di ggplot2 4.0 tetapi belum diuji. |
| Pipe magrittr `%>%` | Belum diuji. Desain dibuat untuk pipe bawaan `\|>`; `%>%` mungkin bekerja tetapi belum terjamin. |
| Dataset `penguin` | Belum ada sampai skrip langkah 3 dijalankan; `LazyData: true` akan menimbulkan NOTE bila folder `data/` belum ada. |
| Dokumentasi | `man/` dan `NAMESPACE` final dibuat oleh `devtools::document()`; saya menulis `NAMESPACE` awal dengan tangan. |

## 7. Berikutnya

1. Anda menjalankan langkah 3 sampai 7 dan mengirim keluarannya.
2. Saya memperbaiki semua kegagalan (kemungkinan besar daftar formal, detail evaluasi, dan dokumentasi).
3. Setelah `devtools::test()` hijau, lanjut Phase 3: seluruh fungsi dalam lingkup, termasuk `penerbangan`, `mobil_mpg`, dan dataset tidyr, dengan uji drift yang sama.

## 8. Hasil uji pertama di mesin Anda (R, Windows) dan perbaikannya

`devtools::test()` pertama: **239 lolos, 3 gagal**, semua kegagalan di `test-drift.R`.

| Temuan | Penyebab | Perbaikan |
|---|---|---|
| `drift: trn_mutasi` (2 kegagalan) | Generik `dplyr::mutate()` hanya berformal `(.data, ...)`. `.by`, `.keep`, `.before`, `.after` adalah formal metode `mutate.data.frame()`, bukan generiknya. Ingatan saya meleset. | `melalui_titik` ditambahkan di `R/kamus.R` |
| `drift: grf_label` | Urutan formal `labs()` terpasang: `title, subtitle, caption, tag, dictionary, alt, alt_insight`. Ingatan saya: `alt, alt_insight, dictionary`. | Urutan formal `grf_label()` disesuaikan |
| Keluaran `glimpse` tercetak saat uji | `expect_invisible()` mencetak keluaran | Uji memakai `withVisible()` dan `capture.output()` |

Yang ikut terbukti oleh uji yang lolos (di mesin Anda): mesin penerjemah bekerja untuk tidy evaluation, `frm_diawali()` di dalam `select()` dan `pivot_longer()`, data masking di dalam `summarise()`, kesetaraan lapisan ggplot (`layer_data`), label (`get_labs`), konflik nama, dataset `penguin`, dan alur terpadu. Daftar formal 12 dari 14 fungsi asli ternyata cocok dengan ingatan saya.

## 9. Phase 3a (disiapkan 24 Oktober 2026; belum diuji)

**Hasil Phase 2 di komputer pengguna:** `devtools::test()` 242 lolos, 0 gagal; `devtools::check()` 0 galat, 0 peringatan, 0 catatan.

**Perubahan cara kerja:** daftar argumen asli tidak lagi diambil dari ingatan. Pengguna menjalankan `dev/audit-formals.R`, dan hasilnya disimpan di `dev/generator/formals_terverifikasi.txt`. Generator (`dev/generator/buat_pembungkus.py`) membangun kamus, pembungkus, dokumentasi, dan `NAMESPACE` dari berkas itu, sehingga urutan argumen selalu sama dengan paket yang terpasang.

**Isi Phase 3a (35 fungsi dihasilkan, 7 masih dikelola tangan, total 42 ekspor):**
`inp_` (tibble, tribble), `rpi_` (panjang, lebar), `trn_` (19 fungsi), `frm_` (12 fungsi).

**Temuan audit yang memengaruhi desain:**
- Hanya generik `dplyr::mutate()` yang formalnya `(.data, ...)`; generik dplyr lain sudah memuat argumennya.
- `rnorm()` ada di paket `stats`, bukan `base` (ditangani di Phase 3c).
- `scale_color_colorblind()` berformal `(black, ...)`.
- `geom_boxplot()` memiliki banyak pasangan `colour`/`color`; butuh mekanisme sinonim (Phase 3b).
- `ggplot2::last_plot()` dan `get_last_plot()` tidak berformal.
- Data nycflights13 terpasang berukuran 4,5 MB (lima tabel); `penerbangan` diputuskan di Phase 3c setelah diukur.
- Nilai `mpg$trans`, `fl`, `class`, `drv` persis seperti pada kamus (termasuk "land rover" pada `manufacturer`).

**Nama dan argumen baru yang perlu ditinjau:** lihat `dev/kamus_fase3a.md` (dihasilkan otomatis).
Catatan khusus: `trn_hitung()` memiliki argumen bernama `nama`, `urut`, dan `bobot`. Karena `...` dapat memuat kolom buatan, menulis `nama = ...` berarti mengisi argumen, sama seperti `name = ...` pada `count()`.

## 10. Phase 3a: hasil di komputer pengguna, dan Phase 3b (disiapkan, belum diuji)

**Hasil Phase 3a:** `devtools::test()` 665 lolos, 0 gagal; `devtools::check()` 0 galat, 0 peringatan, 0 catatan.

**Isi Phase 3b (29 fungsi baru; total 70 fungsi diekspor, 6 masih dikelola tangan):**
- `imp_` (25): `imp_baca_csv`, `imp_baca_csv2`, `imp_baca_tsv`, `imp_baca_delim`, `imp_baca_lebar_tetap`, `imp_baca_tabel`, `imp_baca_log`, `imp_baca_rds`, `imp_baca_parquet` (arrow), `imp_lebar_kolom`, `imp_posisi_kolom`, `imp_masalah`, `imp_spesifikasi`, `imp_kolom`, `imp_kolom_saja`, `imp_kolom_logika`, `imp_kolom_desimal`, `imp_kolom_bulat`, `imp_kolom_teks`, `imp_kolom_faktor`, `imp_kolom_tanggal`, `imp_kolom_waktu`, `imp_kolom_angka`, `imp_kolom_lewati`, `imp_urai_angka`.
- `inp_tulis_` (4): `inp_tulis_csv`, `inp_tulis_tsv`, `inp_tulis_rds`, `inp_tulis_parquet` (arrow).

**Perubahan teknis:**
- `imp_baca_csv` kini dihasilkan generator (sebelumnya ditulis tangan).
- Fungsi penulis mengembalikan nilai secara tak terlihat (`invisible()`), sama seperti fungsi asli.
- `arrow` ditambahkan ke Suggests; pemakaiannya opsional dengan pesan Indonesia bila belum terpasang.
- Teks dokumentasi untuk `...` pada fungsi asli yang tidak punya `...` kini menjelaskan bahwa argumen berbahasa Inggris diterima di situ.
- Generator menangkap satu kekurangan sendiri: `name_repair` pada pembaca readr semula terlewat; sudah dipetakan ke `perbaikan_nama`.

**Risiko yang saya ketahui:**
- `imp_baca_log()` memakai berkas contoh bawaan readr (`example.log`); saya belum memastikan namanya.
- Contoh `imp_kolom_tanggal(format = "%d/%m/%Y")` mengandung `%`; roxygen seharusnya meloloskannya otomatis.
- `escape`, `refhook`, `props`, `mmap`, `format`, `na`, `id` sengaja dibiarkan berbahasa Inggris (istilah teknis).

## 11. Phase 3b: hasil di komputer pengguna, dan Phase 3c (disiapkan, belum diuji)

**Hasil Phase 3b:** `devtools::test()` 1.052 lolos, 0 gagal; `devtools::check()` 0 galat, 0 peringatan, 0 catatan.

**Isi Phase 3c (28 fungsi baru; total 94 fungsi diekspor, hanya `dsr_rerata` dan `dtr_sekilas` yang masih ditulis tangan):**
- `vis_` (3): `vis_ggplot`, `vis_ggplot_simpan`, `vis_ggplot_terakhir`.
- `grf_` (25): `grf_estetika`, `grf_label`; geometri `grf_geometrik_` titik, garis, batang, histogram, densitas, boxplot, haluskan, heksagon; faset `grf_faset_bungkus`, `grf_faset_jendela`; skala `grf_skala_x_kontinu`, `grf_skala_y_balik`, `grf_skalawarna_butawarna`, `grf_skalaisian_butawarna`; sembilan tema `grf_tema_` abu, hitamputih, gambar_garis, terang, gelap, minimal, klasik, kosong, uji.

**Perubahan teknis:**
- Mesin mendukung **sinonim** (`setara`) untuk pasangan `colour`/`color` pada `geom_boxplot()`: nama asli keduanya diterima, dan memberikan nama lokal bersama salah satu nama asli menimbulkan galat konflik.
- Argumen yang diterima fungsi asli lewat `...` (mis. `span` dan `level` pada `geom_smooth()`, argumen skala pada `scale_y_reverse()`) ikut diterjemahkan lewat `melalui_titik`.
- Variabel internal pembungkus kini berawalan titik (`.panggilan`, `.lingkungan`), sehingga formal bernama `lingkungan` (pada `vis_ggplot`) tidak bentrok.
- `ggthemes` dan `hexbin` ditambahkan ke Suggests.
- `vis_ggplot`, `grf_estetika`, `grf_geometrik_titik`, dan `grf_label` dimigrasikan dari tulisan tangan ke generator.

**Risiko yang saya ketahui (belum diuji):**
- Kesetaraan objek tema dibandingkan langsung dengan `expect_equal()`; pada ggplot2 4.0 tema adalah objek S7 dan perbandingannya mungkin berbeda dari dugaan saya.
- Uji faset membandingkan `$params` objek faset; struktur ini bisa berubah pada ggplot2 4.0.
- Uji penyimpanan membandingkan ukuran berkas PNG hasil `vis_ggplot_simpan()` dan `ggsave()`.
- Arti argumen `black` pada `ggthemes::scale_color_colorblind()` tidak saya ketahui; diberi nama `hitam` dan dokumentasinya sengaja generik.
- `rnorm()` dan fungsi `dsr_` lainnya baru dikerjakan di Phase 3d.

## 12. Phase 3c: hasil di komputer pengguna, dan Phase 3d (disiapkan, belum diuji)

**Hasil Phase 3c:** `devtools::test()` 1.533 lolos, 0 gagal, 2 peringatan; `devtools::check()` 0 galat, 0 peringatan, 0 catatan. Uji tema, faset, dan penyimpanan yang dikhawatirkan ternyata lolos.

**Temuan Phase 3c:** `ggthemes::scale_fill_colorblind()` ditandai usang (*soft deprecated*) sejak ggthemes 5.2.0 dan penggantinya tidak ditemukan di sumber yang tersedia. `grf_skalaisian_butawarna()` (tambahan saya, tidak diminta dan tidak dipakai buku) dihapus. `grf_skalawarna_butawarna()` tidak menimbulkan peringatan dan dipertahankan.

**Isi Phase 3d (total 107 fungsi diekspor; seluruhnya dihasilkan generator):**
- `dsr_` (12): `dsr_rerata`, `dsr_jumlah`, `dsr_sinus`, `dsr_adalah_na`, `dsr_urutan`, `dsr_acak_normal` (`stats::rnorm`), `dsr_panjang`, `dsr_faktor`, `dsr_daftar_berkas`, `dsr_dir_kerja`, `dsr_set_dir_kerja`, `dsr_dput`.
- `dtr_` (4): `dtr_sekilas`, `dtr_kepala`, `dtr_ekor`, `dtr_lihat`.
- Dataset (9 baru): `mobil_mpg`, `berlian`, `tabel1`, `tabel2`, `tabel3`, `tangga_lagu`, `tb_who`, `rumah_tangga`, `pengalaman_pasien`; ditambah `penguin` yang sudah ada.

**Cara kerja dataset:** `data-raw/semua.R` menjalankan satu skrip per dataset. Tiap skrip berhenti dengan galat bila nama kolom, level, atau nilai data asli tidak sesuai harapan, dan memeriksa bahwa semua nilai yang tidak diterjemahkan identik dengan data asli (`identical()`).

**Keputusan nama yang saya buat sendiri (mohon ditinjau):**
- Dataset: `berlian`, `tabel1`-`tabel3`, `tangga_lagu`, `tb_who`, `rumah_tangga`, `pengalaman_pasien` (disetujui di Q8).
- Kolom: `tangga_lagu` memakai `minggu1`..`minggu76` (padanan `wk1`..`wk76`); `pengalaman_pasien` memakai awalan `organisasi_` agar dapat dipilih dengan `frm_diawali("organisasi")`; `rumah_tangga` memakai pola `<nilai>_<anak>` (`lahir_anak1`, `nama_anak1`).
- `tb_who`: hanya `negara` dan `tahun` diterjemahkan; kode kolom WHO dibiarkan.
- Nilai: level `cut` pada `berlian` diterjemahkan (`Cukup`, `Baik`, `Sangat Baik`, `Premium`, `Ideal`); nilai `jenis` pada `tabel2` menjadi `kasus`/`populasi`.
- Fungsi: `dsr_sinus`, `dsr_acak_normal`, `dsr_dput`.

**`penerbangan` belum dikirim.** Data nycflights13 terpasang berukuran 4,5 MB untuk lima tabel, mendekati batas 5 MB tarball CRAN. `data-raw/penerbangan.R` hanya mengukur ukuran tiga metode kompresi (gzip, bzip2, xz) tanpa menulis ke `data/`. Keputusan menyertakan atau tidak menunggu angkanya.

**Risiko yang saya ketahui:**
- Skrip data bergantung pada nama kolom dan level hasil audit; bila ggplot2 atau tidyr yang terpasang berbeda dari audit, skrip berhenti dengan pesan yang jelas.
- Status lisensi data di balik `mpg` (EPA), `billboard`, dan `cms_patient_experience` belum diverifikasi; dicatat di dokumentasi tiap dataset.
- `dsr_acak_normal` dan `dtr_ekor` bergantung pada formal `stats::rnorm` (dari ingatan) dan metode `tail()`; uji drift yang memverifikasinya.

## 13. Phase 3d: hasil di komputer pengguna, dan keputusan `penerbangan`

**Hasil Phase 3d:** 10 dataset berhasil dibuat; `devtools::test()` 1.968 lolos, 2 gagal (uji drift `dtr_kepala` dan `dtr_ekor`); `devtools::check()` gagal hanya karena dua uji itu, ditambah satu catatan lingkungan ("unable to verify current time", lihat bawah).

**Penyebab dua kegagalan:** uji drift memeriksa bahwa argumen tambahan pada fungsi lokal berasal dari `melalui_titik`, tetapi `n` pada `head()`/`tail()` namanya tidak diterjemahkan sehingga tercatat di `sama`, bukan di `argumen`. Uji dikoreksi agar mengizinkan irisan `sama` dan `melalui_titik`. Pembungkusnya sendiri benar (uji perilaku `dtr_kepala` dan `dtr_ekor` lolos).

**Keputusan `penerbangan` (pengguna: cukup tabel `flights`):** hasil pengukuran data `flights` saja: gzip 6,95 MB, bzip2 4,30 MB, xz 4,68 MB. Menyimpannya di paket, bersama dataset lain dan kode, hampir pasti melampaui batas 5 MB tarball CRAN. Maka `penerbangan` dibuat saat pertama kali dipakai dari `nycflights13::flights` (`delayedAssign` di `.onLoad`, `R/penerbangan.R`), dengan nycflights13 di `Imports` sehingga terpasang otomatis. Hanya nama kolom yang berubah, dan strukturnya diperiksa (galat jelas bila `flights` berubah). Alternatif yang ditolak: menyertakan data (melampaui 5 MB), atau paket data terpisah (pekerjaan tambahan).

**Risiko yang saya ketahui (belum diuji):**
- Objek yang dibuat di `.onLoad` lalu diekspor lewat `@rawNamespace export(penerbangan)` adalah pola yang jarang; `R CMD check` mungkin memberi catatan tentang dokumentasi data atau ekspor.
- Setiap sesi, akses pertama ke `penerbangan` menyalin 38,8 MB di memori (sekali).

**Catatan lingkungan:** catatan `checking for future file timestamps ... unable to verify current time` bukan masalah paket; komputer tidak dapat memeriksa waktu lewat internet saat `check()`, sehingga butuh sekitar satu menit. Untuk melewatinya: `Sys.setenv("_R_CHECK_SYSTEM_CLOCK_" = "0")` sebelum `devtools::check()`.

## 14. Phase 3 selesai; Phase 4a (Bab 1) disiapkan, belum diuji

**Hasil akhir Phase 3 di komputer pengguna:** `devtools::test()` 1.997 lolos, 0 gagal; `devtools::check()` 0 galat, 0 peringatan, 0 catatan. Sebuah berkas sementara milik pengguna di akar proyek sempat menimbulkan satu peringatan dan satu catatan; setelah dipindahkan, bersih.

**Cakupan fungsi:** 107 fungsi diekspor (`imp_` 25, `inp_` 6, `rpi_` 2, `trn_` 19, `frm_` 12, `vis_` 3, `grf_` 24, `dsr_` 12, `dtr_` 4), 11 dataset (10 tersimpan, `penerbangan` dibuat saat dipakai dari nycflights13).

**Phase 4 (kompatibilitas R4DS) dikerjakan per bab.** Metode: tiap contoh dan latihan ditulis dua kali (kode asli buku persis, dengan paket asli; dan versi lokal), dijalankan, lalu hasilnya dibandingkan lewat `layer_data`, label, dan faset. Laporan cakupan: `dev/cakupan_r4ds.md`.

**Bab 1 (Data visualization):** `tests/testthat/test-r4ds-bab01.R` (17 blok uji). 60 butir diklasifikasi: 5 didukung langsung, 48 setelah lokalisasi sistematis, 6 dengan penyesuaian terdokumentasi, 1 di luar lingkup.

**Penyesuaian terdokumentasi (kelas C) yang ditemukan di Bab 1:**
- `library(tidyverse)` menjadi `library(tidyversindonesia)`; tidyverse tidak dimuat otomatis.
- Pesan galat dan peringatan dari paket asli tetap berbahasa Inggris.
- `library(ggthemes)` dan forcats tetap perlu dipasang untuk `grf_skalawarna_butawarna()` dan `frm_faktor_frekuensi()`.
- Nilai kategorikal yang diterjemahkan (`penggerak`, `kelas`, ...) mengubah urutan level, sehingga warna dan bentuk pada plot bisa berbeda; posisi titik sama.

**Risiko yang saya ketahui (belum diuji):** perbandingan `layer_data` bergantung pada struktur ggplot2 4.0; latihan 5 dan latihan bentuk numerik mengandalkan galat dari ggplot2; uji `ggsave` membandingkan ukuran berkas PNG.

## 15. Phase 4a: hasil Bab 1 di komputer pengguna, dan Phase 4b (Bab 3) disiapkan

**Hasil Bab 1:** 2.126 pemeriksaan lolos, 1 gagal, 6 peringatan. Dari 17 blok uji Bab 1, 16 lolos: semua contoh dan latihan buku memberi hasil yang sama pada kode asli dan alur lokal (data lapisan, label, faset, dan galat yang diharapkan).

**Satu kegagalan adalah kesalahan uji, bukan kesalahan paket:** uji membandingkan ukuran berkas PNG hasil `ggsave()` dan `vis_ggplot_simpan()`; ukuran itu tidak deterministik antar pemanggilan (selisih sekitar 0,2%, dengan arah yang berubah-ubah: 184.236 vs 184.682 pada `test()` dan 62.011 vs 61.869 pada `check()`). Perbaikan: bandingkan dengan toleransi 5%, periksa tanda tangan berkas PNG, dan tegaskan bahwa peringatan "Removed 2 rows" muncul pada kode asli dan lokal. Uji serupa pada `test-perilaku-3c.R` diberi toleransi yang sama.

**Enam peringatan** adalah peringatan "Removed 2 rows containing non-finite values" yang memang muncul pada kode buku asli (data penguin memiliki dua nilai hilang) dan sama pada versi lokal. Pemanggilan `get_labs()` di uji kini membungkusnya dengan `suppressWarnings()`.

**Phase 4b (Bab 3, Data transformation):** `tests/testthat/test-r4ds-bab03.R` (23 blok uji, memakai 32 fungsi lokal). Semua contoh dan latihan berkode pada `nycflights13::flights` dijalankan pada kode asli dan pada `penerbangan` lalu dibandingkan menurut isi kolom, urutan baris, dan jumlah kelompok. Laporan cakupan: 64 butir (3 A, 52 B, 7 C, 2 D). Total gabungan Bab 1 dan 3: 124 butir (8 A, 100 B, 13 C, 3 D).

**Temuan desain paling penting di Bab 3:** teknik pemilihan kolom dengan awalan buku (`starts_with("dep")`, `starts_with("arr")`) tidak langsung berlaku pada nama kolom Indonesia, karena dalam bahasa Indonesia kata pengubah ada di belakang (`waktu_berangkat`, bukan `berangkat_waktu`). `frm_diakhiri("_tiba")` menjaring tiga kolom (termasuk `waktu_jadwal_tiba`), sedangkan `starts_with("arr")` menjaring dua. Penyesuaian terdokumentasi: pakai `frm_cocok()` atau `frm_salah_satu()`. Ini dicatat sebagai kelas C.

**Risiko yang saya ketahui (belum diuji):**
- Pipa `%>%` dari magrittr dengan pembungkus yang menulis ulang panggilan belum pernah diuji; ini uji pertamanya.
- Beberapa pernyataan jumlah baris (108 dan 105 pada `slice_max`, 365 hari) saya ambil dari ingatan atas teks buku.
- Pesan galat "not found" dan "named input" diasumsikan seperti pada dplyr 1.2.
- Bab 3 membandingkan tabel `flights` penuh (336.776 baris) berulang kali; uji ini lebih lambat dari uji lain.

## 16. Phase 4b: hasil Bab 3 di komputer pengguna, dan Phase 4c (Bab 5) disiapkan

**Hasil Bab 1 dan Bab 3:** `devtools::test()` 2.499 lolos, 3 gagal. Bab 1 lolos penuh (133 pemeriksaan, termasuk perbaikan ukuran berkas PNG). Bab 3: 369 pemeriksaan lolos, 3 gagal. Pipa magrittr `%>%` dengan pembungkus, angka baris dari buku (108, 105, 365), dan pesan galat "not found" dan "named input" semuanya cocok.

**Tiga kegagalan Bab 3 adalah kesalahan uji:** `expect_message(..., "regrouped")` gagal juga pada **kode asli buku** ("Expected `summarize(daily, n = n())` to throw a message"), sehingga dplyr tidak mengeluarkan pesan itu pada saat itu. Dugaan: dplyr membatasi frekuensi pesan pengelompokan, dan pesan itu sudah tampil pada uji sebelumnya dalam sesi yang sama. Perbaikan: uji mengumpulkan semua pesan dengan `options(rlib_message_verbosity = "verbose")` lalu membandingkan pesan versi asli dan lokal (harus identik, termasuk bila sama-sama kosong), tidak lagi bergantung pada teks pesan.

**Phase 4c (Bab 5, Data tidying):** `tests/testthat/test-r4ds-bab05.R` (11 blok uji, 20 fungsi lokal, 7 dataset lokal). Bab ini tidak memiliki latihan berkode; semua contoh dijalankan dalam bentuk asli (dataset tidyr) dan lokal. Laporan cakupan Bab 5: 31 butir (3 A, 24 B, 4 C, 0 D). Gabungan Bab 1, 3, 5: 155 butir (11 A, 124 B, 17 C, 3 D).

**Temuan desain di Bab 5:**
- Awalan `minggu` pada `tangga_lagu` dan `organisasi_` pada `pengalaman_pasien` memang dipilih agar teknik awalan buku (`starts_with("wk")`, `starts_with("org")`) tetap berlaku dengan `frm_diawali()`.
- Nilai teks pada kolom nama berubah mengikuti nama kolom lokal: `wk1` menjadi `minggu1`, dan `child1` menjadi `anak1`. Angka setelah `imp_urai_angka()` sama. Dicatat sebagai kelas C.
- Pada `names_to = c(".value", "child")`, kolom hasil dinamai menurut bagian pertama nama kolom lokal (`lahir`, `nama`), bukan `dob`, `name`. Nilai `".value"` tidak diubah.

**Risiko yang saya ketahui (belum diuji):** jumlah baris 24.092, 5.307, 405.440, 9, 500×9, dan 95×8 saya ambil dari teks buku; `values_fn = sum` dengan `fungsi_nilai = sum`; peringatan "not uniquely identified" dianggap sama pada tidyr 1.3.

## 17. Phase 4c: hasil Bab 5 di komputer pengguna, dan Phase 4d (Bab 7) disiapkan

**Hasil Bab 1, 3, dan 5:** `devtools::test()` **2.572 lolos, 0 gagal, 0 peringatan.** Bab 1: 133 pemeriksaan; Bab 3: 371; Bab 5: 71. Semua angka yang saya ambil dari ingatan atas teks buku ternyata benar (24.092, 5.307, 405.440 baris; 95×8 dan 500×9), dan perbaikan uji pesan dplyr bekerja.

**Phase 4d (Bab 7, Data import):** `tests/testthat/test-r4ds-bab07.R` (16 blok uji, 29 fungsi lokal). Cakupan Bab 7: 31 butir (1 A, 24 B, 6 C, 0 D). Gabungan Bab 1, 3, 5, 7: 186 butir (12 A, 148 B, 23 C, 3 D).

**Masalah utama Bab 7 dan solusinya:** hampir semua contoh buku membaca `students.csv` dan `01-sales.csv` dari internet. Pengujian otomatis tidak boleh bergantung jaringan, dan pelajar sebaiknya tidak perlu mengunduh apa pun. Solusi:
- Uji menjalankan tiap contoh pada berkas sementara setara: versi asli (judul kolom Inggris, fungsi readr/dplyr) dan versi lokal (judul kolom Indonesia, fungsi lokal) dengan isi sama.
- Paket kini membawa **berkas contoh orisinal** di `inst/extdata/` (`siswa.csv`, `01-penjualan.csv`, `02-penjualan.csv`, `03-penjualan.csv`) dan fungsi baru `imp_berkas_contoh()` yang mengembalikan lokasinya. Strukturnya setara dengan berkas buku (judul kolom ber-spasi, nilai `N/A`, sel kosong, angka bertulisan `lima`, data terbagi ke tiga berkas), tetapi isinya karangan sendiri, bukan terjemahan data buku (menghindari adaptasi materi berlisensi CC BY-NC-ND).

**Fungsi baru (di luar pembungkus):** `imp_berkas_contoh(nama = NULL)`. Bukan pembungkus fungsi tidyverse, dan tidak ada di kamus; uji `test-kamus.R`, generator NAMESPACE, dan pemeriksa statis disesuaikan. Ini perubahan API publik yang perlu ditinjau pengguna.

**Penyesuaian terdokumentasi (kelas C) yang ditemukan di Bab 7:**
- Berkas buku diganti berkas contoh paket; isi berbeda, struktur setara.
- `"five"` menjadi `"lima"` pada berkas contoh.
- Pola nama berkas `sales\\.csv$` menjadi `penjualan\\.csv$`.
- Data literal tanpa `I()` memicu peringatan readr 2.2 yang tetap berbahasa Inggris dan sama pada versi lokal.
- Pesan galat dan peringatan readr tetap berbahasa Inggris.

**Risiko yang saya ketahui (belum diuji):**
- Peringatan lifecycle dan pesan rlang dapat dibatasi frekuensinya; uji memaksanya tampil dengan `options(lifecycle_verbosity = "warning", rlib_message_verbosity = "verbose")` dan membandingkan jumlah peringatan, bukan teksnya.
- Lima berkas CSV bermasalah (latihan 5) mungkin berperilaku berbeda pada readr 2.2 dari yang digambarkan buku; uji hanya menuntut hasil asli dan lokal sama.
- `problems()` memuat kolom `file` berisi lokasi sementara; hanya kolom `row`, `col`, `expected`, `actual` dibandingkan.
- Dokumentasi `R/berkas_contoh.R` baru; `devtools::document()` perlu dijalankan dua kali.

## 18. Phase 4d: hasil Bab 7 di komputer pengguna, dan perbaikannya

**Hasil:** Bab 1, 3, 5 tetap lolos penuh (133, 371, 71 pemeriksaan). Bab 7: 88 pemeriksaan lolos dan 19 gagal, lalu uji berhenti karena batas jumlah kegagalan ("Maximum number of failures exceeded"), sehingga sebagian uji Bab 7 belum sempat berjalan.

**Semua 19 kegagalan adalah kesalahan alat bantu uji, bukan paket.** Dua sebab, keduanya terbaca langsung dari keluaran:
1. **Atribut tersembunyi readr.** Tabel hasil `read_csv()` membawa atribut `spec` (memuat nama kolom, yang memang berbeda antara berkas Inggris dan Indonesia) dan `problems` (penunjuk memori yang selalu berbeda tiap pembacaan). `as.list()` mempertahankan atribut itu, sehingga dua tabel berisi sama dianggap berbeda. Perbaikan: perbandingan memakai `isi_kolom()` yang hanya mengambil isi tiap kolom.
2. **`lima` lawan `five`.** Berkas lokal memakai `lima` dan berkas asli `five` secara sengaja; uji menyamakan kata itu (`samakan_kata()`) sebelum membandingkan.

Perbaikan dipakai juga pada perbandingan beberapa berkas (`lokal[-1]`), yang belum sempat berjalan.

**Pelajaran:** perbandingan tabel hasil impor readr harus memperlakukan atribut `spec` dan `problems` secara khusus. Ini bukan masalah pada `imp_baca_csv()` (isi kolom yang dikembalikan identik dengan `read_csv()`); atributnya pun dibawa persis oleh fungsi asli.

## 19. Phase 4d selesai (Bab 7 lolos), dan Phase 4e (Bab 2, 4, 6, 8) disiapkan

**Hasil Bab 7:** `devtools::test()` dengan `testthat::set_max_fails(Inf)`: **2.679 lolos, 0 gagal, 0 peringatan** (Bab 1: 133; Bab 3: 371; Bab 5: 71; Bab 7: 107). Keempat bab yang berisi kode utama (1, 3, 5, 7) kini terbukti cocok dengan kode asli buku.

**Phase 4e (Bab 2, 4, 6, 8):** keempat bab kebiasaan kerja dibaca dari buku dan diuji (masing-masing satu berkas pendek).
- `test-r4ds-bab02.R` (7 blok): aritmetika dasar, `sin()` ke `dsr_sinus()`, `seq()` ke `dsr_urutan()`, nama objek, latihan salah ketik (nama argumen yang salah ketik berperilaku sama pada asli dan lokal), dan `ggsave(plot = ...)`.
- `test-r4ds-bab04.R` (4 blok): `%/%`, `%%`, gaya pipa, plot setelah pipa dengan `span`/`se`/`color`/`linewidth`, dan dua latihan merapikan kode.
- `test-r4ds-bab06.R` (5 blok): `not_cancelled`, `getwd()`/`setwd()`, skrip diamonds (heksagon, simpan gambar, tulis CSV).
- `test-r4ds-bab08.R` (4 blok): contoh reprex, `dput()` (keluarannya dapat dijalankan ulang), dan `Sys.setenv()`.

**Cakupan seluruh Bagian I (delapan bab): 233 butir.**

| Kelas | Jumlah |
|---|---|
| A (langsung) | 30 |
| B (lokalisasi sistematis) | 170 |
| C (penyesuaian terdokumentasi) | 29 |
| D (di luar lingkup) | 4 |

**Item di luar pembungkus (kelas C) yang perlu dicatat di panduan:** `library(tidyverse)` menjadi `library(tidyversindonesia)`; `usethis::use_blank_slate()`, `styler`, `reprex::reprex()`, dan `tidyverse_update()` dipakai apa adanya karena merupakan fungsi paket lain yang interaktif atau berbasis RStudio.

**Risiko yang saya ketahui (belum diuji):** uji Bab 4 bergantung pada ingatan saya atas kode restyle dan nama contoh (dibaca dari buku saat audit, tetapi tidak dicocokkan baris demi baris); beberapa contoh Bab 2 (`ggplot(dTA = mpg)`) bergantung pada bagaimana ggplot2 4.0 memperlakukan argumen yang tidak dikenal; `dsr_set_dir_kerja()` mengubah direktori kerja sementara dan memulihkannya.

## 20. Phase 4e: hasil Bab 2, 4, 6, 8 di komputer pengguna

**Hasil:** `devtools::test()` **2.748 lolos, 1 gagal.** Bab 4 (17), Bab 6 (27), dan Bab 8 (6) lolos pada percobaan pertama; Bab 2 punya satu kegagalan.

**Satu kegagalan adalah kesalahan uji, dan berasal dari kode buku:** pada latihan 2 Bab 2, perbaikan harfiah salah ketik (`geom_point(mapping = aes(x = displ, y = hwy))` dan `geom_smooth(method = "lm")` tanpa pemetaan global) membuat `geom_smooth()` kehilangan `x` dan `y`, sehingga `stat_smooth() requires the following missing aesthetics: x and y`. Kode asli versi harfiah itu galat dengan alasan yang sama; galat itu milik ggplot2 dan tidak berbeda antara asli dan lokal. Uji dikoreksi: (1) perbaikan harfiah galat dengan pesan "missing aesthetics" pada keduanya; (2) perbaikan yang benar (pemetaan dipindahkan ke `ggplot()`) memberi data lapisan yang sama pada asli dan lokal. Catatan cakupan Bab 2 diperbarui.

## 21. Phase 4 selesai; Phase 5 (kualitas) dimulai

**Hasil Phase 4e:** `devtools::test()` **2.752 lolos, 0 gagal, 0 peringatan.** Seluruh delapan bab Bagian I (233 butir cakupan) terbukti cocok dengan kode asli buku. Satu kegagalan di Bab 2 (perbaikan harfiah latihan 2) ternyata galat pada kode asli juga dan sudah dikoreksi.

**Phase 5a: lisensi data dan penyediaan data (perubahan arsitektur).**
- Temuan: laporan Global TB WHO berlisensi CC BY-NC-SA 3.0 IGO (hanya non-komersial, *share-alike*). Lisensi tepat data yang dimuat tidyr (`who2`, `table1`-`table3`) tidak diverifikasi; lisensi data EPA, CMS, `diamonds`, dan Billboard juga tidak diverifikasi.
- Keputusan: hanya `penguin` (CC0, terverifikasi) disimpan di dalam paket. Sembilan dataset lainnya, ditambah `penerbangan`, dibuat saat dipakai dari paket sumber (`R/dataset_lazy.R`), sehingga paket tidak mendistribusikan ulang data tersebut. Rincian di `dev/LISENSI_DATA.md`.
- Perubahan berkas: `R/penerbangan.R` digantikan `R/dataset_lazy.R` (satu `.onLoad` untuk semua dataset); `data/*.rda` dan skrip `data-raw/*.R` untuk sembilan dataset itu tidak diperlukan lagi (pengguna perlu menghapusnya).
- Koreksi atas pernyataan saya sebelumnya: kebijakan CRAN yang saya baca langsung menyatakan "neither data nor documentation should exceed 5MB" (kaidah umum) dan "source package tarballs should if possible not exceed 10MB". Jadi alasan menghindari membundel `penerbangan` adalah batas 5 MB untuk **data**, bukan batas 5 MB tarball seperti yang saya sebut sebelumnya.

**Phase 5b: dependensi.** `stats` dan `utils` ditambahkan ke `Imports` karena `stats::rnorm`, `utils::head`, `utils::tail`, dan `utils::View` dipanggil lewat pemanggilan dinamis (tidak terlihat oleh pemeriksaan statis R); rujukan statis ditambahkan di `.gunakan_impor()`.

**Phase 5c: gaya kode.** `.lintr` dan `dev/jalankan-lintr.R` disiapkan. Pemindaian sederhana di sandbox (pengganti sementara; `lintr` asli perlu R) menemukan 317 baris lebih dari 80 karakter (kebanyakan di berkas uji) dan 0 spasi di ujung baris atau tab.

**Belum dikerjakan di Phase 5:** pemeriksaan di platform lain (win-builder, R-hub atau GitHub Actions), README yang dirender, vignette dan panduan migrasi, serta pemeriksaan `--as-cran` yang memeriksa bagian "incoming" (ejaan dan bahasa dokumentasi). Kebijakan CRAN tentang dokumentasi berbahasa non-Inggris belum saya temukan teksnya dengan pasti; `DESCRIPTION` tetap berbahasa Inggris.

**Risiko yang saya ketahui (belum diuji):** objek yang dibuat di `.onLoad` untuk sepuluh nama sekaligus (sebelumnya satu); `getExportedValue()` pada data malas dari paket lain (terbukti bekerja pada skrip audit di komputer pengguna); uji `test-data-3d.R` kini membuat dataset saat uji berjalan sehingga sedikit lebih lambat.

## 22. Phase 5a: hasil di komputer pengguna, dan Phase 5b (dokumentasi pendamping) disiapkan

**Hasil Phase 5a:** `devtools::test()` **2.753 lolos, 0 gagal, 0 peringatan**; `devtools::check()` **0 galat, 0 peringatan, 0 catatan**. Arsitektur baru (dataset dibuat saat dipakai) bekerja: kesepuluh dataset ter-ekspor dan terdokumentasi. Peringatan `unable to access index for repository cran.rstudio.com` hanya masalah koneksi internet pengguna saat memeriksa dependensi.

**Phase 5b: enam vignette** (`vignettes/`), dibangkitkan dari sumber yang sama dengan kode (`dev/generator/buat_vignette.py`) sehingga tidak dapat menyimpang dari kamus:
- `mulai-cepat`: tutorial singkat (kode dijalankan saat vignette dibangun).
- `pemetaan-fungsi`: tabel 107 fungsi dan argumen beserta padanan aslinya.
- `kamus-dataset`: kolom dan nilai tiap dataset.
- `kompatibilitas-r4ds`: laporan 233 butir cakupan Bagian I.
- `panduan-migrasi`: aturan berpindah ke R standar, contoh berdampingan, dan hal yang perlu diperhatikan (teknik awalan kolom, nilai yang diterjemahkan, pesan berbahasa Inggris).
- `pemecahan-masalah`: masalah umum dan penyelesaiannya.

DESCRIPTION: `knitr` dan `rmarkdown` ditambahkan ke Suggests, dan `VignetteBuilder: knitr`. README.Rmd dan NEWS.md diperbarui.

**Risiko yang saya ketahui (belum diuji):** vignette dibangun oleh `R CMD check` dan membutuhkan knitr, rmarkdown, dan pandoc (RStudio menyertakannya); tabel pada `kompatibilitas-r4ds` memuat tanda `\|` di dalam kode yang mungkin tampil dengan garis miring di HTML; waktu `check()` bertambah beberapa detik; README.md belum dirender (perlu `devtools::build_readme()`).

## 23. Phase 5b selesai di komputer pengguna; Phase 6 (rilis) dimulai

**Hasil:** `devtools::check()` **0 galat, 0 peringatan, 0 catatan**, termasuk pembangunan enam vignette (`creating vignettes (28.8s)`, `checking re-building of vignette outputs ... OK`). `devtools::build_readme()` menampilkan peringatan dependensi ("ggplot2 (behind: 4.0.3 vs 4.0.4)") dan keluaran pengguna berhenti di situ; belum dipastikan `README.md` terbentuk.

**Phase 6a:** `cran-comments.md` (draf; bagian platform lain bertanda BELUM DIJALANKAN) dan `dev/DAFTAR_PERIKSA_RILIS.md` (daftar periksa yang jujur: terbukti, belum dijalankan, butuh keputusan pengguna, belum dapat dipastikan).

**Status penerimaan:** paket belum dikirim ke CRAN dan tidak ada jaminan diterima.

## 24. Phase 6b: dataset `mobil`, versi 0.2.0, dan perapian (17 November 2026; belum diuji)

**Semua perubahan di bawah ditulis tanpa R. Tidak ada yang dijalankan di R.** Pemeriksaan yang dilakukan hanya statis: generator Python dijalankan dan dibandingkan dengan keluaran sebelumnya.

**Keputusan pengguna:** versi rilis berikutnya 0.2.0; dataset `mobil` (dari `datasets::mtcars`) diimplementasikan seperti dataset lain, dibuat saat dipakai.

**Perubahan:**
- `dev/generator/buat_dataset.py`: spesifikasi `mobil`; dukungan `nama_baris` (nama baris menjadi kolom pertama lewat `tibble::as_tibble(rownames = )`); uji khusus dan contoh pada dokumentasi. Generator terbukti mereproduksi berkas lama persis sebelum diubah; setelah diubah hanya blok `mobil` yang bertambah.
- Dihasilkan ulang: `R/dataset_lazy.R`, `R/data.R`, `tests/testthat/test-data-3d.R`, `vignettes/kamus-dataset.Rmd`, `vignettes/kompatibilitas-r4ds.Rmd`, `dev/cakupan_r4ds.md`.
- `mobil`: 32 baris, 12 kolom (`mobil`, `efisiensi_mpg`, `silinder`, `kapasitas_mesin_in3`, `tenaga_kuda`, `rasio_gardan`, `berat_ribu_lb`, `waktu_seperempat_mil`, `bentuk_mesin`, `kode_transmisi`, `jumlah_gigi`, `jumlah_karburator`). Nilai dan satuan tidak diubah. Objek berupa tibble (aslinya data frame): perbedaan ini didokumentasikan.
- Cakupan R4DS: butir 3.4 (`mtcars`) berpindah dari kelas D ke B. Total 233 butir: A 30, B 171, C 29, D 3.
- Uji baru: `tests/testthat/test-mobil.R`, uji Bab 3.4 di `test-r4ds-bab03.R`, dan uji `mobil` yang dihasilkan di `test-data-3d.R`.
- `DESCRIPTION`: `Version: 0.2.0`, `datasets` di `Imports` (dengan rujukan statis di `.gunakan_impor()`), `Language: id`.
- `NAMESPACE`: `export(mobil)` ditambahkan tangan; `devtools::document()` akan menuliskannya ulang dan membuat `man/mobil.Rd`.
- `skip_on_cran()` pada delapan berkas `test-r4ds-bab*.R`. `devtools::test()` dan `devtools::check()` tetap menjalankannya (`NOT_CRAN=true`).
- Angka 107 fungsi diperbaiki menjadi 108 (`imp_berkas_contoh()` dihitung); dataset menjadi 12. `NEWS.md`, `README.Rmd`, `README.md`, `cran-comments.md`, `dev/LISENSI_DATA.md`, dan `dev/DAFTAR_PERIKSA_RILIS.md` diperbarui.

**Langkah verifikasi untuk Anda:**
1. `devtools::document()` (dua kali). `man/mobil.Rd` harus terbentuk; kirim peringatannya.
2. `testthat::set_max_fails(Inf); devtools::test()`; kirim ringkasan akhir.
3. `Sys.setenv("_R_CHECK_SYSTEM_CLOCK_" = "0"); devtools::check()`.
4. `devtools::build_readme()`.

**Risiko yang saya ketahui (belum diuji):**
- `getExportedValue("datasets", "mtcars")` dan `tibble::as_tibble(rownames = "mobil")` belum dijalankan.
- Contoh `mobil` di `man/mobil.Rd` membuat grafik saat `check()`.
- `Language: id` dapat mengubah pemeriksaan ejaan pada `check(cran = TRUE)`.
- Pernyataan baris atau kolom 32 x 12 dan 11 mobil dengan empat silinder berasal dari pengetahuan saya tentang `mtcars`, bukan dari pengujian.
