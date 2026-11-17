"""Cakupan R4DS 2e, Bab 5 (Data tidying).

Kelas: A = didukung langsung; B = didukung setelah lokalisasi sistematis;
C = perlu penyesuaian terdokumentasi; D = di luar lingkup.
Uji = bagian di tests/testthat/test-r4ds-bab05.R.
Bab ini tidak memiliki latihan berkode (hanya dua pertanyaan konsep di 5.2.1).
"""
BAB = 5
JUDUL = 'Data tidying'
BARIS = [
    ('5.1.1', '`library(tidyverse)`', '`library(tidyversindonesia)`', 'C', '-', 'Tidyverse tidak dimuat otomatis; lihat catatan di Bab 1.'),
    ('5.2', '`table1`, `table2`, `table3` (cetak)', '`tabel1`, `tabel2`, `tabel3`', 'B', '5.2 (dataset)', 'Nama kolom diterjemahkan; nilai `type` pada `tabel2` menjadi `kasus`/`populasi`.'),
    ('5.2', '`mutate(rate = cases / population * 10000)`', '`trn_mutasi(rasio = kasus / populasi * 10000)`', 'B', '5.2 (laju)', ''),
    ('5.2', '`group_by(year) \\|> summarize(total_cases = sum(cases))`', '`trn_gabung_kelompok(tahun) \\|> trn_statistik_ringkas(total_kasus = dsr_jumlah(kasus))`', 'B', '5.2 (laju)', ''),
    ('5.2', 'plot kasus: `geom_line(aes(group = country), color = "grey50")`, `geom_point(aes(color = country, shape = country))`, `scale_x_continuous(breaks = c(1999, 2000))`', '`grf_geometrik_garis(grf_estetika(kelompok = negara), warna = "grey50")`, `grf_geometrik_titik(...)`, `grf_skala_x_kontinu(posisi_tanda = ...)`', 'B', '5.2 (visualisasi)', ''),
    ('5.2.1', 'Latihan 1 dan 2 (menggambarkan proses menghitung laju)', '-', 'A', '-', 'Pertanyaan konsep tanpa kode.'),
    ('5.3.1', '`billboard`', '`tangga_lagu`', 'B', '5.3.1', 'Kolom `wk1`..`wk76` menjadi `minggu1`..`minggu76`; nilai tidak diubah.'),
    ('5.3.1', '`pivot_longer(cols = starts_with("wk"), names_to = "week", values_to = "rank")`', '`rpi_panjang(kolom = frm_diawali("minggu"), nama_ke = "minggu", nilai_ke = "peringkat")`', 'B', '5.3.1', 'Awalan `wk` menjadi `minggu`, sehingga teknik awalan buku tetap berlaku di sini.'),
    ('5.3.1', 'nilai kolom `week` sebelum `parse_number`: `wk1`, `wk2`, ...', '`minggu1`, `minggu2`, ...', 'C', '5.3.1', 'Teks pada kolom nama berubah mengikuti nama kolom lokal; angka setelah `imp_urai_angka()` sama.'),
    ('5.3.1', '`values_drop_na = TRUE`', '`buang_nilai_na = TRUE`', 'B', '5.3.1 (parse_number)', 'Hasil 5.307 baris, seperti di buku.'),
    ('5.3.1', '`mutate(week = parse_number(week))`', '`trn_mutasi(minggu = imp_urai_angka(minggu))`', 'B', '5.3.1 (parse_number)', ''),
    ('5.3.1', 'plot peringkat: `aes(group = track)`, `geom_line(alpha = 0.25)`, `scale_y_reverse()`', '`grf_estetika(kelompok = lagu)`, `grf_geometrik_garis(alfa = 0.25)`, `grf_skala_y_balik()`', 'B', '5.3.1 (parse_number)', ''),
    ('5.3.2', '`tribble(~id, ~bp1, ~bp2, ...)`', '`inp_tribble(~id, ~bp1, ~bp2, ...)`', 'B', '5.3.2', ''),
    ('5.3.2', '`pivot_longer(cols = bp1:bp2, names_to = "measurement", values_to = "value")`', '`rpi_panjang(kolom = bp1:bp2, nama_ke = ..., nilai_ke = ...)`', 'B', '5.3.2', ''),
    ('5.3.3', '`who2`', '`tb_who`', 'B', '5.3.3', 'Hanya `country` dan `year` yang diterjemahkan (`negara`, `tahun`); kode kolom WHO tidak diubah.'),
    ('5.3.3', '`pivot_longer(cols = !(country:year), names_to = c("diagnosis", "gender", "age"), names_sep = "_", values_to = "count")`', '`rpi_panjang(kolom = !(negara:tahun), nama_ke = c(...), pemisah_nama = "_", nilai_ke = ...)`', 'B', '5.3.3', 'Hasil 405.440 baris, seperti di buku. Nama kolom hasil dipilih pengguna.'),
    ('5.3.3', 'penyebutan `names_pattern` (tanpa kode)', '`pola_nama`', 'A', '-', 'Hanya disebut dalam teks.'),
    ('5.3.4', '`household`', '`rumah_tangga`', 'B', '5.3.4', 'Kolom `dob_child1` menjadi `lahir_anak1`, dan seterusnya.'),
    ('5.3.4', '`names_to = c(".value", "child")`, `names_sep = "_"`, `values_drop_na = TRUE`', '`nama_ke = c(".value", "anak")`, `pemisah_nama = "_"`, `buang_nilai_na = TRUE`', 'C', '5.3.4',
     'Nilai `".value"` tidak diubah. Kolom hasil bernama `lahir` dan `nama` (bagian pertama nama kolom lokal), bukan `dob` dan `name`; nilai `child1` menjadi `anak1`.'),
    ('5.4', '`cms_patient_experience`', '`pengalaman_pasien`', 'B', '5.4', 'Kolom `org_pac_id`, `org_nm` menjadi `organisasi_id`, `organisasi_nama`.'),
    ('5.4', '`distinct(measure_cd, measure_title)`', '`trn_unik(ukuran_kode, ukuran_judul)`', 'B', '5.4', ''),
    ('5.4', '`pivot_wider(names_from = measure_cd, values_from = prf_rate)`', '`rpi_lebar(nama_dari = ukuran_kode, nilai_dari = tingkat_kinerja)`', 'B', '5.4', '500 baris, 9 kolom.'),
    ('5.4', '`pivot_wider(id_cols = starts_with("org"), ...)`', '`rpi_lebar(kolom_id = frm_diawali("organisasi"), ...)`', 'B', '5.4', 'Awalan `organisasi_` dipilih agar teknik buku tetap berlaku. 95 baris, 8 kolom.'),
    ('5.4.1', 'tribble `df` pengukuran tekanan darah dan `pivot_wider()`', '`inp_tribble`, `rpi_lebar`', 'B', '5.4.1', ''),
    ('5.4.1', '`distinct(measurement) \\|> pull()`', '`trn_unik(measurement) \\|> trn_tarik()`', 'B', '5.4.1', ''),
    ('5.4.1', '`select(!measurement & !value) \\|> distinct()`', '`trn_pilih(!measurement & !value) \\|> trn_unik()`', 'B', '5.4.1', ''),
    ('5.4.1', '`mutate(x = NA, y = NA, z = NA)`', '`trn_mutasi(x = NA, y = NA, z = NA)`', 'B', '5.4.1', ''),
    ('5.4.1', 'peringatan "Values from `value` are not uniquely identified"', 'peringatan yang sama', 'C', '5.4.1 (nilai ganda)', 'Peringatan tidyr tetap berbahasa Inggris, dan petunjuk di dalamnya memakai nama fungsi asli.'),
    ('5.4.1', '`group_by(id, measurement) \\|> summarize(n = n(), .groups = "drop") \\|> filter(n > 1)`', '`trn_gabung_kelompok(...) \\|> trn_statistik_ringkas(n = frm_jumlah(), .hasil_kelompok = "drop") \\|> trn_filter(n > 1)`', 'B', '5.4.1 (nilai ganda)', ''),
    ('5.4.1', '`values_fn = sum` (disebut oleh pesan peringatan)', '`fungsi_nilai = sum`', 'B', '5.4.1 (nilai ganda)', ''),
    ('5.5', '`vignette("pivot", package = "tidyr")`', 'tidak berubah', 'A', '-', 'Dokumentasi tidyr berbahasa Inggris.'),
]
