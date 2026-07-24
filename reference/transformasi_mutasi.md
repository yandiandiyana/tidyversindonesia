# Membuat atau mengubah kolom dalam data

Padanan fungsi \`dplyr::mutate()\`

## Usage

``` r
transformasi_mutasi(data, ...)
```

## Arguments

- data:

  Data frame atau tibble

- ...:

  Ekspresi untuk membuat atau mengubah kolom

## Value

Data frame dengan kolom baru atau yang telah diperbarui

## See also

\[dplyr::mutate()\]

Other transformasi:
[`transformasi_distingsi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_distingsi.md),
[`transformasi_filter()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_filter.md),
[`transformasi_kelompok_berdasarkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_kelompok_berdasarkan.md),
[`transformasi_kelompok_hapus()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_kelompok_hapus.md),
[`transformasi_potong()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong.md),
[`transformasi_potong_acak()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong_acak.md),
[`transformasi_potong_ekor()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong_ekor.md),
[`transformasi_potong_kepala()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong_kepala.md),
[`transformasi_potong_maksimum()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong_maksimum.md),
[`transformasi_potong_minimum()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_potong_minimum.md),
[`transformasi_relokasi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_relokasi.md),
[`transformasi_seleksi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_seleksi.md),
[`transformasi_statistik_ringkas()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_statistik_ringkas.md),
[`transformasi_urutkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_urutkan.md)

## Examples

``` r
df <- tibble::tibble(usia_bulan = c(120, 180))
transformasi_mutasi(df, usia_tahun = usia_bulan / 12)
#> # A tibble: 2 × 2
#>   usia_bulan usia_tahun
#>        <dbl>      <dbl>
#> 1        120         10
#> 2        180         15
```
