# tidyversindonesia

## Paket tidyverse versi Bahasa Indonesia

`tidyversindonesia` menyediakan padanan fungsi inti **tidyverse** dalam
Bahasa Indonesia sebagai jembatan untuk mempelajari sains data
menggunakan bahasa pemrograman R.

Paket ini mengikuti empat tahap utama alur kerja yang diperkenalkan
dalam *R for Data Science* (edisi ke-2):

> **Impor → Rapi → Transformasi → Visualisasi**

Dengan menggunakan nama fungsi dan contoh berbahasa Indonesia,
`tidyversindonesia` membantu pengguna memahami konsep-konsep dasar
*tidyverse* sebelum beralih ke fungsi-fungsi standar dalam ekosistem
*tidyverse*.

------------------------------------------------------------------------

## Instalasi

Install paket dari GitHub menggunakan `remotes`:

``` r

install.packages("remotes")

remotes::install_github("yandiandiyana/tidyversindonesia")
```

Kemudian muat paket:

``` r

library(tidyversindonesia)
```

------------------------------------------------------------------------

## Contoh Penggunaan

Melihat data penguin yang telah diterjemahkan ke dalam Bahasa Indonesia:

``` r

data_lihat_kepala(penguin)
```

Membuat grafik sebar (scatter plot):

``` r

visualisasi_ggplot(
  penguin,
  estetika(
    x = panjang_sirip,
    y = massa_tubuh
  )
) +
  grafik_geometrik_titik()
```

------------------------------------------------------------------------

## Alur Kerja

Paket ini dikelompokkan mengikuti empat tahapan utama analisis data.

| Tahap | Contoh fungsi |
|:---|:---|
| **Impor** | [`impor_baca_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_csv.md), [`impor_baca_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_excel.md) |
| **Rapi** | [`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md), [`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md) |
| **Transformasi** | [`transformasi_filter()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_filter.md), [`transformasi_seleksi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_seleksi.md), [`transformasi_mutasi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_mutasi.md) |
| **Visualisasi** | [`visualisasi_ggplot()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot.md), [`grafik_geometrik_titik()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_titik.md) |

------------------------------------------------------------------------

## Data Contoh

`tidyversindonesia` menyediakan data **penguin**, yaitu adaptasi
berbahasa Indonesia dari dataset `penguins` pada paket `datasets`.

Nama variabel telah diterjemahkan agar lebih mudah dipahami ketika
mempelajari manipulasi data dan visualisasi menggunakan R.

| Nama variabel   |
|:----------------|
| `spesies`       |
| `pulau`         |
| `panjang_paruh` |
| `tebal_paruh`   |
| `panjang_sirip` |
| `massa_tubuh`   |
| `jenis_kelamin` |
| `tahun`         |

------------------------------------------------------------------------

## Filosofi

`tidyversindonesia` bukan pengganti **tidyverse**.

Paket ini dirancang sebagai sarana pembelajaran untuk membantu pengguna
memahami konsep-konsep dasar sains data menggunakan R sebelum beralih ke
fungsi-fungsi standar dalam ekosistem **tidyverse**.

------------------------------------------------------------------------

## Kontribusi

Kontribusi, laporan bug, maupun usulan pengembangan sangat diterima.

Silakan membuat *Issue* atau *Pull Request* melalui repositori GitHub:

<https://github.com/yandiandiyana/tidyversindonesia>

------------------------------------------------------------------------

## Sitasi

Apabila **tidyversindonesia** digunakan dalam materi pembelajaran,
pelatihan, publikasi, atau penelitian, mohon sertakan sitasi terhadap
paket ini.

``` r

citation("tidyversindonesia")
```

Setelah paket tersedia di CRAN, informasi sitasi akan diperbarui secara
otomatis sesuai versi yang dipublikasikan.

------------------------------------------------------------------------

## Penulis

**Yandi Andiyana**

GitHub: <https://github.com/yandiandiyana>

Instagram: @tidyversindonesia
