# Merangkum data menjadi nilai statistik ringkas

Padanan fungsi \`dplyr::summarize()\`

## Usage

``` r
transformasi_statistik_ringkas(data, ...)
```

## Arguments

- data:

  Data frame atau tibble (biasanya dikelompokkan)

- ...:

  Ekspresi ringkasan yang ingin dihitung

## Value

Data frame hasil peringkasan

## See also

\[dplyr::summarize()\]

Other transformasi:
[`transformasi_distingsi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_distingsi.md),
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
[`transformasi_urutkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_urutkan.md)

## Examples

``` r
df <- tibble::tibble(usia = c(20, 30, 40))
transformasi_statistik_ringkas(df, rata = mean(usia))
#> # A tibble: 1 × 1
#>    rata
#>   <dbl>
#> 1    30
```
