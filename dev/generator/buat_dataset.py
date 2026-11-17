#!/usr/bin/env python3
"""Generator dataset tidyversindonesia (alat bantu pengembang).

Pengguna paket TIDAK perlu menjalankan berkas ini. Ia menulis:
  data-raw/bantu.R, data-raw/<dataset>.R, data-raw/semua.R,
  R/data.R (dokumentasi), tests/testthat/test-data-3d.R.
Skrip data-raw berhenti dengan galat bila data asli tidak sesuai harapan
(nama kolom, level, nilai), supaya perubahan data asli tidak lolos diam-diam.
Sumber struktur: dev/generator/audit_dataset_terverifikasi.txt.
"""
import os
import textwrap

AKAR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))

# ---------------------------------------------------------------------------
# Spesifikasi dataset: kolom = (nama asli, nama lokal, deskripsi)
# ---------------------------------------------------------------------------
MINGGU = [('wk%d' % i, 'minggu%d' % i) for i in range(1, 77)]

DATASETS = [
    dict(
        nama='mobil_mpg', paket='ggplot2', objek='mpg', baris=234,
        judul='Efisiensi bahan bakar mobil populer 1999-2008',
        deskripsi=('Data efisiensi bahan bakar 38 model mobil populer tahun 1999-2008. '
                   'Ini adalah versi Bahasa Indonesia dari dataset `mpg` pada paket ggplot2. '
                   'Nilai numerik tidak diubah; satuan tetap mil per galon (MPG).'),
        kolom=[
            ('manufacturer', 'produsen', 'Produsen mobil.'),
            ('model', 'model', 'Nama model mobil.'),
            ('displ', 'kapasitas_mesin', 'Kapasitas mesin dalam liter.'),
            ('year', 'tahun', 'Tahun produksi mobil.'),
            ('cyl', 'silinder', 'Jumlah silinder mesin.'),
            ('trans', 'transmisi', 'Jenis transmisi: `otomatis(...)` atau `manual(...)`.'),
            ('drv', 'penggerak', 'Jenis sistem penggerak: `depan`, `belakang`, atau `4_roda`.'),
            ('cty', 'mpg_jalan_kota', 'Efisiensi bahan bakar di jalan kota, dalam mil per galon (MPG).'),
            ('hwy', 'mpg_jalan_raya', 'Efisiensi bahan bakar di jalan raya, dalam mil per galon (MPG).'),
            ('fl', 'bahan_bakar', 'Jenis bahan bakar: `bensin_premium`, `bensin_reguler`, `etanol`, `diesel`, atau `CNG`.'),
            ('class', 'kelas', 'Kelas mobil: `2_penumpang`, `kompak`, `ukuran_menengah`, `minivan`, `pikap`, `subkompak`, atau `suv`.'),
        ],
        nilai={
            'trans': [('auto(av)', 'otomatis(av)'), ('auto(l3)', 'otomatis(l3)'), ('auto(l4)', 'otomatis(l4)'),
                      ('auto(l5)', 'otomatis(l5)'), ('auto(l6)', 'otomatis(l6)'), ('auto(s4)', 'otomatis(s4)'),
                      ('auto(s5)', 'otomatis(s5)'), ('auto(s6)', 'otomatis(s6)'), ('manual(m5)', 'manual(m5)'),
                      ('manual(m6)', 'manual(m6)')],
            'drv': [('4', '4_roda'), ('f', 'depan'), ('r', 'belakang')],
            'fl': [('c', 'CNG'), ('d', 'diesel'), ('e', 'etanol'), ('p', 'bensin_premium'), ('r', 'bensin_reguler')],
            'class': [('2seater', '2_penumpang'), ('compact', 'kompak'), ('midsize', 'ukuran_menengah'),
                      ('minivan', 'minivan'), ('pickup', 'pikap'), ('subcompact', 'subkompak'), ('suv', 'suv')],
        },
        catatan_nilai='Awalan `auto` pada `transmisi` menjadi `otomatis`; kode di dalam kurung tidak diubah. Nama produsen dan model tidak diterjemahkan karena merupakan nama diri.',
        sumber=('Data asli dari EPA Fuel Economy Data, \\url{https://fueleconomy.gov/}, melalui `ggplot2::mpg`. '
                'Status lisensi data EPA belum diverifikasi.'),
        lihat='ggplot2::mpg',
    ),
    dict(
        nama='mobil', paket='datasets', objek='mtcars', baris=32,
        nama_baris='mobil',
        nama_baris_ket='Nama mobil. Asli: nama baris `mtcars`.',
        judul='Uji jalan mobil dari majalah Motor Trend',
        deskripsi=('Data diekstrak dari majalah Motor Trend US tahun 1974. Memuat efisiensi bahan bakar '
                   'dan 10 aspek desain dan kinerja 32 mobil (model 1973-74). Ini adalah versi Bahasa '
                   'Indonesia dari dataset `mtcars` pada paket datasets. Nilai numerik tidak diubah, dan '
                   'satuan tetap satuan AS (mil per galon, inci kubik, ribuan pon).'),
        kolom=[
            ('mpg', 'efisiensi_mpg', 'Efisiensi bahan bakar dalam mil per galon AS; makin besar makin hemat.'),
            ('cyl', 'silinder', 'Jumlah silinder.'),
            ('disp', 'kapasitas_mesin_in3', 'Kapasitas mesin dalam inci kubik. Berbeda dari `kapasitas_mesin` pada `mobil_mpg` yang berupa liter.'),
            ('hp', 'tenaga_kuda', 'Tenaga kuda kotor (gross horsepower).'),
            ('drat', 'rasio_gardan', 'Rasio gardan belakang (rear axle ratio).'),
            ('wt', 'berat_ribu_lb', 'Berat dalam ribuan pon.'),
            ('qsec', 'waktu_seperempat_mil', 'Waktu menempuh seperempat mil. Dokumentasi asli tidak menyebut satuannya.'),
            ('vs', 'bentuk_mesin', 'Bentuk mesin: 0 = V, 1 = lurus. Angka tidak diubah.'),
            ('am', 'kode_transmisi', 'Transmisi: 0 = otomatis, 1 = manual. Angka tidak diubah. Berbeda dari `transmisi` pada `mobil_mpg` yang berupa teks.'),
            ('gear', 'jumlah_gigi', 'Jumlah gigi maju.'),
            ('carb', 'jumlah_karburator', 'Jumlah karburator.'),
        ],
        nilai={}, catatan_nilai=None,
        beda=('Nama baris dipindahkan menjadi kolom pertama `mobil`, dan nama kolom diterjemahkan. '
              'Objek hasilnya berupa tibble (aslinya data frame dengan nama baris), seperti dataset '
              'lokal lainnya. Nilai, satuan, urutan baris, dan nilai hilang tidak diubah. Dataset asli '
              'tetap tersedia sebagai `datasets::mtcars`.'),
        catatan_asli=('Dokumentasi asli mencatat bahwa mesin rotari Mazda dikodekan sebagai enam silinder '
                      'lurus, mesin datar Porsche sebagai V, dan Mercedes 240D (diesel) tetap disertakan '
                      'agar sebanding dengan analisis terdahulu. Catatan ini tidak diubah.'),
        cara_penyediaan=('Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek ini dibuat '
                         'saat pertama kali dipakai dari `datasets::mtcars`, dengan perubahan berupa nama '
                         'kolom dan pemindahan nama baris menjadi kolom `mobil`. Paket datasets adalah '
                         'bagian dari R.'),
        contoh=['head(mobil)', '',
                'mobil |>',
                '  vis_ggplot(grf_estetika(x = berat_ribu_lb, y = efisiensi_mpg)) +',
                '  grf_geometrik_titik()'],
        sumber=('Henderson dan Velleman (1981), Building multiple regression models interactively. '
                'Biometrics, 37, 391-411, melalui `datasets::mtcars`.'),
        lihat='datasets::mtcars',
    ),
    dict(
        nama='berlian', paket='ggplot2', objek='diamonds', baris=53940,
        judul='Harga dan ciri berlian',
        deskripsi=('Harga dan ciri lebih dari 50.000 berlian. Ini adalah versi Bahasa Indonesia dari dataset '
                   '`diamonds` pada paket ggplot2. Nilai numerik tidak diubah.'),
        kolom=[
            ('carat', 'karat', 'Berat berlian dalam karat.'),
            ('cut', 'potongan', 'Kualitas potongan, faktor berurutan dari terburuk ke terbaik: `Cukup`, `Baik`, `Sangat Baik`, `Premium`, `Ideal`.'),
            ('color', 'warna', 'Warna berlian, faktor berurutan dari `D` (terbaik) sampai `J` (terburuk). Nilai tidak diubah.'),
            ('clarity', 'kejernihan', 'Kejernihan berlian, faktor berurutan dari `I1` (terburuk) sampai `IF` (terbaik). Nilai tidak diubah.'),
            ('depth', 'kedalaman_persen', 'Kedalaman total dalam persen, dihitung dari `kedalaman_mm` dibagi rerata `panjang_mm` dan `lebar_mm`.'),
            ('table', 'meja_persen', 'Lebar bagian atas (meja) berlian relatif terhadap titik terlebar, dalam persen.'),
            ('price', 'harga', 'Harga dalam dolar AS.'),
            ('x', 'panjang_mm', 'Panjang dalam milimeter.'),
            ('y', 'lebar_mm', 'Lebar dalam milimeter.'),
            ('z', 'kedalaman_mm', 'Kedalaman dalam milimeter.'),
        ],
        nilai={'cut': [('Fair', 'Cukup'), ('Good', 'Baik'), ('Very Good', 'Sangat Baik'), ('Premium', 'Premium'), ('Ideal', 'Ideal')]},
        catatan_nilai='Hanya level `cut` yang diterjemahkan; urutan level dan kelas faktor berurutan dipertahankan. Level `color` dan `clarity` adalah kode dan tidak diubah.',
        sumber='Data asli melalui `ggplot2::diamonds` (paket ggplot2, lisensi MIT). Asal data dan statusnya di luar paket belum diverifikasi.',
        lihat='ggplot2::diamonds',
    ),
    dict(
        nama='tabel1', paket='tidyr', objek='table1', baris=6,
        judul='Contoh tabel rapi: kasus dan populasi (bentuk 1)',
        deskripsi='Versi Bahasa Indonesia dari `table1` pada paket tidyr. Data yang sama tersedia dalam bentuk berbeda sebagai `tabel2` dan `tabel3`.',
        kolom=[('country', 'negara', 'Nama negara.'), ('year', 'tahun', 'Tahun.'),
               ('cases', 'kasus', 'Jumlah kasus.'), ('population', 'populasi', 'Jumlah penduduk.')],
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::table1` (paket tidyr, lisensi MIT). Asal data di luar paket belum diverifikasi.',
        lihat='tidyr::table1',
    ),
    dict(
        nama='tabel2', paket='tidyr', objek='table2', baris=12,
        judul='Contoh tabel: kasus dan populasi (bentuk 2)',
        deskripsi='Versi Bahasa Indonesia dari `table2` pada paket tidyr: satu baris per negara, tahun, dan jenis ukuran.',
        kolom=[('country', 'negara', 'Nama negara.'), ('year', 'tahun', 'Tahun.'),
               ('type', 'jenis', 'Jenis ukuran: `kasus` atau `populasi`.'), ('count', 'jumlah', 'Nilai ukuran.')],
        nilai={'type': [('cases', 'kasus'), ('population', 'populasi')]},
        catatan_nilai='Nilai `jenis` diterjemahkan dari `cases` dan `population` agar sejalan dengan nama kolom `tabel1` setelah `rpi_lebar()`.',
        sumber='Data asli melalui `tidyr::table2` (paket tidyr, lisensi MIT). Asal data di luar paket belum diverifikasi.',
        lihat='tidyr::table2',
    ),
    dict(
        nama='tabel3', paket='tidyr', objek='table3', baris=6,
        judul='Contoh tabel: kasus dan populasi (bentuk 3)',
        deskripsi='Versi Bahasa Indonesia dari `table3` pada paket tidyr: kasus dan populasi digabung dalam satu kolom teks.',
        kolom=[('country', 'negara', 'Nama negara.'), ('year', 'tahun', 'Tahun.'),
               ('rate', 'rasio', 'Kasus dan populasi sebagai satu teks berbentuk `kasus/populasi`.')],
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::table3` (paket tidyr, lisensi MIT). Asal data di luar paket belum diverifikasi.',
        lihat='tidyr::table3',
    ),
    dict(
        nama='tangga_lagu', paket='tidyr', objek='billboard', baris=317,
        judul='Peringkat lagu pada tangga lagu Billboard',
        deskripsi='Versi Bahasa Indonesia dari `billboard` pada paket tidyr: peringkat mingguan lagu pada tangga lagu Billboard. Kolom `minggu1` sampai `minggu76` adalah padanan `wk1` sampai `wk76`.',
        kolom=[('artist', 'artis', 'Nama artis.'), ('track', 'lagu', 'Judul lagu.'),
               ('date.entered', 'tanggal_masuk', 'Tanggal lagu pertama masuk tangga lagu.')] +
              [(a, b, None) for a, b in MINGGU],
        kolom_ringkas=('minggu1, ..., minggu76', 'Peringkat lagu pada minggu ke-n sejak masuk tangga lagu. Asli: `wk1`, ..., `wk76`.'),
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::billboard` (paket tidyr, lisensi MIT). Asal dan status hak data peringkat belum diverifikasi.',
        lihat='tidyr::billboard',
    ),
    dict(
        nama='tb_who', paket='tidyr', objek='who2', baris=7240,
        judul='Kasus tuberkulosis menurut WHO (kolom bersandi)',
        deskripsi=('Versi Bahasa Indonesia dari `who2` pada paket tidyr. Hanya kolom `negara` dan `tahun` yang diterjemahkan. '
                   'Kolom sisanya tetap bernama kode WHO berformat `<diagnosis>_<jenis kelamin>_<kelompok umur>` agar teknik '
                   'memecah nama kolom pada [rpi_panjang()] tetap sama.'),
        kolom=[('country', 'negara', 'Nama negara.'), ('year', 'tahun', 'Tahun.')],
        sisa_tetap=True,
        kolom_ringkas=('sp_m_014, ..., rel_f_65', 'Jumlah kasus menurut kode WHO. Nama kolom tidak diubah (56 kolom).'),
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::who2` (paket tidyr, lisensi MIT). Asal data di luar paket belum diverifikasi.',
        lihat='tidyr::who2',
    ),
    dict(
        nama='rumah_tangga', paket='tidyr', objek='household', baris=5,
        judul='Contoh data rumah tangga dengan dua anak',
        deskripsi='Versi Bahasa Indonesia dari `household` pada paket tidyr. Nama kolom berpola `<nilai>_<anak>` agar `pemisah_nama = "_"` dapat memecahnya.',
        kolom=[('family', 'keluarga', 'Nomor keluarga.'),
               ('dob_child1', 'lahir_anak1', 'Tanggal lahir anak pertama.'),
               ('dob_child2', 'lahir_anak2', 'Tanggal lahir anak kedua.'),
               ('name_child1', 'nama_anak1', 'Nama anak pertama.'),
               ('name_child2', 'nama_anak2', 'Nama anak kedua.')],
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::household` (paket tidyr, lisensi MIT).',
        lihat='tidyr::household',
    ),
    dict(
        nama='pengalaman_pasien', paket='tidyr', objek='cms_patient_experience', baris=500,
        judul='Pengalaman pasien menurut organisasi layanan kesehatan',
        deskripsi='Versi Bahasa Indonesia dari `cms_patient_experience` pada paket tidyr. Dua kolom organisasi berawalan sama (`organisasi_`) agar dapat dipilih dengan [frm_diawali()].',
        kolom=[('org_pac_id', 'organisasi_id', 'Pengenal organisasi.'),
               ('org_nm', 'organisasi_nama', 'Nama organisasi.'),
               ('measure_cd', 'ukuran_kode', 'Kode ukuran.'),
               ('measure_title', 'ukuran_judul', 'Judul ukuran.'),
               ('prf_rate', 'tingkat_kinerja', 'Tingkat kinerja.')],
        nilai={}, catatan_nilai=None,
        sumber='Data asli melalui `tidyr::cms_patient_experience` (paket tidyr, lisensi MIT). Bersumber dari data publik CMS menurut dokumentasi tidyr; status hukumnya belum diverifikasi.',
        lihat='tidyr::cms_patient_experience',
    ),
    dict(
        nama='penerbangan', paket='nycflights13', objek='flights', baris=336776, lazy=True,
        judul='Penerbangan dari Kota New York, 2013',
        deskripsi=('Data ketepatan waktu penerbangan dari Kota New York pada tahun 2013. Ini adalah versi Bahasa '
                   'Indonesia dari dataset `flights` pada paket nycflights13. Nilai, satuan (menit, mil, HHMM), '
                   'urutan baris, dan nilai hilang tidak diubah.'),
        kolom=[
            ('year', 'tahun', 'Tahun keberangkatan.'),
            ('month', 'bulan', 'Bulan keberangkatan.'),
            ('day', 'hari', 'Hari keberangkatan.'),
            ('dep_time', 'waktu_berangkat', 'Waktu keberangkatan aktual dalam format HHMM atau HMM, zona waktu lokal.'),
            ('sched_dep_time', 'waktu_jadwal_berangkat', 'Waktu keberangkatan terjadwal dalam format HHMM atau HMM, zona waktu lokal.'),
            ('dep_delay', 'keterlambatan_berangkat', 'Keterlambatan keberangkatan dalam menit; nilai negatif berarti lebih awal.'),
            ('arr_time', 'waktu_tiba', 'Waktu kedatangan aktual dalam format HHMM atau HMM, zona waktu lokal.'),
            ('sched_arr_time', 'waktu_jadwal_tiba', 'Waktu kedatangan terjadwal dalam format HHMM atau HMM, zona waktu lokal.'),
            ('arr_delay', 'keterlambatan_tiba', 'Keterlambatan kedatangan dalam menit; nilai negatif berarti lebih awal.'),
            ('carrier', 'maskapai', 'Singkatan dua huruf maskapai. Nama maskapai ada pada `nycflights13::airlines`.'),
            ('flight', 'nomor_penerbangan', 'Nomor penerbangan.'),
            ('tailnum', 'nomor_ekor', 'Nomor ekor pesawat. Metadata tambahan ada pada `nycflights13::planes`.'),
            ('origin', 'asal', 'Bandara asal. Metadata tambahan ada pada `nycflights13::airports`.'),
            ('dest', 'tujuan', 'Bandara tujuan. Metadata tambahan ada pada `nycflights13::airports`.'),
            ('air_time', 'waktu_terbang', 'Waktu di udara, dalam menit.'),
            ('distance', 'jarak', 'Jarak antarbandara, dalam mil.'),
            ('hour', 'jam', 'Jam keberangkatan terjadwal.'),
            ('minute', 'menit', 'Menit keberangkatan terjadwal.'),
            ('time_hour', 'waktu_jam', 'Tanggal dan jam penerbangan terjadwal sebagai `POSIXct`. Bersama `asal`, dapat dipakai untuk menggabungkan dengan data cuaca.'),
        ],
        nilai={}, catatan_nilai=None,
        cara_penyediaan=('Berbeda dari dataset lain, `penerbangan` tidak disimpan di dalam paket. Objek ini dibuat saat '
                         'pertama kali dipakai dari `nycflights13::flights` (hanya tabel `flights`), dengan satu-satunya '
                         'perubahan berupa nama kolom. Cara ini dipilih karena tabel `flights` saja berukuran sekitar '
                         '4,3 MB dengan kompresi bzip2, sehingga bila disimpan di dalam paket, ukuran paket melampaui '
                         'batas 5 MB yang dianjurkan CRAN. Paket nycflights13 dipasang otomatis bersama paket ini.'),
        sumber=('Data asli dari RITA, Bureau of Transportation Statistics, '
                '\\url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}, melalui paket nycflights13 '
                '(lisensi CC0).'),
        lihat='nycflights13::flights',
    ),
]

# Semua dataset dibuat saat dipakai dari paket sumbernya, sehingga paket ini tidak
# mendistribusikan ulang data tersebut (hak pakai data asli diatur paket sumber).
# Hanya `penguin` (CC0, terverifikasi) disimpan di dalam paket.
_CARA_BAWAAN = ('Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek ini dibuat saat '
                'pertama kali dipakai dari `{paket}::{objek}`, dengan perubahan berupa nama kolom{nilai}. '
                'Dengan cara ini paket ini tidak mendistribusikan ulang data tersebut; asal data dan status '
                'hak pakainya tetap diatur oleh paket sumber. Paket {paket} dipasang otomatis bersama paket ini.')
for _d in DATASETS:
    _d['lazy'] = True
    if not _d.get('cara_penyediaan'):
        _d['cara_penyediaan'] = _CARA_BAWAAN.format(
            paket=_d['paket'], objek=_d['objek'],
            nilai=' dan terjemahan nilai kategorikal' if _d['nilai'] else '')
    if _d['nama'] != 'penerbangan':
        _d['sumber'] = _d['sumber'].replace('Status lisensi data EPA belum diverifikasi.', '').replace(
            'Asal data dan statusnya di luar paket belum diverifikasi.', '').replace(
            'Asal data di luar paket belum diverifikasi.', '').replace(
            'Asal dan status hak data peringkat belum diverifikasi.', '').replace(
            'Bersumber dari data publik CMS menurut dokumentasi tidyr; status hukumnya belum diverifikasi.', '').strip()
        _d['sumber'] += (' Asal data asli dan status hak pakainya diatur oleh paket sumber; '
                         'paket ini tidak mendistribusikan ulang data tersebut.')

# ---------------------------------------------------------------------------
# Struktur asli (terverifikasi) untuk dataset yang sebagian kolomnya tidak diubah
# ---------------------------------------------------------------------------
WHO_KODE = ['%s_%s_%s' % (d, j, u) for d in ['sp', 'sn', 'ep', 'rel'] for j in ['m', 'f']
            for u in ['014', '1524', '2534', '3544', '4554', '5564', '65']]


def kolom_lengkap(d):
    """Daftar (asli, baru) lengkap sesuai urutan data asli."""
    if d.get('sisa_tetap'):
        return [(a, b) for a, b, _ in d['kolom']] + [(k, k) for k in WHO_KODE]
    return [(a, b) for a, b, _ in d['kolom']]


def r_vec(items, lebar=76, indent='  '):
    teks = ', '.join('"%s"' % x for x in items)
    baris = textwrap.wrap(teks, width=lebar, break_long_words=False, break_on_hyphens=False)
    return 'c(\n' + '\n'.join(indent + b for b in baris) + '\n)'


def r_peta(pasangan):
    return 'c(' + ', '.join('"%s" = "%s"' % (a, b) for a, b in pasangan) + ')'


BANTU = '''# Fungsi bantu untuk skrip pembuat dataset. Dihasilkan oleh
# dev/generator/buat_dataset.py.

terjemahkan_nilai <- function(x, peta) {
  ada <- unique(as.character(x[!is.na(x)]))
  tak_dikenal <- setdiff(ada, names(peta))
  if (length(tak_dikenal) > 0L) {
    stop("Nilai tak dikenal pada data asli: ", paste(tak_dikenal, collapse = ", "),
         call. = FALSE)
  }
  if (is.factor(x)) {
    tingkat <- levels(x)
    if (!all(tingkat %in% names(peta))) {
      stop("Level faktor tak dikenal: ",
           paste(setdiff(tingkat, names(peta)), collapse = ", "), call. = FALSE)
    }
    levels(x) <- unname(peta[tingkat])
    x
  } else {
    unname(peta[as.character(x)])
  }
}

bangun_dataset <- function(asli, nama_baru, peta_nilai = list()) {
  baru <- asli
  for (kolom in names(peta_nilai)) {
    baru[[kolom]] <- terjemahkan_nilai(baru[[kolom]], peta_nilai[[kolom]])
  }
  names(baru) <- nama_baru
  baru
}

periksa_dataset <- function(asli, baru, nama_asli, nama_baru, peta_nilai = list()) {
  stopifnot(
    identical(names(baru), nama_baru),
    identical(dim(baru), dim(asli)),
    identical(class(baru), class(asli)),
    identical(sum(is.na(baru)), sum(is.na(asli)))
  )
  for (i in seq_along(nama_asli)) {
    a <- asli[[nama_asli[i]]]
    b <- baru[[nama_baru[i]]]
    if (nama_asli[i] %in% names(peta_nilai)) {
      peta <- peta_nilai[[nama_asli[i]]]
      stopifnot(identical(as.character(b), unname(peta[as.character(a)])))
      if (is.factor(a)) {
        stopifnot(
          identical(class(a), class(b)),
          identical(levels(b), unname(peta[levels(a)]))
        )
      }
    } else {
      stopifnot(identical(a, b))
    }
  }
  invisible(TRUE)
}
'''


def skrip(d):
    asli_nama = [a for a, _ in kolom_lengkap(d)]
    baru_nama = [b for _, b in kolom_lengkap(d)]
    t = '# Dihasilkan oleh dev/generator/buat_dataset.py. Jalankan dari akar paket:\n'
    t += '#   source("data-raw/%s.R")\n' % d['nama']
    t += '# Berhenti dengan galat bila data asli tidak sesuai harapan.\n\n'
    t += 'source("data-raw/bantu.R", local = TRUE)\n\n'
    t += 'asli <- %s::%s\n\n' % (d['paket'], d['objek'])
    t += 'nama_asli <- ' + r_vec(asli_nama) + '\n\n'
    t += 'nama_baru <- ' + r_vec(baru_nama) + '\n\n'
    if d['nilai']:
        t += 'peta_nilai <- list(\n'
        t += ',\n'.join('  `%s` = %s' % (k, r_peta(v)) for k, v in d['nilai'].items())
        t += '\n)\n\n'
    else:
        t += 'peta_nilai <- list()\n\n'
    t += 'stopifnot(identical(names(asli), nama_asli))\n'
    t += '%s <- bangun_dataset(asli, nama_baru, peta_nilai)\n' % d['nama']
    t += 'periksa_dataset(asli, %s, nama_asli, nama_baru, peta_nilai)\n\n' % d['nama']
    t += 'message("%s: ", nrow(%s), " baris, ", ncol(%s), " kolom. Semua pemeriksaan lolos.")\n' % (d['nama'], d['nama'], d['nama'])
    t += 'usethis::use_data(%s, overwrite = TRUE)\n' % d['nama']
    return t


def master():
    nama = ['penguin'] + [d['nama'] for d in DATASETS if not d.get('lazy')]
    return '''# Membuat semua dataset lokal. Jalankan dari akar paket:
#   source("data-raw/semua.R")
# Prasyarat: install.packages(c("usethis", "palmerpenguins", "ggplot2", "tidyr"))
# Setiap dataset dibuat terpisah; satu kegagalan tidak menghentikan yang lain.

skrip <- %s

hasil <- vapply(skrip, function(nama) {
  tryCatch({
    source(file.path("data-raw", paste0(nama, ".R")), local = new.env())
    "BERHASIL"
  }, error = function(e) paste("GAGAL:", conditionMessage(e)))
}, character(1))

print(data.frame(dataset = names(hasil), status = unname(hasil), row.names = NULL))
''' % r_vec(nama)


def dokumen(d):
    L = ["#' " + d['judul'], "#'"]
    for b in textwrap.wrap(d['deskripsi'], width=75, break_long_words=False, break_on_hyphens=False):
        L.append("#' " + b)
    ncol = len(kolom_lengkap(d)) + (1 if d.get('nama_baris') else 0)
    L += ["#'", "#' @format Sebuah tibble dengan %s baris dan %d kolom:" % (format(d['baris'], ',').replace(',', '.'), ncol),
          "#' \\describe{"]
    tampil = [(a, b, ket) for a, b, ket in d['kolom'] if ket is not None]
    if d.get('nama_baris'):
        baris = textwrap.wrap('\\item{%s}{%s}' % (d['nama_baris'], d['nama_baris_ket']), width=72,
                              subsequent_indent='  ', break_long_words=False, break_on_hyphens=False)
        L.append("#'   " + baris[0])
        L += ["#'   " + x for x in baris[1:]]
    for a, b, ket in tampil:
        teks = '%s Asli: `%s`.' % (ket, a)
        baris = textwrap.wrap('\\item{%s}{%s}' % (b, teks), width=72, subsequent_indent='  ',
                              break_long_words=False, break_on_hyphens=False)
        L.append("#'   " + baris[0])
        L += ["#'   " + x for x in baris[1:]]
    if d.get('kolom_ringkas'):
        nm, ket = d['kolom_ringkas']
        baris = textwrap.wrap('\\item{%s}{%s}' % (nm, ket), width=72, subsequent_indent='  ',
                              break_long_words=False, break_on_hyphens=False)
        L.append("#'   " + baris[0])
        L += ["#'   " + x for x in baris[1:]]
    L.append("#' }")
    if d['nilai']:
        L += ["#'", "#' @section Terjemahan nilai:"]
        for kol, pas in d['nilai'].items():
            lokal = [b for a, b, _ in d['kolom'] if a == kol][0]
            ubah = ', '.join('`%s` menjadi `%s`' % (a, b) for a, b in pas if a != b)
            for x in textwrap.wrap('`%s` (asli: `%s`): %s.' % (lokal, kol, ubah), width=75,
                                   break_long_words=False, break_on_hyphens=False):
                L.append("#' " + x)
            L.append("#'")
        L.pop()
        if d['catatan_nilai']:
            L.append("#'")
            for x in textwrap.wrap(d['catatan_nilai'], width=75, break_long_words=False, break_on_hyphens=False):
                L.append("#' " + x)
    L += ["#'", "#' @section Perbedaan dengan dataset asli:"]
    beda = ('Nama kolom diterjemahkan%s. Jumlah dan urutan baris, nilai numerik, dan nilai hilang tidak diubah. '
            'Dataset asli tetap tersedia sebagai `%s`.' % (' dan sebagian nilai kategorikal' if d['nilai'] else '', d['lihat']))
    if d.get('beda'):
        beda = d['beda']
    for x in textwrap.wrap(beda, width=75, break_long_words=False, break_on_hyphens=False):
        L.append("#' " + x)
    if d.get('catatan_asli'):
        L += ["#'", "#' @section Catatan dari sumber asli:"]
        for x in textwrap.wrap(d['catatan_asli'], width=75, break_long_words=False, break_on_hyphens=False):
            L.append("#' " + x)
    if d.get('lazy'):
        L += ["#'", "#' @section Cara penyediaan:"]
        for x in textwrap.wrap(d['cara_penyediaan'], width=75, break_long_words=False, break_on_hyphens=False):
            L.append("#' " + x)
        L += ["#'", "#' @rawNamespace export(%s)" % d['nama']]
    L += ["#'"]
    for x in textwrap.wrap('@source ' + d['sumber'], width=75, break_long_words=False, break_on_hyphens=False):
        L.append("#' " + x if not x.startswith('@') else "#' " + x)
    L += ["#'", "#' @seealso [%s]" % d['lihat']]
    if d.get('contoh'):
        L += ["#'", "#' @examples"] + ["#' " + x if x else "#'" for x in d['contoh']]
    L.append('"%s"' % d['nama'])
    return '\n'.join(L) + '\n'


def uji_nama_baris(d, asli_nama, baru_nama):
    """Uji untuk dataset yang nama barisnya dipindahkan menjadi kolom pertama."""
    n = d['nama']
    t = '\ntest_that("%s sesuai %s::%s", {\n' % (n, d['paket'], d['objek'])
    t += '  skip_if_not(exists("%s"), "dataset `%s` belum dibuat")\n' % (n, n)
    t += '  asli <- %s::%s\n' % (d['paket'], d['objek'])
    t += '  nama_asli <- %s\n' % r_vec(asli_nama, indent='    ').replace('\n)', '\n  )')
    t += '  nama_baru <- %s\n' % r_vec(baru_nama, indent='    ').replace('\n)', '\n  )')
    t += '  expect_identical(names(%s), c("%s", nama_baru))\n' % (n, d['nama_baris'])
    t += '  expect_identical(dim(%s), c(nrow(asli), ncol(asli) + 1L))\n' % n
    t += '  expect_s3_class(%s, "tbl_df")\n' % n
    t += '  expect_identical(%s[["%s"]], rownames(asli))\n' % (n, d['nama_baris'])
    t += '  for (i in seq_along(nama_asli)) {\n'
    t += '    expect_identical(asli[[nama_asli[i]]], %s[[nama_baru[i]]], info = nama_baru[i])\n  }\n' % n
    t += '  expect_identical(sum(is.na(%s)), sum(is.na(asli)))\n' % n
    t += '  expect_identical(nrow(%s), %dL)\n' % (n, d['baris'])
    t += '})\n'
    return t


def uji():
    t = '''# Dihasilkan oleh dev/generator/buat_dataset.py.
# Memeriksa dataset lokal terhadap dataset asli: dimensi, nama kolom, nilai
# yang tidak diterjemahkan (identik), nilai yang diterjemahkan (sesuai peta),
# dan nilai hilang.

periksa_sama_dengan_asli <- function(lokal, asli, nama_asli, nama_baru, peta_nilai = list()) {
  expect_identical(names(lokal), nama_baru)
  expect_identical(dim(lokal), dim(asli))
  expect_identical(class(lokal), class(asli))
  expect_identical(sum(is.na(lokal)), sum(is.na(asli)))
  for (i in seq_along(nama_asli)) {
    a <- asli[[nama_asli[i]]]
    b <- lokal[[nama_baru[i]]]
    if (nama_asli[i] %in% names(peta_nilai)) {
      peta <- peta_nilai[[nama_asli[i]]]
      expect_identical(as.character(b), unname(peta[as.character(a)]))
      if (is.factor(a)) {
        expect_identical(class(a), class(b))
        expect_identical(levels(b), unname(peta[levels(a)]))
      }
    } else {
      expect_identical(a, b, info = nama_baru[i])
    }
  }
}
'''
    for d in DATASETS:
        asli_nama = [a for a, _ in kolom_lengkap(d)]
        baru_nama = [b for _, b in kolom_lengkap(d)]
        if d.get('nama_baris'):
            t += uji_nama_baris(d, asli_nama, baru_nama)
            continue
        t += '\ntest_that("%s sesuai %s::%s", {\n' % (d['nama'], d['paket'], d['objek'])
        t += '  skip_if_not_installed("%s")\n' % d['paket']
        t += '  skip_if_not(exists("%s"), "dataset `%s` belum dibuat (jalankan data-raw/semua.R)")\n' % (d['nama'], d['nama'])
        t += '  asli <- %s::%s\n' % (d['paket'], d['objek'])
        if d['nilai']:
            t += '  peta_nilai <- list(\n' + ',\n'.join('    `%s` = %s' % (k, r_peta(v)) for k, v in d['nilai'].items()) + '\n  )\n'
        else:
            t += '  peta_nilai <- list()\n'
        t += '  periksa_sama_dengan_asli(\n    %s, asli,\n    nama_asli = %s,\n    nama_baru = %s,\n    peta_nilai = peta_nilai\n  )\n' % (
            d['nama'], r_vec(asli_nama, indent='      ').replace('\n)', '\n    )'), r_vec(baru_nama, indent='      ').replace('\n)', '\n    )'))
        t += '  expect_identical(nrow(%s), %dL)\n' % (d['nama'], d['baris'])
        t += '})\n'
    return t


def kode_lazy_semua():
    bagian = []
    for d in DATASETS:
        asli = [a for a, _ in kolom_lengkap(d)]
        baru = [b for _, b in kolom_lengkap(d)]
        peta = ('list(\n' + ',\n'.join('      `%s` = %s' % (k, r_peta(v)) for k, v in d['nilai'].items()) + '\n    )') if d['nilai'] else 'list()'
        bagian.append('  %s = list(\n    paket = "%s", objek = "%s",\n%s    nama_asli = %s,\n    nama_baru = %s,\n    peta_nilai = %s\n  )' % (
            d['nama'], d['paket'], d['objek'],
            ('    nama_baris = "%s",\n' % d['nama_baris']) if d.get('nama_baris') else '',
            r_vec(asli, indent='      ').replace('\n)', '\n    )'),
            r_vec(baru, indent='      ').replace('\n)', '\n    )'), peta))
    return """# Dihasilkan oleh dev/generator/buat_dataset.py. Jangan disunting langsung.
#
# Dataset lokal (selain `penguin`) tidak disimpan di dalam paket. Tiap objek dibuat saat
# pertama kali dipakai dari dataset aslinya di paket sumber, dengan perubahan berupa nama
# kolom dan (bila ada) terjemahan nilai kategorikal. Dengan cara ini paket tidak
# mendistribusikan ulang data tersebut, dan ukuran paket tetap kecil.

.dataset_lazy <- list(
%s
)

.terjemahkan_nilai <- function(x, peta) {
  ada <- unique(as.character(x[!is.na(x)]))
  tak_dikenal <- setdiff(ada, names(peta))
  if (length(tak_dikenal) > 0L) {
    stop(
      "Nilai tak dikenal pada data asli: ", paste(tak_dikenal, collapse = ", "),
      ". Mohon laporkan agar paket diperbarui.",
      call. = FALSE
    )
  }
  if (is.factor(x)) {
    tingkat <- levels(x)
    if (!all(tingkat %%in%% names(peta))) {
      stop(
        "Level faktor tak dikenal: ",
        paste(setdiff(tingkat, names(peta)), collapse = ", "),
        ". Mohon laporkan agar paket diperbarui.",
        call. = FALSE
      )
    }
    levels(x) <- unname(peta[tingkat])
    x
  } else {
    unname(peta[as.character(x)])
  }
}

.buat_dataset <- function(nama) {
  spec <- .dataset_lazy[[nama]]
  asli <- getExportedValue(spec$paket, spec$objek)
  if (!identical(names(asli), spec$nama_asli)) {
    stop(
      "Struktur `", spec$paket, "::", spec$objek, "` berbeda dari yang diharapkan ",
      "paket ini. Mohon laporkan agar paket diperbarui.",
      call. = FALSE
    )
  }
  baru <- asli
  for (kolom in names(spec$peta_nilai)) {
    baru[[kolom]] <- .terjemahkan_nilai(baru[[kolom]], spec$peta_nilai[[kolom]])
  }
  names(baru) <- spec$nama_baru
  if (!is.null(spec[["nama_baris"]])) {
    baru <- tibble::as_tibble(baru, rownames = spec[["nama_baris"]])
  }
  baru
}

.onLoad <- function(libname, pkgname) {
  ns <- topenv(environment())
  for (nama in names(.dataset_lazy)) {
    local({
      n <- nama
      delayedAssign(n, .buat_dataset(n), assign.env = ns)
    })
  }
}
""" % ',\n\n'.join(bagian)


def main():
    os.makedirs(os.path.join(AKAR, 'data-raw'), exist_ok=True)
    open(os.path.join(AKAR, 'data-raw', 'bantu.R'), 'w', encoding='utf-8').write(BANTU)
    open(os.path.join(AKAR, 'R', 'dataset_lazy.R'), 'w', encoding='utf-8').write(kode_lazy_semua())
    open(os.path.join(AKAR, 'data-raw', 'semua.R'), 'w', encoding='utf-8').write(master())

    # dokumentasi: penguin dipertahankan dari snapshot
    simpanan = os.path.join(os.path.dirname(__file__), 'penguin_doc.R.txt')
    if not os.path.exists(simpanan):
        lama = open(os.path.join(AKAR, 'R', 'data.R'), encoding='utf-8').read()
        akhir = lama.index('"penguin"') + len('"penguin"')
        open(simpanan, 'w', encoding='utf-8').write(lama[:akhir] + '\n')
    penguin = open(simpanan, encoding='utf-8').read()
    isi = penguin + '\n' + '\n'.join(dokumen(d) for d in DATASETS)
    open(os.path.join(AKAR, 'R', 'data.R'), 'w', encoding='utf-8').write(isi)

    open(os.path.join(AKAR, 'tests', 'testthat', 'test-data-3d.R'), 'w', encoding='utf-8').write(uji())
    print('Dihasilkan: %d dataset (+penguin).' % len(DATASETS))


if __name__ == '__main__':
    main()
