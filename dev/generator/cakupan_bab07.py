"""Cakupan R4DS 2e, Bab 7 (Data import).

Kelas: A = didukung langsung; B = didukung setelah lokalisasi sistematis;
C = perlu penyesuaian terdokumentasi; D = di luar lingkup.
Uji = bagian di tests/testthat/test-r4ds-bab07.R.
Buku mengunduh berkas dari internet; uji memakai berkas sementara setara, dan paket
membawa berkas contoh orisinal (`imp_berkas_contoh()`).
"""
BAB = 7
JUDUL = 'Data import'
BARIS = [
    ('7.1.1', '`library(tidyverse)`', '`library(tidyversindonesia)`', 'C', '-', 'Lihat catatan di Bab 1.'),
    ('7.2', '`read_csv("data/students.csv")` dan `read_csv("https://pos.it/r4ds-students-csv")`', '`imp_baca_csv(imp_berkas_contoh("siswa.csv"))`', 'C', '7.2 (siswa), contoh paket',
     'Berkas buku hanya tersedia lewat unduhan. Paket membawa `siswa.csv` orisinal dengan struktur dan keanehan setara (judul ber-spasi, `N/A`, sel kosong, angka bertulisan), tetapi isinya berbeda. `imp_baca_csv()` pada URL buku tetap bekerja bila ada internet (tidak diuji otomatis).'),
    ('7.2.1', '`read_csv("...")` dengan `na = c("N/A", "")`', '`imp_baca_csv(..., na = c("N/A", ""))`', 'B', '7.2 (siswa)', 'Argumen `na` tidak diubah.'),
    ('7.2.1', 'nama kolom non-sintaksis dan `rename(student_id = `Student ID`, ...)`', '`trn_ubah_nama(id_siswa = `ID Siswa`, ...)`', 'B', '7.2 (siswa)', ''),
    ('7.2.1', '`janitor::clean_names()`', '`trn_rapikan_nama()`', 'B', '7.2 (clean_names)', 'Memerlukan janitor (opsional).'),
    ('7.2.1', '`mutate(meal_plan = factor(meal_plan))`', '`trn_mutasi(paket_makan = dsr_faktor(paket_makan))`', 'B', '7.2 (clean_names)', ''),
    ('7.2.1', '`if_else(age == "five", "5", age)` dan `parse_number()`', '`frm_jika_lain(usia == "lima", "5", usia)` dan `imp_urai_angka()`', 'C', '7.2 (clean_names)', 'Berkas contoh menulis angka dengan kata `lima` (bukan `five`); fungsi dan hasilnya setara.'),
    ('7.2.1', 'data literal dalam teks: `read_csv("a,b,c\\n1,2,3")`', 'sama, dengan peringatan yang sama', 'C', '7.2.1 (literal)', 'readr 2.2 meminta `I()` untuk data literal; peringatan tetap berbahasa Inggris dan sama pada versi lokal.'),
    ('7.2.1', 'data literal dengan `I("...")`', '`imp_baca_csv(I("..."))`', 'B', '7.2.1 (literal)', ''),
    ('7.2.1', '`skip = 2`, `comment = "#"`', '`lewati = 2`, `komentar = "#"`', 'B', '7.2.1 (lewati)', ''),
    ('7.2.1', '`col_names = FALSE`, `col_names = c("x", "y", "z")`', '`nama_kolom = FALSE`, `nama_kolom = c(...)`', 'B', '7.2.1 (lewati)', 'Nama bawaan `X1`, `X2`, `X3` tidak berubah.'),
    ('7.2.2', 'penyebutan `read_csv2()`, `read_tsv()`, `read_delim()`, `read_fwf()`, `read_table()`, `read_log()`', '`imp_baca_csv2()`, `imp_baca_tsv()`, `imp_baca_delim()`, `imp_baca_lebar_tetap()`, `imp_baca_tabel()`, `imp_baca_log()`', 'B', '7.2.4; Phase 3b', 'Diuji di `test-perilaku-3b.R` terhadap fungsi asli.'),
    ('7.2.4', 'Latihan 1 (berkas dengan pemisah `\\|`)', '`imp_baca_delim(..., pembatas = "\\|")`', 'B', '7.2.4 (1-4)', ''),
    ('7.2.4', 'Latihan 2 (argumen sama pada `read_csv()` dan `read_tsv()`)', 'argumen lokal yang sama', 'B', '7.2.4 (1-4)', ''),
    ('7.2.4', 'Latihan 3 (argumen terpenting `read_fwf()`)', '`berkas`, `posisi_kolom`', 'B', '7.2.4 (1-4)', ''),
    ('7.2.4', 'Latihan 4 (`quote = "\'"`)', '`kutip = "\'"`', 'B', '7.2.4 (1-4)', ''),
    ('7.2.4', 'Latihan 5 (lima berkas CSV bermasalah)', 'hasil dan jumlah peringatan sama', 'C', '7.2.4 (5)', 'Peringatan dan pesan galat readr tetap berbahasa Inggris.'),
    ('7.2.4', 'Latihan 6 (nama kolom non-sintaksis: `tibble`, `pull`, `mutate`, `rename`, plot)', '`inp_tibble`, `trn_tarik`, `trn_mutasi`, `trn_ubah_nama`, `vis_ggplot`', 'B', '7.2.4 (6)', 'Tanda kutip terbalik dipakai seperti biasa.'),
    ('7.3.1', 'tebakan tipe kolom (logis, angka, tanggal)', 'sama', 'B', '7.3.1-7.3.2', ''),
    ('7.3.2', 'data hilang bertanda `.`: `na = "."`', '`na = "."`', 'B', '7.3.1-7.3.2', ''),
    ('7.3.2', '`col_types = list(x = col_double())` dan `problems(df)`', '`tipe_kolom = list(x = imp_kolom_desimal())` dan `imp_masalah(df)`', 'B', '7.3.1-7.3.2', 'Kolom `file` pada `problems()` memuat lokasi sementara sehingga tidak dibandingkan.'),
    ('7.3.3', '`cols(.default = col_character())`, `cols_only(x = col_character())`', '`imp_kolom(.bawaan = imp_kolom_teks())`, `imp_kolom_saja(x = imp_kolom_teks())`', 'B', '7.3.3', ''),
    ('7.3.3', 'penyebutan `col_date()`, `col_factor()`, `col_logical()`, dan sejenisnya', '`imp_kolom_tanggal()`, `imp_kolom_faktor()`, `imp_kolom_logika()`, ...', 'B', '7.3.3; Phase 3b', 'Diuji di `test-perilaku-3b.R`.'),
    ('7.4', '`list.files("data", pattern = "sales\\\\.csv$", full.names = TRUE)`', '`dsr_daftar_berkas("data", pola = "penjualan\\\\.csv$", nama_lengkap = TRUE)`', 'C', '7.4', 'Berkas contoh bernama `01-penjualan.csv` dst., sehingga pola mengikuti.'),
    ('7.4', '`read_csv(sales_files, id = "file")`', '`imp_baca_csv(berkas, id = "berkas")`', 'B', '7.4', 'Berkas contoh buku (`01-sales.csv`) diganti `01-penjualan.csv` dst. dengan 11 baris.'),
    ('7.5', '`write_csv(students, "students.csv")`', '`inp_tulis_csv(siswa, "siswa.csv")`', 'B', '7.5', 'CSV tidak mempertahankan faktor.'),
    ('7.5', '`write_rds()` dan `read_rds()`', '`inp_tulis_rds()` dan `imp_baca_rds()`', 'B', '7.5', 'RDS mempertahankan faktor.'),
    ('7.5', '`arrow::write_parquet()` dan `read_parquet()`', '`inp_tulis_parquet()` dan `imp_baca_parquet()`', 'B', '7.5 (parquet)', 'Memerlukan arrow (opsional).'),
    ('7.6', '`tibble(x = ..., y = ..., z = ...)`', '`inp_tibble(...)`', 'B', '7.6', ''),
    ('7.6', '`tribble(~x, ~y, ~z, ...)`', '`inp_tribble(...)`', 'B', '7.6', ''),
    ('7.7', 'ringkasan bab', '-', 'A', '-', ''),
]
