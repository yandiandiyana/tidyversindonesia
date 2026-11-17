"""Cakupan R4DS 2e, Bab 8 (Workflow: getting help). Uji: tests/testthat/test-r4ds-bab08.R."""
BAB = 8
JUDUL = 'Workflow: getting help'
BARIS = [
    ('8.1', 'mencari bantuan lewat Google, Stack Overflow, dan komunitas Posit', '-', 'D', '-', 'Di luar cakupan paket. Pesan galat dalam bahasa Inggris tetap berguna untuk mencari bantuan.'),
    ('8.1', '`Sys.setenv(LANGUAGE = "en")` agar pesan galat berbahasa Inggris', 'tidak berubah', 'A', '8.1', 'Tetap berlaku bagi pelajar yang ingin mencari galat di internet.'),
    ('8.2', 'contoh reprex `y <- 1:4; mean(y)`', '`dsr_rerata(y)`', 'B', '8.2', ''),
    ('8.2', '`reprex::reprex()`', 'tidak berubah', 'C', '-', 'Fungsi paket `reprex` bersifat interaktif (papan klip dan penampil) dan di luar cakupan pembungkus.'),
    ('8.2', '`dput(mtcars)`', '`dsr_dput(...)`', 'B', '8.2', 'Dataset `mtcars` asli tetap tersedia di R dasar; `dsr_dput()` bekerja pada objek apa pun dan keluarannya dapat dijalankan ulang.'),
    ('8.2', '`tidyverse_update()` dan memeriksa versi paket', 'tidak berubah', 'C', '-', 'Dipakai apa adanya.'),
    ('8.3', 'menyusun pertanyaan yang baik dan ringkasan bab (tanpa kode)', '-', 'A', '-', ''),
]
