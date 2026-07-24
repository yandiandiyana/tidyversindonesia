# Melepas pengelompokan dari data

Padanan fungsi \`dplyr::ungroup()\`

## Usage

``` r
transformasi_kelompok_hapus(data)
```

## Arguments

- data:

  Data frame atau tibble yang sudah dikelompokkan

## Value

Data frame tanpa pengelompokan

## See also

\[dplyr::ungroup()\]

Other transformasi:
[`transformasi_distingsi()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_distingsi.md),
[`transformasi_filter()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_filter.md),
[`transformasi_kelompok_berdasarkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_kelompok_berdasarkan.md),
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
df <- tibble::tibble(jk = c("L", "P", "L"), usia = c(20, 22, 25))
g <- transformasi_kelompok_berdasarkan(df, jk)
transformasi_kelompok_hapus(g)
#> # A tibble: 3 × 2
#>   jk     usia
#>   <chr> <dbl>
#> 1 L        20
#> 2 P        22
#> 3 L        25
```
