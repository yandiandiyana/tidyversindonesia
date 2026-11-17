"""Cakupan R4DS 2e, Bab 6 (Workflow: scripts and projects). Uji: tests/testthat/test-r4ds-bab06.R."""
BAB = 6
JUDUL = 'Workflow: scripts and projects'
BARIS = [
    ('6.1', 'menjalankan skrip, `library()` di awal skrip, tanpa `install.packages()` di dalam skrip', 'tidak berubah', 'A', '-', 'Kebiasaan kerja.'),
    ('6.1.1', '`filter(!is.na(dep_delay), !is.na(arr_delay))` dan `not_cancelled`', '`trn_filter(!dsr_adalah_na(...), ...)`', 'B', '6.1.1', ''),
    ('6.1.1', '`group_by(year, month, day) \\|> summarize(mean = mean(dep_delay))`', '`trn_gabung_kelompok(tahun, bulan, hari) \\|> trn_statistik_ringkas(rerata = dsr_rerata(...))`', 'B', '6.1.1', ''),
    ('6.1.2', 'diagnostik RStudio (`x y <- 10`, `3 == NA`)', '`dsr_adalah_na(NA)`', 'B', '6.1.1 (galat sintaksis)', 'Galat sintaksis adalah milik R; `is.na()` menjadi `dsr_adalah_na()`.'),
    ('6.2', '`getwd()`', '`dsr_dir_kerja()`', 'B', '6.2', ''),
    ('6.2', '`setwd("/path")`', '`dsr_set_dir_kerja("/path")`', 'B', '6.2', 'Buku tidak menyarankan `setwd()`; fungsi lokal mengembalikan lokasi lama secara tak terlihat, seperti aslinya.'),
    ('6.2', '`usethis::use_blank_slate()`', 'tidak berubah', 'C', '-', 'Fungsi paket `usethis` di luar cakupan pembungkus; tetap dipakai apa adanya.'),
    ('6.2', 'proyek RStudio, jalur relatif, dan garis miring pada Windows', 'tidak berubah', 'A', '-', 'Fitur RStudio dan konvensi R.'),
    ('6.1.1', '`ggplot(diamonds, aes(x = carat, y = price)) + geom_hex()`', '`vis_ggplot(berlian, grf_estetika(x = karat, y = harga)) + grf_geometrik_heksagon()`', 'B', '6.1.1 (diamonds)', 'Memerlukan paket hexbin.'),
    ('6.1.1', '`ggsave("diamonds.png")`', '`vis_ggplot_simpan("diamonds.png")`', 'B', '6.1.1 (diamonds)', ''),
    ('6.1.1', '`write_csv(diamonds, "data/diamonds.csv")`', '`inp_tulis_csv(berlian, "data/berlian.csv")`', 'C', '6.1.1 (tulis CSV)', 'Isi berkas sama, kecuali nilai kolom `potongan` (`cut`) yang diterjemahkan.'),
    ('6.3', 'ringkasan bab dan latihan (tanpa kode)', '-', 'A', '-', ''),
]
