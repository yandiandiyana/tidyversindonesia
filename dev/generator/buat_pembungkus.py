#!/usr/bin/env python3
"""Generator pembungkus tidyversindonesia (alat bantu pengembang).

Pengguna paket TIDAK perlu menjalankan berkas ini. Ia membaca daftar formal
fungsi asli yang sudah diverifikasi (formals_terverifikasi.txt, hasil
dev/audit-formals.R di komputer pengguna) lalu menulis:
  R/kamus.R, R/inp.R, R/rpi.R, R/trn.R, R/frm.R, NAMESPACE,
  dev/kamus_fase3a.md (ringkasan untuk ditinjau).
Urutan formal fungsi lokal selalu sama dengan fungsi asli (aturan R1).
"""
import os
import re
import sys
import textwrap

AKAR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
FORMALS_BERKAS = os.path.join(os.path.dirname(__file__), 'formals_terverifikasi.txt')

# --------------------------------------------------------------------------
# 1. Formal fungsi asli (terverifikasi)
# --------------------------------------------------------------------------
def baca_formals(path):
    hasil = {}
    for baris in open(path, encoding='utf-8'):
        m = re.match(r'^([A-Za-z0-9_.]+)::([A-Za-z0-9_.]+): ?(.*)$', baris.rstrip('\n'))
        if m and '<TIDAK' not in m.group(3):
            hasil[m.group(1) + '::' + m.group(2)] = m.group(3).split()
    return hasil

FORMALS = baca_formals(FORMALS_BERKAS)

# --------------------------------------------------------------------------
# 2. Kamus konsep argumen: nama asli -> nama lokal (satu istilah per konsep)
#    Argumen yang tidak ada di sini dibiarkan sama (dicatat "sama dengan asli").
# --------------------------------------------------------------------------
KONSEP = {
    # dplyr
    '.by': '.berdasarkan', '.keep': '.simpan', '.keep_all': '.simpan_semua',
    '.before': '.sebelum', '.after': '.setelah', '.groups': '.hasil_kelompok',
    '.preserve': '.pertahankan', '.add': '.tambah', '.drop': '.buang_kosong',
    '.by_group': '.per_kelompok', 'wt': 'bobot', 'sort': 'urut', 'name': 'nama',
    'var': 'variabel', 'prop': 'proporsi', 'by': 'berdasarkan',
    'with_ties': 'dengan_seri', 'na_rm': 'buang_na', 'order_by': 'urutan_oleh',
    'weight_by': 'bobot_oleh', 'replace': 'dengan_pengembalian',
    'condition': 'kondisi', 'true': 'benar', 'false': 'salah', 'missing': 'hilang',
    'width': 'lebar',
    # tidyselect
    'match': 'cocok', 'ignore.case': 'abaikan_kapital', 'vars': 'variabel',
    'prefix': 'awalan', 'range': 'rentang', 'suffix': 'akhiran', 'fn': 'fungsi',
    'offset': 'geser',
    # tidyr
    'cols': 'kolom', 'cols_vary': 'variasi_kolom', 'names_to': 'nama_ke',
    'names_prefix': 'awalan_nama', 'names_sep': 'pemisah_nama',
    'names_pattern': 'pola_nama', 'names_ptypes': 'ptype_nama',
    'names_transform': 'transformasi_nama', 'names_repair': 'perbaikan_nama',
    'values_to': 'nilai_ke', 'values_drop_na': 'buang_nilai_na',
    'values_ptypes': 'ptype_nilai', 'values_transform': 'transformasi_nilai',
    'id_cols': 'kolom_id', 'id_expand': 'perluas_id', 'names_from': 'nama_dari',
    'names_glue': 'templat_nama', 'names_sort': 'urutkan_nama',
    'names_vary': 'variasi_nama', 'names_expand': 'perluas_nama',
    'values_from': 'nilai_dari', 'values_fill': 'isi_nilai',
    'values_fn': 'fungsi_nilai', 'unused_fn': 'fungsi_tak_terpakai',
    # tibble
    '.rows': '.baris', '.name_repair': '.perbaikan_nama',
    # forcats
    'w': 'bobot', 'ordered': 'berurut',
    # umum
    'na.rm': 'buang_na',
}

