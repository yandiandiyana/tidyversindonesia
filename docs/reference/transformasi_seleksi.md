# Memilih kolom tertentu dari data

Padanan fungsi \`dplyr::select()\`

## Usage

``` r
transformasi_seleksi(data, ...)
```

## Arguments

- data:

  Data frame atau tibble

- ...:

  Kolom yang ingin dipilih

## Value

Data frame dengan kolom yang dipilih

## See also

\[dplyr::select()\]

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
[`transformasi_statistik_ringkas()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_statistik_ringkas.md),
[`transformasi_urutkan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/transformasi_urutkan.md)

## Examples

``` r
df <- tibble::tibble(nama = c("A", "B"), usia = c(20, 25))
transformasi_seleksi(df, nama)
#> # A tibble: 2 × 1
#>   nama 
#>   <chr>
#> 1 A    
#> 2 B    
```
