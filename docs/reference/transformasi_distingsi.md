# Memilih hanya baris berbeda (distingsi) tanpa duplikat

Padanan fungsi \`dplyr::distinct()\`

## Usage

``` r
transformasi_distingsi(data, ...)
```

## Arguments

- data:

  Data frame

- ...:

  Kolom opsional

## Value

Data frame berbeda (distingsi) tanpa duplikat

## See also

\[dplyr::distinct()\]

Other transformasi:
[`transformasi_filter()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_filter.md),
[`transformasi_kelompok_berdasarkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_kelompok_berdasarkan.md),
[`transformasi_kelompok_hapus()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_kelompok_hapus.md),
[`transformasi_mutasi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_mutasi.md),
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
df <- data.frame(a = c(1,1,2))
transformasi_distingsi(df)
#>   a
#> 1 1
#> 2 2
```