# --------------------------------------------------------------------------
# 3. Deskripsi argumen (Indonesia). Yang tidak ada: kalimat generik yang jujur.
# --------------------------------------------------------------------------
DESK = {
    '.data': 'Tabel data.',
    'data': 'Tabel data.',
    'x': 'Tabel data.',
    '.by': 'Pengelompokan sementara untuk operasi ini; tidak mengubah struktur kelompok tabel.',
    '.preserve': 'Apakah struktur kelompok dipertahankan.',
    '.by_group': 'Apakah pengurutan dilakukan di dalam kelompok.',
    '.keep_all': 'Apakah semua kolom lain dipertahankan.',
    '.keep': 'Kolom yang dipertahankan: `"all"`, `"used"`, `"unused"`, atau `"none"`.',
    '.before': 'Kolom yang menjadi patokan; hasil diletakkan sebelum kolom ini.',
    '.after': 'Kolom yang menjadi patokan; hasil diletakkan setelah kolom ini.',
    '.groups': 'Struktur kelompok pada hasil.',
    '.add': 'Apakah kelompok ditambahkan ke kelompok yang sudah ada.',
    '.drop': 'Apakah kelompok kosong dibuang.',
    'wt': 'Bobot; bila diberikan, yang dijumlahkan adalah bobot, bukan jumlah baris.',
    'sort': 'Apakah hasil diurutkan menurun menurut jumlah.',
    'name': 'Nama kolom hasil.',
    'var': 'Kolom yang diambil, berupa nama atau posisi.',
    'n': 'Jumlah baris.',
    'prop': 'Proporsi baris, antara 0 dan 1.',
    'by': 'Pengelompokan sementara untuk operasi ini.',
    'with_ties': 'Apakah baris dengan nilai seri ikut disertakan.',
    'na_rm': 'Apakah nilai hilang diabaikan.',
    'order_by': 'Variabel yang dipakai untuk mengurutkan.',
    'weight_by': 'Bobot peluang pengambilan sampel.',
    'replace': 'Apakah sampel diambil dengan pengembalian.',
    'condition': 'Vektor logika yang menentukan pilihan.',
    'true': 'Nilai bila kondisi benar.',
    'false': 'Nilai bila kondisi salah.',
    'missing': 'Nilai bila kondisi `NA`.',
    'ptype': 'Prototipe tipe hasil.',
    'size': 'Ukuran hasil.',
    'match': 'Teks yang dicari.',
    'ignore.case': 'Apakah huruf besar dan kecil dianggap sama.',
    'vars': 'Daftar nama variabel; biasanya dibiarkan kosong sehingga diambil dari data yang sedang diproses.',
    'perl': 'Apakah ekspresi reguler gaya Perl dipakai.',
    'prefix': 'Awalan nama kolom.',
    'range': 'Rentang angka di belakang awalan.',
    'suffix': 'Akhiran nama kolom.',
    'width': 'Lebar angka, untuk menambahkan nol di depan.',
    'fn': 'Fungsi predikat yang mengembalikan `TRUE` atau `FALSE` untuk tiap kolom.',
    'offset': 'Geseran dari kolom terakhir.',
    'cols': 'Kolom yang dipanjangkan, ditulis dengan pemilihan kolom tidyselect.',
    'cols_vary': 'Urutan baris hasil bila beberapa kolom dipanjangkan.',
    'names_to': 'Nama kolom baru untuk nama-nama kolom lama.',
    'names_prefix': 'Ekspresi reguler awalan yang dibuang dari nama kolom.',
    'names_sep': 'Pemisah untuk memecah atau menyusun nama kolom.',
    'names_pattern': 'Ekspresi reguler untuk memecah nama kolom.',
    'names_ptypes': 'Prototipe tipe untuk kolom nama.',
    'names_transform': 'Fungsi yang diterapkan pada kolom nama.',
    'names_repair': 'Cara memperbaiki nama kolom hasil.',
    'values_to': 'Nama kolom baru untuk nilai.',
    'values_drop_na': 'Apakah baris bernilai `NA` dibuang.',
    'values_ptypes': 'Prototipe tipe untuk kolom nilai.',
    'values_transform': 'Fungsi yang diterapkan pada kolom nilai.',
    'id_cols': 'Kolom pengenal baris; bawaannya semua kolom selain `nama_dari` dan `nilai_dari`.',
    'id_expand': 'Apakah kombinasi pengenal yang tidak ada ditambahkan.',
    'names_from': 'Kolom yang nilainya menjadi nama kolom baru.',
    'names_glue': 'Templat glue untuk nama kolom baru.',
    'names_sort': 'Apakah kolom baru diurutkan menurut nama.',
    'names_vary': 'Urutan kolom baru bila ada beberapa `nama_dari` dan `nilai_dari`.',
    'names_expand': 'Apakah kombinasi nama yang tidak ada ditambahkan.',
    'values_from': 'Kolom yang nilainya mengisi kolom baru.',
    'values_fill': 'Nilai pengisi untuk sel yang hilang.',
    'values_fn': 'Fungsi untuk meringkas nilai yang berulang.',
    'unused_fn': 'Fungsi untuk meringkas kolom yang tidak dipakai.',
    '.rows': 'Jumlah baris.',
    '.name_repair': 'Cara memperbaiki nama kolom.',
    'f': 'Faktor atau vektor teks.',
    'w': 'Bobot untuk menghitung frekuensi.',
    'ordered': 'Apakah hasil berupa faktor berurutan.',
    'dat': 'Tabel data.',
}

# --------------------------------------------------------------------------
# 4. Spesifikasi fungsi
# --------------------------------------------------------------------------
DF_X = 'df <- inp_tibble(x = c(3, 1, 2, 2), g = c("a", "b", "a", "b"))'
DF_G = 'df <- inp_tibble(x = 1:4, g = c("a", "a", "b", "b"))'
TITIK_VERBA = 'Argumen lain, ditulis seperti pada [{paket}::{fungsi}()].'

