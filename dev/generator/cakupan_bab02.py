"""Cakupan R4DS 2e, Bab 2 (Workflow: basics). Uji: tests/testthat/test-r4ds-bab02.R."""
BAB = 2
JUDUL = 'Workflow: basics'
BARIS = [
    ('2.1', 'aritmetika `1 / 200 * 30`, `(59 + 73 + 2) / 3`', 'tidak berubah', 'A', '2.1', 'Operator R dasar tidak dibungkus.'),
    ('2.1', '`sin(pi / 2)`', '`dsr_sinus(pi / 2)`', 'B', '2.1', ''),
    ('2.1', 'penugasan `x <- 3 * 4`', 'tidak berubah', 'A', '2.1', ''),
    ('2.1', '`c(2, 3, 5, 7, 11, 13)`, `primes * 2`, `primes - 1`', 'tidak berubah', 'A', '2.1', '`c()` sengaja tidak dibungkus (keputusan pengguna).'),
    ('2.2', 'komentar dengan `#`', 'tidak berubah', 'A', '-', ''),
    ('2.3', 'aturan nama objek, `r_rocks <- 2^3`', 'tidak berubah', 'A', '2.3', ''),
    ('2.3', '`r_rock` dan `R_rocks` menghasilkan galat "object not found"', 'galat yang sama', 'A', '2.3', 'Pesan galat R tetap berbahasa Inggris.'),
    ('2.4', '`seq(from = 1, to = 10)`', '`dsr_urutan(dari = 1, sampai = 10)`', 'B', '2.4', ''),
    ('2.4', '`seq(1, 10)`', '`dsr_urutan(1, 10)`', 'B', '2.4', ''),
    ('2.4', 'teks `x <- "hello world"` dan tanda kutip tak berpasangan', 'tidak berubah', 'A', '-', 'Perilaku konsol R.'),
    ('2.5', 'Latihan 1 (galat karena karakter yang mirip, `my_varıable`)', 'galat yang sama', 'A', '2.5 (1)', ''),
    ('2.5', 'Latihan 2 (perbaiki salah ketik pada kode ggplot2)', '`vis_ggplot`, `grf_geometrik_titik`, `grf_geometrik_haluskan` setelah diperbaiki', 'B', '2.5 (2)', 'Salah ketik nama argumen (`maping`, `dTA`) berperilaku sama pada asli dan lokal. Perbaikan harfiah masih galat (geom_smooth() kehilangan x dan y) pada keduanya; pemetaan harus dipindahkan ke `ggplot()`.'),
    ('2.5', 'Latihan 2 (pesan galat dan peringatan dari salah ketik)', 'pesan yang sama', 'C', '2.5 (2)', 'Pesan tetap berbahasa Inggris.'),
    ('2.5', 'Latihan 3 (pintasan papan ketik RStudio)', '-', 'A', '-', 'Tanpa kode.'),
    ('2.5', 'Latihan 4 (`ggsave(filename = "mpg-plot.png", plot = my_bar_plot)`)', '`vis_ggplot_simpan(nama_berkas = "mpg-plot.png", plot = plot_batang)`', 'B', '2.5 (4)', ''),
    ('2.6', 'ringkasan bab', '-', 'A', '-', ''),
]
