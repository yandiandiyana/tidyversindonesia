#!/usr/bin/env python3
"""Generator vignette tidyversindonesia (alat bantu pengembang).

Menulis vignettes/*.Rmd dari sumber yang sama dengan kode paket, sehingga dokumentasi
tidak dapat menyimpang dari kamus:
  mulai-cepat, pemetaan-fungsi, kamus-dataset, kompatibilitas-r4ds,
  panduan-migrasi, pemecahan-masalah.
Pengguna paket TIDAK perlu menjalankan berkas ini.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from buat_pembungkus import SPECS, turunkan  # noqa: E402
from buat_dataset import DATASETS, kolom_lengkap  # noqa: E402

AKAR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
VIG = os.path.join(AKAR, 'vignettes')

FAMILI = [
    ('imp', 'imp_: impor data', 'Membaca data dari berkas, termasuk pembangun tipe kolom.'),
    ('inp', 'inp_: memasukkan data', 'Membuat tabel langsung di R dan menuliskan data ke berkas.'),
    ('rpi', 'rpi_: merapikan data', 'Mengubah bentuk tabel (panjang dan lebar).'),
    ('trn', 'trn_: transformasi data', 'Kata kerja transformasi dplyr.'),
    ('frm', 'frm_: pendukung transformasi', 'Pembantu yang dipakai di dalam fungsi `trn_` dan `rpi_`.'),
    ('vis', 'vis_: objek plot', 'Membuat, menyimpan, dan mengambil objek plot.'),
    ('grf', 'grf_: komponen grafik', 'Geometri, faset, skala, tema, label, dan pemetaan estetika.'),
    ('dsr', 'dsr_: dasar R', 'Fungsi dasar R yang dipakai buku.'),
    ('dtr', 'dtr_: inspeksi data', 'Melihat isi data.'),
]


def kepala(judul, indeks):
    return ('---\ntitle: "%s"\noutput: rmarkdown::html_vignette\nvignette: >\n'
            '  %%\\VignetteIndexEntry{%s}\n  %%\\VignetteEngine{knitr::rmarkdown}\n'
            '  %%\\VignetteEncoding{UTF-8}\n---\n\n' % (judul, indeks))


PENGATUR = '''```{r, include = FALSE}
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 6.5, fig.height = 4)
```

'''


def tulis(nama, isi):
    os.makedirs(VIG, exist_ok=True)
    with open(os.path.join(VIG, nama), 'w', encoding='utf-8') as f:
        f.write(isi)


# ---------------------------------------------------------------------------
def pemetaan():
    t = kepala('Pemetaan fungsi dan argumen', 'Pemetaan fungsi dan argumen')
    t += PENGATUR
    t += ('Tabel ini dibangkitkan otomatis dari kamus paket sehingga selalu sama dengan kodenya. '
          'Setiap fungsi lokal memanggil satu fungsi asli; **hanya nama fungsi dan nama argumen yang '
          'diterjemahkan, nilai argumen tidak pernah diubah.** Argumen yang tidak tercantum di kolom '
          'terakhir memakai nama yang sama dengan aslinya. Nama argumen asli (berbahasa Inggris) juga '
          'tetap diterima.\n\n')
    t += ('Fungsi lain yang bukan pembungkus: `imp_berkas_contoh()` mengembalikan lokasi berkas contoh '
          'yang dibawa paket.\n\n')
    for kode, judul, uraian in FAMILI:
        t += '## %s\n\n%s\n\n' % (judul, uraian)
        t += '| Fungsi lokal | Fungsi asli | Argumen yang diterjemahkan (lokal = asli) |\n|---|---|---|\n'
        for s in SPECS:
            if s['keluarga'] != kode:
                continue
            d = turunkan(s)
            arg = ', '.join('`%s` = `%s`' % (l, a) for l, a in d['argumen'].items())
            if not arg:
                arg = '(tidak ada)'
            opsi = ' (paket opsional)' if s.get('opsional') else ''
            t += '| `%s()` | `%s::%s()`%s | %s |\n' % (s['nama'], s['paket'], s['fungsi'], opsi, arg)
        t += '\n'
    t += ('## Sintaks dasar yang tidak dibungkus\n\n'
          'Tetap dipakai apa adanya: `<-`, `|>`, `%>%`, `%in%`, `%/%`, `%%`, operator aritmetika dan logika, '
          '`c()`, `pi`, `library()`, `I()`, dan `~`.\n\n'
          '## Pemetaan estetika\n\n'
          'Di dalam `grf_estetika()`, `grf_geometrik_*()`, dan `grf_label()`, nama estetika diterjemahkan:\n\n'
          '| Lokal | Asli |\n|---|---|\n| `warna` | `colour` atau `color` |\n| `isian` | `fill` |\n'
          '| `bentuk` | `shape` |\n| `ukuran` | `size` |\n| `alfa` | `alpha` |\n'
          '| `tipe_garis` | `linetype` |\n| `ketebalan_garis` | `linewidth` |\n| `kelompok` | `group` |\n')
    tulis('pemetaan-fungsi.Rmd', t)


# ---------------------------------------------------------------------------
def kamus_dataset():
    t = kepala('Kamus dataset', 'Kamus dataset')
    t += PENGATUR
    t += ('Dataset lokal memakai nama kolom berbahasa Indonesia. Nilai numerik, urutan baris, dan nilai '
          'hilang tidak diubah. Hanya `penguin` disimpan di dalam paket; dataset lain dibuat saat dipakai '
          'dari paket sumbernya sehingga paket ini tidak mendistribusikan ulang datanya. Dokumentasi '
          'lengkap tiap dataset ada di `?nama_dataset`.\n\n')
    t += ('## penguin (dari palmerpenguins::penguins)\n\n'
          '| Kolom asli | Kolom lokal |\n|---|---|\n'
          '| `species` | `spesies` |\n| `island` | `pulau` |\n| `bill_length_mm` | `panjang_paruh_mm` |\n'
          '| `bill_depth_mm` | `kedalaman_paruh_mm` |\n| `flipper_length_mm` | `panjang_sirip_mm` |\n'
          '| `body_mass_g` | `massa_tubuh_g` |\n| `sex` | `jenis_kelamin` |\n| `year` | `tahun` |\n\n'
          'Nilai `jenis_kelamin`: `male` menjadi `jantan`, `female` menjadi `betina`.\n\n')
    for d in DATASETS:
        t += '## %s (dari %s::%s)\n\n%s\n\n' % (d['nama'], d['paket'], d['objek'], d['judul'])
        t += '| Kolom asli | Kolom lokal |\n|---|---|\n'
        if d.get('kolom_ringkas') and d['nama'] == 'tangga_lagu':
            for a, b, _ in d['kolom'][:3]:
                t += '| `%s` | `%s` |\n' % (a, b)
            t += '| `wk1`, ..., `wk76` | `minggu1`, ..., `minggu76` |\n'
        elif d['nama'] == 'tb_who':
            t += '| `country` | `negara` |\n| `year` | `tahun` |\n| `sp_m_014`, ..., `rel_f_65` (56 kolom) | tidak diubah (kode WHO) |\n'
        else:
            if d.get('nama_baris'):
                t += '| (nama baris) | `%s` |\n' % d['nama_baris']
            for a, b, _ in d['kolom']:
                t += '| `%s` | `%s` |\n' % (a, b)
        t += '\n'
        if d['nilai']:
            for kol, pas in d['nilai'].items():
                lokal = [b for a, b, _ in d['kolom'] if a == kol][0]
                ubah = ', '.join('`%s` menjadi `%s`' % (a, b) for a, b in pas if a != b)
                t += 'Nilai `%s` (asli: `%s`): %s.\n\n' % (lokal, kol, ubah)
    tulis('kamus-dataset.Rmd', t)


# ---------------------------------------------------------------------------
def kompatibilitas():
    isi = open(os.path.join(AKAR, 'dev', 'cakupan_r4ds.md'), encoding='utf-8').read()
    isi = isi.split('\n', 2)[2] if isi.startswith('# ') else isi
    t = kepala('Kompatibilitas dengan R4DS', 'Kompatibilitas dengan R4DS')
    t += PENGATUR
    t += ('Panduan ini mencatat setiap contoh dan latihan berkode di delapan bab Bagian I buku '
          '*R for Data Science* edisi ke-2 (The Whole Game), dan bagaimana mengerjakannya dengan paket ini. '
          'Setiap contoh telah dijalankan dalam bentuk asli dan bentuk lokal, lalu hasilnya dibandingkan oleh '
          'pengujian otomatis paket.\n\n')
    t += isi
    tulis('kompatibilitas-r4ds.Rmd', t)


# ---------------------------------------------------------------------------
MULAI_CEPAT = '''Paket ini membantu pemula berbahasa Indonesia belajar R dan tidyverse. Fungsi, argumen, dan dataset
diterjemahkan, tetapi perilakunya sama dengan aslinya. Paket ini adalah jembatan menuju R dan tidyverse, bukan
penggantinya.

```{r}
library(tidyversindonesia)
```

## Awalan menunjukkan tahap kerja

Awalan nama fungsi memudahkan Anda menemukannya (ketik awalan lalu tekan Tab di RStudio):

| Awalan | Tahap |
|---|---|
| `imp_` | impor data dari berkas |
| `inp_` | memasukkan data (membuat tabel, menulis berkas) |
| `rpi_` | merapikan data |
| `trn_` | transformasi data; `frm_` adalah pembantunya |
| `vis_` | membuat objek plot; `grf_` adalah komponen yang ditambahkan |
| `dsr_`, `dtr_` | fungsi dasar R dan inspeksi data |

## Melihat data

```{r}
dtr_sekilas(penguin)
```

## Mengubah data

```{r}
penguin |>
  trn_filter(!is.na(massa_tubuh_g)) |>
  trn_gabung_kelompok(spesies) |>
  trn_statistik_ringkas(rerata_massa = dsr_rerata(massa_tubuh_g))
```

Kode itu setara dengan kode tidyverse standar:

```{r, eval = FALSE}
palmerpenguins::penguins |>
  dplyr::filter(!is.na(body_mass_g)) |>
  dplyr::group_by(species) |>
  dplyr::summarise(rerata_massa = mean(body_mass_g))
```

## Membuat grafik

```{r}
penguin |>
  vis_ggplot(grf_estetika(
    x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies
  )) +
  grf_geometrik_titik(buang_na = TRUE) +
  grf_label(
    judul = "Sirip dan massa tubuh penguin",
    sumbu_x = "Panjang sirip (mm)",
    sumbu_y = "Massa tubuh (g)",
    warna = "Spesies"
  )
```

## Merapikan data

```{r}
tabel2 |>
  rpi_lebar(nama_dari = jenis, nilai_dari = jumlah)
```

## Mengimpor data

Paket membawa berkas contoh. `imp_berkas_contoh()` memberi lokasinya.

```{r}
imp_berkas_contoh()

siswa <- imp_baca_csv(
  imp_berkas_contoh("siswa.csv"),
  na = c("N/A", ""),
  tampilkan_tipe_kolom = FALSE
)
siswa
```

## Dataset dari buku

Dataset yang dipakai buku tersedia dengan nama dan kolom berbahasa Indonesia, misalnya `penerbangan`
(dari `nycflights13::flights`) dan `mobil_mpg` (dari `ggplot2::mpg`).

```{r}
penerbangan |>
  trn_filter(tujuan == "IAH") |>
  trn_hitung(maskapai, urut = TRUE)
```

## Berpindah ke R standar

Fungsi lokal dan fungsi asli boleh dicampur dalam satu skrip. Setiap fungsi mendokumentasikan padanan aslinya
di bagian "Padanan dengan fungsi asli". Lihat `vignette("panduan-migrasi")` untuk cara berpindah sepenuhnya,
dan `vignette("pemetaan-fungsi")` untuk daftar lengkapnya.
'''

MIGRASI = '''Tujuan akhir paket ini adalah membuat Anda mampu memakai R dan tidyverse standar secara mandiri. Panduan ini
menunjukkan cara menerjemahkan kode lokal kembali ke kode standar.

## Tiga aturan

1. **Awalan dan nama fungsi** diganti dengan fungsi aslinya. Daftarnya ada di `vignette("pemetaan-fungsi")`;
   kolom "Fungsi asli" memuat nama lengkapnya, misalnya `trn_filter()` menjadi `dplyr::filter()`.
2. **Nama argumen** diganti dengan nama aslinya, kolom terakhir pada tabel yang sama. Nilai argumen tidak
   berubah, jadi `"lm"`, `"fill"`, dan `21` tetap sama.
3. **Nama dataset dan kolom** diganti dengan yang asli. Lihat `vignette("kamus-dataset")`.

## Contoh berdampingan

```{r, eval = FALSE}
# Lokal
penguin |>
  trn_filter(!is.na(massa_tubuh_g)) |>
  trn_gabung_kelompok(spesies) |>
  trn_statistik_ringkas(rerata = dsr_rerata(massa_tubuh_g))

# Standar
palmerpenguins::penguins |>
  dplyr::filter(!is.na(body_mass_g)) |>
  dplyr::group_by(species) |>
  dplyr::summarise(rerata = mean(body_mass_g))
```

```{r, eval = FALSE}
# Lokal
penguin |>
  vis_ggplot(grf_estetika(x = panjang_sirip_mm, y = massa_tubuh_g, warna = spesies)) +
  grf_geometrik_titik(alfa = 0.5) +
  grf_label(judul = "Judul", sumbu_x = "Sumbu x")

# Standar
ggplot2::ggplot(
  palmerpenguins::penguins,
  ggplot2::aes(x = flipper_length_mm, y = body_mass_g, colour = species)
) +
  ggplot2::geom_point(alpha = 0.5) +
  ggplot2::labs(title = "Judul", x = "Sumbu x")
```

## Hal yang perlu diperhatikan saat berpindah

- **Pemilihan kolom dengan awalan.** Di buku, `starts_with("dep")` memilih kolom `dep_time` dan `dep_delay`.
  Pada nama kolom Indonesia, kata pengubah ada di belakang (`waktu_berangkat`, bukan `berangkat_waktu`),
  sehingga teknik awalan tidak langsung berlaku. Pakai `frm_cocok()` atau `frm_salah_satu()`, atau
  `starts_with()` pada nama kolom aslinya setelah berpindah.
- **Nilai kategorikal yang diterjemahkan.** Misalnya `penggerak` pada `mobil_mpg` bernilai `depan`,
  `belakang`, `4_roda`, sedangkan `drv` pada `mpg` bernilai `f`, `r`, `4`. Saat berpindah ke data asli,
  nilainya ikut berubah; lihat `vignette("kamus-dataset")`.
- **Pesan galat dan peringatan.** Pesan dari dplyr, tidyr, readr, dan ggplot2 tetap berbahasa Inggris dan
  menyebut nama fungsi asli. Itu disengaja: dengan begitu Anda dapat mencari pesan itu di internet.
- **Fungsi bantu paket ini.** `imp_berkas_contoh()` tidak punya padanan di tidyverse.

## Ingin melihat kode asli dari kode lokal?

Setiap halaman bantuan memiliki bagian "Padanan dengan fungsi asli" dan contoh berdampingan. Ketik, misalnya,
`?trn_filter`.
'''

MASALAH = '''## "could not find function"

Periksa awalan dan ejaan nama fungsi. Ketik awalan lalu tekan Tab di RStudio untuk melihat daftarnya (misalnya
`trn_` untuk transformasi). Daftar lengkap ada di `vignette("pemetaan-fungsi")`.

## Argumen tidak dikenali, atau diabaikan

Nama argumen lokal harus ditulis **lengkap**. Singkatan nama lokal (misalnya `tampilkan_tipe` untuk
`tampilkan_tipe_kolom`) tidak diterjemahkan dan diteruskan apa adanya ke fungsi asli, yang biasanya
memberi galat atau peringatan "unknown parameters". Nama argumen asli berbahasa Inggris tetap diterima.

## "Konflik argumen"

Anda memberikan nama lokal dan nama asli untuk argumen yang sama sekaligus (misalnya `.berdasarkan` dan
`.by`, atau `warna` dan `color`). Gunakan salah satu saja.

## Pesan atau peringatan berbahasa Inggris

Pesan dari paket tidyverse tidak diterjemahkan, dan menyebut nama fungsi asli (misalnya `filter()`). Itu
perilaku yang disengaja. Pesan yang berasal dari paket ini sendiri berbahasa Indonesia.

## "memerlukan paket ... yang belum terpasang"

Beberapa fungsi memakai paket yang dipasang terpisah:

| Fungsi | Paket |
|---|---|
| `grf_skalawarna_butawarna()` | ggthemes |
| `trn_rapikan_nama()` | janitor |
| `frm_faktor_frekuensi()` | forcats |
| `imp_baca_parquet()`, `inp_tulis_parquet()` | arrow |
| `grf_geometrik_heksagon()` (untuk menggambar) | hexbin |

Pasang dengan `install.packages("nama_paket")`.

## Dataset tidak ditemukan, atau galat saat pertama kali dipakai

Dataset lokal (kecuali `penguin`) dibuat saat pertama kali dipakai dari paket sumbernya (ggplot2, tidyr,
nycflights13). Pastikan paket-paket itu terpasang dan versinya tidak terlalu lama. Bila strukturnya berubah,
paket memberi pesan yang meminta Anda melaporkannya.

## Memilih kolom dengan awalan tidak memberi hasil yang sama dengan buku

Lihat bagian "Hal yang perlu diperhatikan saat berpindah" di `vignette("panduan-migrasi")`.

## `dtr_lihat()` tidak membuka apa-apa

`dtr_lihat()` (padanan `View()`) hanya bekerja pada sesi interaktif seperti RStudio.

## Menghitung per kelompok: argumen `nama`, `urut`, `bobot`

Pada `trn_hitung()`, menulis `nama = ...` berarti mengisi argumen `nama` (nama kolom hasil), sama seperti
`name = ...` pada `dplyr::count()`. Jangan memakainya untuk membuat kolom bernama `nama`.
'''


def statik(nama, judul, indeks, isi):
    tulis(nama, kepala(judul, indeks) + PENGATUR + isi)


def main():
    pemetaan()
    kamus_dataset()
    kompatibilitas()
    statik('mulai-cepat.Rmd', 'Mulai cepat dengan tidyversindonesia', 'Mulai cepat', MULAI_CEPAT)
    statik('panduan-migrasi.Rmd', 'Panduan migrasi ke R dan tidyverse standar', 'Panduan migrasi', MIGRASI)
    statik('pemecahan-masalah.Rmd', 'Pemecahan masalah', 'Pemecahan masalah', MASALAH)
    print('Vignette ditulis di', VIG)
    for f in sorted(os.listdir(VIG)):
        print('  ', f, os.path.getsize(os.path.join(VIG, f)), 'byte')


if __name__ == '__main__':
    main()