SPECS = [
    # ---------------- inp_ ----------------
    dict(nama='inp_tibble', paket='tibble', fungsi='tibble', keluarga='inp',
         judul='Buat tibble dari kolom',
         intro='Kolom diberi nama oleh pengguna lewat `...`, dan kolom yang dibuat belakangan boleh merujuk kolom sebelumnya, sama seperti fungsi asli.',
         p={'...': 'Kolom, ditulis `nama = nilai`. Nama kolom buatan Anda tidak pernah diterjemahkan.'},
         ret='Sebuah tibble.',
         contoh=['inp_tibble(x = 1:3, y = x * 2)', '', '# Setara dengan kode standar:', 'tibble::tibble(x = 1:3, y = x * 2)']),
    dict(nama='inp_tribble', paket='tibble', fungsi='tribble', keluarga='inp',
         judul='Buat tibble baris demi baris',
         intro='Cocok untuk memasukkan data kecil secara manual: judul kolom ditulis dengan `~`, lalu nilai diisi baris demi baris.',
         p={'...': 'Judul kolom (ditulis `~nama`) diikuti nilai-nilainya, baris demi baris.'},
         ret='Sebuah tibble.',
         contoh=['inp_tribble(', '  ~nama, ~nilai,', '  "a", 1,', '  "b", 2', ')', '',
                 '# Setara dengan kode standar:', 'tibble::tribble(', '  ~nama, ~nilai,', '  "a", 1,', '  "b", 2', ')']),

    # ---------------- rpi_ ----------------
    dict(nama='rpi_panjang', paket='tidyr', fungsi='pivot_longer', keluarga='rpi',
         judul='Ubah data menjadi format panjang',
         intro='Nilai argumen (misalnya `".value"`) tidak diubah.',
         p={'...': TITIK_VERBA}, ret='Sebuah tabel data, sama seperti [tidyr::pivot_longer()].',
         contoh=['lebar <- inp_tibble(id = 1:2, a = c(1, 2), b = c(3, 4))',
                 'rpi_panjang(lebar, kolom = c(a, b), nama_ke = "variabel", nilai_ke = "nilai")',
                 'rpi_panjang(lebar, kolom = !id, nama_ke = "variabel", nilai_ke = "nilai")', '',
                 '# Setara dengan kode standar:',
                 'tidyr::pivot_longer(lebar, cols = c(a, b), names_to = "variabel",', '                    values_to = "nilai")']),
    dict(nama='rpi_lebar', paket='tidyr', fungsi='pivot_wider', keluarga='rpi',
         judul='Ubah data menjadi format lebar',
         intro='Kebalikan dari [rpi_panjang()].',
         p={'...': TITIK_VERBA}, ret='Sebuah tabel data, sama seperti [tidyr::pivot_wider()].',
         contoh=['panjang <- inp_tibble(', '  id = c(1, 1, 2, 2),', '  kunci = c("a", "b", "a", "b"),', '  nilai = 1:4', ')',
                 'rpi_lebar(panjang, nama_dari = kunci, nilai_dari = nilai)', '',
                 '# Setara dengan kode standar:', 'tidyr::pivot_wider(panjang, names_from = kunci, values_from = nilai)']),

    # ---------------- trn_ ----------------
    dict(nama='trn_filter', paket='dplyr', fungsi='filter', keluarga='trn',
         judul='Saring baris',
         intro='"Filter" adalah kata bahasa Indonesia, sehingga nama fungsi hanya mendapat awalan `trn_`.',
         p={'...': 'Kondisi penyaringan, ditulis seperti pada [dplyr::filter()].'},
         ret='Tabel data hasil penyaringan, sama seperti [dplyr::filter()].',
         contoh=['df <- inp_tibble(x = 1:6, g = rep(c("a", "b"), 3))', 'trn_filter(df, x > 2)',
                 'trn_filter(df, x == max(x), .berdasarkan = g)', '', '# Setara dengan kode standar:',
                 'dplyr::filter(df, x == max(x), .by = g)']),
    dict(nama='trn_urutkan', paket='dplyr', fungsi='arrange', keluarga='trn',
         judul='Urutkan baris',
         intro='Untuk urutan menurun, bungkus kolom dengan [frm_turun()].',
         p={'...': 'Kolom pengurut, ditulis seperti pada [dplyr::arrange()].'},
         ret='Tabel data yang barisnya terurut, sama seperti [dplyr::arrange()].',
         contoh=['df <- inp_tibble(x = c(3, 1, 2), g = c("a", "b", "a"))', 'trn_urutkan(df, x)',
                 'trn_urutkan(df, frm_turun(x))', '', '# Setara dengan kode standar:', 'dplyr::arrange(df, dplyr::desc(x))']),
    dict(nama='trn_unik', paket='dplyr', fungsi='distinct', keluarga='trn',
         judul='Ambil baris unik',
         p={'...': 'Kolom yang dipakai untuk menentukan keunikan, ditulis seperti pada [dplyr::distinct()].'},
         ret='Tabel data berisi baris unik, sama seperti [dplyr::distinct()].',
         contoh=['df <- inp_tibble(g = c("a", "b", "a"), x = 1:3)', 'trn_unik(df, g)', 'trn_unik(df, g, .simpan_semua = TRUE)', '',
                 '# Setara dengan kode standar:', 'dplyr::distinct(df, g, .keep_all = TRUE)']),
    dict(nama='trn_hitung', paket='dplyr', fungsi='count', keluarga='trn',
         judul='Hitung baris per kelompok',
         intro='Argumen `nama`, `urut`, dan `bobot` bersifat khusus. Karena `...` dapat memuat kolom buatan, menulis `nama = ...` berarti mengisi argumen `nama`, sama seperti `name = ...` pada fungsi asli.',
         p={'...': 'Variabel pengelompok, ditulis seperti pada [dplyr::count()].'},
         ret='Tabel data berisi jumlah per kelompok, sama seperti [dplyr::count()].',
         contoh=['df <- inp_tibble(g = c("a", "b", "a"), x = 1:3)', 'trn_hitung(df, g)', 'trn_hitung(df, g, urut = TRUE, nama = "banyak")', '',
                 '# Setara dengan kode standar:', 'dplyr::count(df, g, sort = TRUE, name = "banyak")']),
    dict(nama='trn_mutasi', paket='dplyr', fungsi='mutate', keluarga='trn',
         judul='Tambah atau ubah kolom',
         intro='"Mutasi" untuk *mutate*. Generik `dplyr::mutate()` hanya berformal `(.data, ...)`; `.by`, `.keep`, `.before`, dan `.after` adalah formal metodenya dan diteruskan lewat `...`.',
         melalui_titik=['.by', '.keep', '.before', '.after'],
         p={'...': 'Kolom baru atau yang diubah, ditulis `nama = ekspresi`. Nama kolom buatan Anda tidak pernah diterjemahkan.'},
         ret='Tabel data, sama seperti [dplyr::mutate()].',
         contoh=['df <- inp_tibble(x = 1:3, g = c("a", "b", "a"))', 'trn_mutasi(df, y = x * 2, .setelah = x)', '',
                 '# Setara dengan kode standar:', 'dplyr::mutate(df, y = x * 2, .after = x)']),
    dict(nama='trn_pilih', paket='dplyr', fungsi='select', keluarga='trn',
         judul='Pilih kolom',
         p={'...': 'Kolom yang dipilih. Dapat memakai pembantu `frm_` seperti [frm_diawali()].'},
         ret='Tabel data berisi kolom terpilih, sama seperti [dplyr::select()].',
         contoh=['df <- inp_tibble(x = 1:2, y = 3:4, z = 5:6)', 'trn_pilih(df, x, z)', 'trn_pilih(df, !y)', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, x, z)']),
    dict(nama='trn_ubah_nama', paket='dplyr', fungsi='rename', keluarga='trn',
         judul='Ubah nama kolom',
         p={'...': 'Pasangan `nama_baru = nama_lama`.'},
         ret='Tabel data dengan nama kolom baru, sama seperti [dplyr::rename()].',
         contoh=['df <- inp_tibble(x = 1:2, y = 3:4)', 'trn_ubah_nama(df, baru = x)', '', '# Setara dengan kode standar:', 'dplyr::rename(df, baru = x)']),
    dict(nama='trn_pindah', paket='dplyr', fungsi='relocate', keluarga='trn',
         judul='Pindahkan kolom',
         p={'...': 'Kolom yang dipindahkan.'},
         ret='Tabel data dengan urutan kolom baru, sama seperti [dplyr::relocate()].',
         contoh=['df <- inp_tibble(x = 1:2, y = 3:4, z = 5:6)', 'trn_pindah(df, z, .sebelum = x)', '', '# Setara dengan kode standar:',
                 'dplyr::relocate(df, z, .before = x)']),
    dict(nama='trn_tarik', paket='dplyr', fungsi='pull', keluarga='trn',
         judul='Tarik satu kolom menjadi vektor',
         p={'...': 'Argumen lain, diteruskan apa adanya ke [dplyr::pull()].', 'name': 'Kolom yang dipakai sebagai nama elemen vektor hasil.'},
         ret='Sebuah vektor, sama seperti [dplyr::pull()].',
         contoh=['df <- inp_tibble(x = 1:3, g = c("a", "b", "c"))', 'trn_tarik(df, x)', 'trn_tarik(df, x, nama = g)', '',
                 '# Setara dengan kode standar:', 'dplyr::pull(df, x, name = g)']),
    dict(nama='trn_gabung_kelompok', paket='dplyr', fungsi='group_by', keluarga='trn',
         judul='Kelompokkan baris',
         p={'...': 'Variabel pengelompok.'},
         ret='Tabel data berkelompok, sama seperti [dplyr::group_by()].',
         contoh=[DF_G, 'trn_gabung_kelompok(df, g)', '', '# Setara dengan kode standar:', 'dplyr::group_by(df, g)']),
    dict(nama='trn_lepas_kelompok', paket='dplyr', fungsi='ungroup', keluarga='trn',
         judul='Lepaskan pengelompokan',
         p={'x': 'Tabel data berkelompok.', '...': 'Variabel yang dilepas dari pengelompokan; bila kosong, semua dilepas.'},
         ret='Tabel data tanpa pengelompokan, sama seperti [dplyr::ungroup()].',
         contoh=[DF_G, 'df |> trn_gabung_kelompok(g) |> trn_lepas_kelompok()', '', '# Setara dengan kode standar:',
                 'dplyr::ungroup(dplyr::group_by(df, g))']),
    dict(nama='trn_statistik_ringkas', paket='dplyr', fungsi='summarise', keluarga='trn',
         judul='Hitung statistik ringkas',
         intro='Juga dikenal sebagai `summarize()`.',
         p={'...': 'Ringkasan, ditulis `nama = ekspresi`. Nama kolom buatan Anda tidak pernah diterjemahkan.'},
         ret='Tabel data, sama seperti [dplyr::summarise()].',
         contoh=['df <- inp_tibble(x = c(1, 2, 3, 4), g = c("a", "a", "b", "b"))',
                 'df |>', '  trn_gabung_kelompok(g) |>', '  trn_statistik_ringkas(rerata = dsr_rerata(x))', '',
                 '# Setara dengan kode standar:', 'df |>', '  dplyr::group_by(g) |>', '  dplyr::summarise(rerata = mean(x))']),
    dict(nama='trn_iris', paket='dplyr', fungsi='slice', keluarga='trn',
         judul='Ambil baris menurut posisi',
         intro='"Iris" untuk *slice*.',
         p={'...': 'Posisi baris yang diambil.'}, ret='Tabel data, sama seperti [dplyr::slice()].',
         contoh=[DF_G, 'trn_iris(df, 1:2)', 'trn_iris(df, 1, .berdasarkan = g)', '', '# Setara dengan kode standar:', 'dplyr::slice(df, 1, .by = g)']),
    dict(nama='trn_iris_kepala', paket='dplyr', fungsi='slice_head', keluarga='trn',
         judul='Ambil baris pertama',
         p={'...': 'Tidak dipakai; harus kosong.'}, ret='Tabel data, sama seperti [dplyr::slice_head()].',
         contoh=[DF_G, 'trn_iris_kepala(df, n = 2)', 'trn_iris_kepala(df, n = 1, berdasarkan = g)', '', '# Setara dengan kode standar:',
                 'dplyr::slice_head(df, n = 1, by = g)']),
    dict(nama='trn_iris_ekor', paket='dplyr', fungsi='slice_tail', keluarga='trn',
         judul='Ambil baris terakhir',
         p={'...': 'Tidak dipakai; harus kosong.'}, ret='Tabel data, sama seperti [dplyr::slice_tail()].',
         contoh=[DF_G, 'trn_iris_ekor(df, n = 2)', 'trn_iris_ekor(df, n = 1, berdasarkan = g)', '', '# Setara dengan kode standar:',
                 'dplyr::slice_tail(df, n = 1, by = g)']),
    dict(nama='trn_iris_min', paket='dplyr', fungsi='slice_min', keluarga='trn',
         judul='Ambil baris dengan nilai terkecil',
         p={'...': 'Tidak dipakai; harus kosong.'}, ret='Tabel data, sama seperti [dplyr::slice_min()].',
         contoh=[DF_G, 'trn_iris_min(df, x, n = 2)', '', '# Setara dengan kode standar:', 'dplyr::slice_min(df, x, n = 2)']),
    dict(nama='trn_iris_maks', paket='dplyr', fungsi='slice_max', keluarga='trn',
         judul='Ambil baris dengan nilai terbesar',
         p={'...': 'Tidak dipakai; harus kosong.'}, ret='Tabel data, sama seperti [dplyr::slice_max()].',
         contoh=[DF_G, 'trn_iris_maks(df, x, n = 2)', '', '# Setara dengan kode standar:', 'dplyr::slice_max(df, x, n = 2)']),
    dict(nama='trn_iris_acak', paket='dplyr', fungsi='slice_sample', keluarga='trn',
         judul='Ambil baris secara acak',
         p={'...': 'Tidak dipakai; harus kosong.'}, ret='Tabel data, sama seperti [dplyr::slice_sample()].',
         contoh=[DF_G, 'set.seed(1)', 'trn_iris_acak(df, n = 2)', '', '# Setara dengan kode standar:', 'set.seed(1)',
                 'dplyr::slice_sample(df, n = 2)']),
    dict(nama='trn_rapikan_nama', paket='janitor', fungsi='clean_names', keluarga='trn', opsional=True,
         judul='Rapikan nama kolom',
         intro='Mengubah nama kolom menjadi huruf kecil dengan garis bawah. Fungsi ini memerlukan paket janitor, yang dipasang terpisah.',
         p={'...': 'Argumen lain, diteruskan apa adanya ke [janitor::clean_names()].'},
         ret='Tabel data dengan nama kolom yang dirapikan, sama seperti [janitor::clean_names()].',
         contoh=['if (requireNamespace("janitor", quietly = TRUE)) {',
                 '  df <- inp_tibble(`Nama Kolom` = 1, `Nilai Ke-2` = 2)', '  trn_rapikan_nama(df)', '', '  # Setara dengan kode standar:',
                 '  janitor::clean_names(df)', '}']),

    # ---------------- frm_ ----------------
    dict(nama='frm_diawali', paket='tidyselect', fungsi='starts_with', keluarga='frm',
         judul='Pilih kolom yang namanya diawali teks tertentu',
         intro='Dipakai di dalam fungsi yang memilih kolom, misalnya [trn_pilih()] dan argumen `kolom` pada [rpi_panjang()].',
         ret='Posisi kolom yang cocok, sama seperti [tidyselect::starts_with()].',
         contoh=['df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)', 'trn_pilih(df, frm_diawali("awal"))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::starts_with("awal"))']),
    dict(nama='frm_diakhiri', paket='tidyselect', fungsi='ends_with', keluarga='frm',
         judul='Pilih kolom yang namanya diakhiri teks tertentu',
         ret='Posisi kolom yang cocok, sama seperti [tidyselect::ends_with()].',
         contoh=['df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)', 'trn_pilih(df, frm_diakhiri("_a"))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::ends_with("_a"))']),
    dict(nama='frm_memuat', paket='tidyselect', fungsi='contains', keluarga='frm',
         judul='Pilih kolom yang namanya memuat teks tertentu',
         ret='Posisi kolom yang cocok, sama seperti [tidyselect::contains()].',
         contoh=['df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)', 'trn_pilih(df, frm_memuat("wal"))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::contains("wal"))']),
    dict(nama='frm_cocok', paket='tidyselect', fungsi='matches', keluarga='frm',
         judul='Pilih kolom yang namanya cocok dengan ekspresi reguler',
         ret='Posisi kolom yang cocok, sama seperti [tidyselect::matches()].',
         contoh=['df <- inp_tibble(awal_a = 1, awal_b = 2, lain_a = 3)', 'trn_pilih(df, frm_cocok("^awal"))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::matches("^awal"))']),
    dict(nama='frm_rentang_angka', paket='tidyselect', fungsi='num_range', keluarga='frm',
         judul='Pilih kolom berawalan dengan angka berurutan',
         p={'width': 'Lebar angka, untuk menambahkan nol di depan.'},
         ret='Posisi kolom yang cocok, sama seperti [tidyselect::num_range()].',
         contoh=['df <- inp_tibble(x1 = 1, x2 = 2, x3 = 3)', 'trn_pilih(df, frm_rentang_angka("x", 1:2))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::num_range("x", 1:2))']),
    dict(nama='frm_semua', paket='tidyselect', fungsi='everything', keluarga='frm',
         judul='Pilih semua kolom',
         intro='Berguna untuk memindahkan beberapa kolom ke depan, lalu menyertakan sisanya.',
         ret='Posisi semua kolom, sama seperti [tidyselect::everything()].',
         contoh=['df <- inp_tibble(x = 1, y = 2, z = 3)', 'trn_pilih(df, z, frm_semua())', '', '# Setara dengan kode standar:',
                 'dplyr::select(df, z, dplyr::everything())']),
    dict(nama='frm_di_mana', paket='tidyselect', fungsi='where', keluarga='frm',
         judul='Pilih kolom menurut sebuah fungsi predikat',
         ret='Posisi kolom yang lolos predikat, sama seperti [tidyselect::where()].',
         contoh=['df <- inp_tibble(x = 1, g = "a", y = 2)', 'trn_pilih(df, frm_di_mana(is.numeric))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::where(is.numeric))']),
    dict(nama='frm_salah_satu', paket='tidyselect', fungsi='any_of', keluarga='frm',
         judul='Pilih kolom dari vektor nama, abaikan yang tidak ada',
         p={'x': 'Vektor teks berisi nama kolom.', '...': 'Tidak dipakai; harus kosong.'},
         ret='Posisi kolom yang ada, sama seperti [tidyselect::any_of()].',
         contoh=['df <- inp_tibble(awal_a = 1, awal_b = 2)', 'trn_pilih(df, frm_salah_satu(c("awal_a", "tidak_ada")))', '',
                 '# Setara dengan kode standar:', 'dplyr::select(df, dplyr::any_of(c("awal_a", "tidak_ada")))']),
    dict(nama='frm_turun', paket='dplyr', fungsi='desc', keluarga='frm',
         judul='Tandai urutan menurun',
         intro='Dipakai di dalam [trn_urutkan()].',
         p={'x': 'Vektor atau kolom yang diurutkan menurun.'},
         ret='Vektor yang dapat dipakai untuk mengurutkan menurun, sama seperti [dplyr::desc()].',
         contoh=['df <- inp_tibble(x = c(1, 3, 2))', 'trn_urutkan(df, frm_turun(x))', '', '# Setara dengan kode standar:',
                 'dplyr::arrange(df, dplyr::desc(x))']),
    dict(nama='frm_jumlah', paket='dplyr', fungsi='n', keluarga='frm',
         judul='Jumlah baris dalam kelompok saat ini',
         intro='Dipakai di dalam [trn_statistik_ringkas()] dan [trn_mutasi()].',
         p={'...': 'Tidak dipakai; harus kosong.'},
         ret='Satu bilangan bulat, sama seperti [dplyr::n()].',
         contoh=[DF_G, 'df |>', '  trn_gabung_kelompok(g) |>', '  trn_statistik_ringkas(banyak = frm_jumlah())', '',
                 '# Setara dengan kode standar:', 'df |>', '  dplyr::group_by(g) |>', '  dplyr::summarise(banyak = dplyr::n())']),
    dict(nama='frm_jika_lain', paket='dplyr', fungsi='if_else', keluarga='frm',
         judul='Pilih nilai menurut kondisi',
         ov={'size': 'ukuran_keluaran'},
         p={'...': 'Tidak dipakai; harus kosong.'},
         ret='Vektor hasil, sama seperti [dplyr::if_else()].',
         contoh=['df <- inp_tibble(x = c(1, 5, 3))', 'trn_mutasi(df, ukuran = frm_jika_lain(x > 2, "besar", "kecil"))', '',
                 '# Setara dengan kode standar:', 'dplyr::mutate(df, ukuran = dplyr::if_else(x > 2, "besar", "kecil"))']),
    dict(nama='frm_faktor_frekuensi', paket='forcats', fungsi='fct_infreq', keluarga='frm', opsional=True,
         judul='Urutkan level faktor menurut frekuensi',
         intro='Dipakai di dalam [grf_estetika()] untuk mengurutkan batang. Fungsi ini memerlukan paket forcats, yang dipasang terpisah.',
         ret='Sebuah faktor, sama seperti [forcats::fct_infreq()].',
         contoh=['if (requireNamespace("forcats", quietly = TRUE)) {', '  frm_faktor_frekuensi(c("a", "b", "b", "c", "c", "c"))', '',
                 '  # Setara dengan kode standar:', '  forcats::fct_infreq(c("a", "b", "b", "c", "c", "c"))', '}']),
]

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from spec_imp import SPECS_IMP, KONSEP_IMP, DESK_IMP  # noqa: E402
from spec_grf import SPECS_GRF, KONSEP_GRF, DESK_GRF  # noqa: E402
from spec_dsr import SPECS_DSR, KONSEP_DSR, DESK_DSR  # noqa: E402

KONSEP.update(KONSEP_IMP)
KONSEP.update(KONSEP_GRF)
KONSEP.update(KONSEP_DSR)
DESK.update(DESK_IMP)
DESK.update(DESK_GRF)
DESK.update(DESK_DSR)
SPECS = SPECS_IMP + SPECS_GRF + SPECS_DSR + SPECS

# Nama fungsi yang masih dikelola tangan (belum dimigrasikan ke generator).
MANUAL = []

# --------------------------------------------------------------------------
# 5. Pembangkit kode
# --------------------------------------------------------------------------
def r_vec(items, kutip=True):
    return 'c(' + ', '.join('"%s"' % x if kutip else x for x in items) + ')'

def turunkan(spec):
    """Hitung formal lokal, pemetaan argumen, dan daftar `sama` untuk satu spesifikasi."""
    kunci = spec['paket'] + '::' + spec['fungsi']
    if kunci not in FORMALS:
        sys.exit('Formal terverifikasi tidak ada untuk ' + kunci)
    asli = FORMALS[kunci]
    ov = spec.get('ov', {})
    extra = spec.get('melalui_titik', [])
    setara = spec.get('setara', {})

    def lokal_dari(a):
        return ov.get(a, KONSEP.get(a, a))

    urut_asli = [a for a in asli if a != '...' and a not in setara]
    semua_asli = urut_asli + [a for a in extra if a not in urut_asli]
    argumen = {}
    sama = []
    for a in semua_asli:
        l = lokal_dari(a)
        if l == a:
            sama.append(a)
        else:
            argumen[l] = a
    # formal lokal berurutan: formal asli (dengan ... di tempatnya), lalu tambahan
    formal = []
    for a in asli:
        if a in setara:
            continue
        formal.append('...' if a == '...' else lokal_dari(a))
    formal += [lokal_dari(a) for a in extra if a not in urut_asli]
    if '...' not in formal:
        formal.append('...')
    if len(set(formal)) != len(formal):
        sys.exit('Nama lokal ganda pada ' + spec['nama'] + ': ' + str(formal))
    # sama yang berasal dari melalui_titik tidak mungkin (harus diterjemahkan atau sama)
    return dict(asli=asli, formal=formal, argumen=argumen, sama=sama, extra=extra, setara=setara, lokal_dari=lokal_dari)

def bungkus_roxy(teks, awal="#' ", lanjut="#'   ", lebar=78):
    baris = textwrap.wrap(teks, width=lebar - len(awal), subsequent_indent='  ',
                          break_long_words=False, break_on_hyphens=False)
    return [awal + baris[0]] + [("#' " + b) for b in baris[1:]] if baris else [awal.rstrip()]

def roxy_param(spec, d, nama_lokal):
    p_spec = spec.get('p', {})
    if nama_lokal == '...':
        asal = '...'
        if '...' in d['asli']:
            bawaan = 'Argumen lain, diteruskan apa adanya ke [{paket}::{fungsi}()].'
        else:
            bawaan = ('Tempat argumen berbahasa Inggris (nama asli), yang diteruskan '
                      'apa adanya ke [{paket}::{fungsi}()].')
        teks = p_spec.get('...', bawaan)
        teks = teks.format(paket=spec['paket'], fungsi=spec['fungsi'])
        return ["#' @param ... " + teks] if len(teks) < 60 else bungkus_param('...', teks)
    # cari nama asli
    if nama_lokal in d['argumen']:
        asli = d['argumen'][nama_lokal]
        penutup = ' Asli: `%s`.' % asli
    else:
        asli = nama_lokal
        penutup = ' Sama dengan asli: `%s`.' % asli
    teks = p_spec.get(asli, DESK.get(asli, 'Padanan argumen `%s` pada [%s::%s()]; lihat dokumentasi fungsi asli.' % (asli, spec['paket'], spec['fungsi'])))
    return bungkus_param(nama_lokal, teks + penutup)

def bungkus_param(nama, teks):
    kepala = "#' @param %s " % nama
    isi = textwrap.wrap(kepala[3:] + teks, width=76, subsequent_indent='  ',
                        break_long_words=False, break_on_hyphens=False)
    hasil = ["#' " + isi[0]]
    hasil += ["#'   " + b.strip() for b in isi[1:]]
    return hasil

def bangun_roxy(spec, d):
    L = []
    L.append("#' " + spec['judul'])
    L.append("#'")
    intro = ('Versi Bahasa Indonesia dari [%s::%s()]. Hanya nama fungsi dan nama argumen yang '
             'diterjemahkan; perilaku dan nilai argumen sama dengan fungsi asli.' % (spec['paket'], spec['fungsi']))
    if spec.get('intro'):
        intro += ' ' + spec['intro']
    for b in textwrap.wrap(intro, width=75, break_long_words=False, break_on_hyphens=False):
        L.append("#' " + b)
    L.append("#'")
    for f in d['formal']:
        L += roxy_param(spec, d, f)
    L.append("#'")
    for i, b in enumerate(textwrap.wrap('@return ' + spec['ret'], width=75, break_long_words=False, break_on_hyphens=False)):
        L.append("#' " + (b if i == 0 else '  ' + b.strip()))
    L.append("#'")
    L.append("#' @section Padanan dengan fungsi asli:")
    ekstra = ''
    if spec.get('opsional'):
        ekstra = ' Paket %s tidak otomatis terpasang; bila belum ada, fungsi ini memberi pesan yang menjelaskan cara memasangnya.' % spec['paket']
    for b in textwrap.wrap('`%s()` memanggil [%s::%s()].%s' % (spec['nama'], spec['paket'], spec['fungsi'], ekstra),
                           width=75, break_long_words=False, break_on_hyphens=False):
        L.append("#' " + b)
    L.append("#'")
    L.append("#' @examples")
    for c in spec['contoh']:
        L.append(("#' " + c) if c else "#'")
    L.append("#' @export")
    return L

def bangun_fungsi(spec, d):
    kepala = spec['nama'] + ' <- function('
    isi = ', '.join(d['formal'])
    baris = textwrap.wrap(isi, width=78 - len(kepala), break_long_words=False, break_on_hyphens=False)
    teks = kepala + baris[0]
    for b in baris[1:]:
        teks += '\n' + ' ' * len(kepala) + b
    teks += ') {\n'
    teks += '  .panggilan <- sys.call()\n'
    teks += '  .lingkungan <- parent.frame()\n'
    if spec.get('tak_terlihat'):
        teks += '  invisible(.panggil_asli("%s", .panggilan, .lingkungan))\n' % spec['nama']
    else:
        teks += '  .panggil_asli("%s", .panggilan, .lingkungan)\n' % spec['nama']
    teks += '}\n'
    return teks

def bangun_kamus(spec, d):
    t = '  %s = .spec(\n    "%s", "%s"' % (spec['nama'], spec['paket'], spec['fungsi'])
    if d['argumen']:
        butir = ['%s = "%s"' % (l, a) for l, a in d['argumen'].items()]
        t += ',\n    argumen = c(\n'
        baris, cur = [], ''
        for b in butir:
            if len(cur) + len(b) + 2 > 62 and cur:
                baris.append(cur.rstrip()); cur = ''
            cur += b + ', '
        baris.append(cur.rstrip().rstrip(','))
        t += '\n'.join('      ' + b for b in baris) + '\n    )'
    if d['sama']:
        t += ',\n    sama = ' + r_vec(d['sama'])
    if d['extra']:
        t += ',\n    melalui_titik = ' + r_vec(d['extra'])
    if d['setara']:
        t += ',\n    setara = c(\n' + ',\n'.join('      %s = "%s"' % (k, v) for k, v in d['setara'].items()) + '\n    )'
    if spec.get('estetika'):
        t += ',\n    estetika = TRUE'
    if spec.get('opsional'):
        t += ',\n    opsional = TRUE'
    t += '\n  )'
    return t

def ambil_manual():
    """Ambil entri kamus yang dikelola tangan dari R/kamus.R saat ini (atau berkas simpanan)."""
    simpanan = os.path.join(os.path.dirname(__file__), 'kamus_manual.R.txt')
    if os.path.exists(simpanan):
        return open(simpanan, encoding='utf-8').read().strip()
    teks = open(os.path.join(AKAR, 'R', 'kamus.R'), encoding='utf-8').read()
    bagian = []
    for nama in MANUAL:
        m = re.search(r'^  %s = \.spec\(.*?^  \),?\n' % re.escape(nama), teks, re.S | re.M)
        if not m:
            sys.exit('Entri manual tidak ditemukan di kamus.R: ' + nama)
        bagian.append(m.group(0).rstrip().rstrip(','))
    hasil = ',\n\n'.join(bagian)
    open(simpanan, 'w', encoding='utf-8').write(hasil + '\n')
    return hasil

KEPALA_KAMUS = '''# Kamus fungsi ---------------------------------------------------------------
#
# BERKAS INI DIHASILKAN oleh dev/generator/buat_pembungkus.py (kecuali entri
# yang ditandai "dikelola tangan"). Sumber tunggal pemetaan fungsi dan
# argumen: lokal -> asli.
#
# Daftar argumen formal fungsi asli berasal dari audit di komputer pengguna
# (dev/generator/formals_terverifikasi.txt) dan DIPERIKSA OTOMATIS oleh
# tests/testthat/test-drift.R terhadap `formals()` paket yang terpasang.
#
# Isi tiap entri (lihat `.spec()`):
#   paket, fungsi  : fungsi asli, mis. "dplyr", "filter".
#   argumen        : vektor bernama, nama lokal = nama asli.
#   sama           : argumen asli yang namanya tidak diubah.
#   estetika       : TRUE bila nama estetika (warna, isian, ...) di `...`
#                    ikut diterjemahkan (lihat `.estetika`).
#   melalui_titik  : nama asli yang diterima lewat `...` fungsi asli, bukan
#                    argumen formal (mis. `x` dan `y` pada labs()).
#   opsional       : TRUE bila paket asli ada di Suggests dan dipasang terpisah.
#   setara         : vektor bernama, sinonim = nama asli baku (mis. outlier.color =
#                    "outlier.colour"). Sinonim diterima apa adanya dan menimbulkan
#                    konflik bila diberikan bersama nama lokalnya.

# Estetika: nama lokal -> nama asli. Elemen pertama adalah nama baku;
# elemen lain adalah sinonim yang menimbulkan konflik bila diberikan bersamaan.
.estetika <- list(
  warna           = c("colour", "color"),
  isian           = "fill",
  bentuk          = "shape",
  ukuran          = "size",
  alfa            = "alpha",
  tipe_garis      = "linetype",
  ketebalan_garis = "linewidth",
  kelompok        = "group"
)

.spec <- function(paket, fungsi, argumen = character(), sama = character(),
                  estetika = FALSE, melalui_titik = character(),
                  opsional = FALSE, setara = character()) {
  list(
    paket = paket, fungsi = fungsi, argumen = argumen, sama = sama,
    estetika = estetika, melalui_titik = melalui_titik, opsional = opsional,
    setara = setara
  )
}

.kamus_fungsi <- list(

  # dikelola tangan (belum dimigrasikan ke generator) -----------------------
'''

NAMA_BERKAS = {'imp': 'imp.R', 'inp': 'inp.R', 'rpi': 'rpi.R', 'trn': 'trn.R', 'frm': 'frm.R',
               'vis': 'vis.R', 'grf': 'grf.R', 'dsr': 'dsr.R', 'dtr': 'dtr.R'}

def main():
    turun = {s['nama']: turunkan(s) for s in SPECS}
    # kamus.R
    manual = ambil_manual() if MANUAL else ''
    generasi = ',\n\n'.join(bangun_kamus(s, turun[s['nama']]) for s in SPECS)
    if manual:
        kamus = KEPALA_KAMUS + manual + ',\n\n  # dihasilkan generator ----------------------------------------------------\n\n' + generasi + '\n)\n'
    else:
        kamus = KEPALA_KAMUS.replace('  # dikelola tangan (belum dimigrasikan ke generator) -----------------------\n', '  # dihasilkan generator ----------------------------------------------------\n') + '\n' + generasi + '\n)\n'
    open(os.path.join(AKAR, 'R', 'kamus.R'), 'w', encoding='utf-8').write(kamus)
    # berkas fungsi per keluarga
    per = {}
    for s in SPECS:
        per.setdefault(s['keluarga'], []).append(s)
    for kel, daftar in per.items():
        potongan = []
        for s in daftar:
            d = turun[s['nama']]
            potongan.append('\n'.join(bangun_roxy(s, d)) + '\n' + bangun_fungsi(s, d))
        isi = '# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting\n# langsung; ubah spesifikasinya lalu jalankan ulang generator.\n\n' + '\n'.join(potongan)
        open(os.path.join(AKAR, 'R', NAMA_BERKAS[kel]), 'w', encoding='utf-8').write(isi)
    # NAMESPACE
    semua = sorted(MANUAL + [s['nama'] for s in SPECS])
    ns = '# Generated by roxygen2: do not edit by hand\n\n' + ''.join('export(%s)\n' % n for n in sorted(semua + ['imp_berkas_contoh', 'mobil_mpg', 'berlian', 'tabel1', 'tabel2', 'tabel3', 'tangga_lagu', 'tb_who', 'rumah_tangga', 'pengalaman_pasien', 'penerbangan']))
    open(os.path.join(AKAR, 'NAMESPACE'), 'w', encoding='utf-8').write(ns)
    # ringkasan untuk tinjauan
    md = ['# Kamus Phase 3 (ringkasan untuk ditinjau)', '',
          'Dihasilkan otomatis dari spesifikasi. Urutan argumen mengikuti hasil audit di komputer Anda.', '']
    for kel in ['imp', 'inp', 'rpi', 'trn', 'frm', 'vis', 'grf', 'dsr', 'dtr']:
        md.append('## Keluarga `%s_`' % kel)
        md.append('')
        md.append('| Fungsi lokal | Fungsi asli | Argumen lokal (asli) |')
        md.append('|---|---|---|')
        for s in per.get(kel, []):
            d = turun[s['nama']]
            arg = ', '.join('`%s` (`%s`)' % (l, a) for l, a in d['argumen'].items()) or '(tidak ada yang diterjemahkan)'
            opsi = ' (opsional)' if s.get('opsional') else ''
            md.append('| `%s()` | `%s::%s()`%s | %s |' % (s['nama'], s['paket'], s['fungsi'], opsi, arg))
        md.append('')
    open(os.path.join(AKAR, 'dev', 'kamus_fase3.md'), 'w', encoding='utf-8').write('\n'.join(md))
    print('Dihasilkan: %d fungsi (+%d manual), NAMESPACE: %d ekspor.' % (len(SPECS), len(MANUAL), len(semua)))

if __name__ == '__main__':
    main()
