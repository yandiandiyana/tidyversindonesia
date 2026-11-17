"""Cakupan R4DS 2e, Bab 4 (Workflow: code style). Uji: tests/testthat/test-r4ds-bab04.R."""
BAB = 4
JUDUL = 'Workflow: code style'
BARIS = [
    ('4.1', '`library(tidyverse)` dan paket `styler`', '`library(tidyversindonesia)`; `styler` dipakai langsung', 'C', '-', '`styler::style_file()` dan pintasan RStudio berada di luar cakupan pembungkus; tetap dipakai apa adanya.'),
    ('4.2', 'penamaan objek dengan `snake_case`: `short_flights`', '`penerbangan_pendek`', 'B', '4.1-4.2', 'Aturan penamaan sama; contoh memakai nama Indonesia.'),
    ('4.3', 'spasi di sekitar operator, `mutate(speed = ..., dep_hour = dep_time %/% 100, dep_minute = dep_time %% 100)`', '`trn_mutasi(kecepatan = ..., jam_berangkat = waktu_berangkat %/% 100, ...)`', 'B', '4.1-4.2', '`%/%` dan `%%` tidak berubah.'),
    ('4.4', '`filter(!is.na(arr_delay), !is.na(tailnum)) \\|> count(dest)`', '`trn_filter(!dsr_adalah_na(...), ...) \\|> trn_hitung(tujuan)`', 'B', '4.4', '`!is.na()` dari R dasar juga tetap berfungsi pada fungsi lokal.'),
    ('4.4', '`group_by(tailnum) \\|> summarize(delay = mean(arr_delay, na.rm = TRUE), n = n())`', '`trn_gabung_kelompok(nomor_ekor) \\|> trn_statistik_ringkas(...)`', 'B', '4.4', ''),
    ('4.5', 'plot setelah pipa: `ggplot(aes(x = month, y = delay)) + geom_point() + geom_line()`', '`vis_ggplot(grf_estetika(...)) + grf_geometrik_titik() + grf_geometrik_garis()`', 'B', '4.5', ''),
    ('4.5', '`geom_smooth(method = "loess", span = 0.5, se = FALSE, color = "white", linewidth = 4)`', '`grf_geometrik_haluskan(metode = "loess", rentang = 0.5, selang_kepercayaan = FALSE, warna = "white", ketebalan_garis = 4)`', 'B', '4.5', 'Argumen `span` diterima fungsi asli lewat `...` dan ikut diterjemahkan.'),
    ('4.6', 'komentar pemisah bagian `# Load data ------`', 'tidak berubah', 'A', '-', ''),
    ('4.7', 'Latihan 1 (rapikan kode penerbangan IAH tanpa spasi)', 'kode lokal yang dirapikan', 'B', '4.6 (latihan 1)', 'Hasil lokal sama dengan hasil kode asli yang berantakan.'),
    ('4.7', 'Latihan 1 (rapikan kode UA/IAH/HOU dengan `sched_dep_time > 0900`)', '`waktu_jadwal_berangkat > 0900`', 'B', '4.6 (latihan 1)', ''),
    ('4.7', 'Latihan 2 (jalankan `Code > Reformat Code` atau `styler`)', '-', 'A', '-', 'Fitur RStudio.'),
    ('4.8', 'ringkasan bab', '-', 'A', '-', ''),
]
