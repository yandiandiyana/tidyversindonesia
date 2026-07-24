# Merapikan data menjadi format melebar (menambah kolom)

Padanan fungsi \`tidyr::pivot_wider()\`

## Usage

``` r
rapi_pivot_melebar(data, names_from, values_from, ...)
```

## Arguments

- data:

  Data frame

- names_from:

  Kolom untuk nama variabel

- values_from:

  Kolom untuk nilai

- ...:

  Argumen tambahan

## Value

Data frame dalam format lebar

## See also

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
df <- data.frame(bulan = c("jan","feb"), nilai = c(10, 20))
rapi_pivot_melebar(df, names_from = bulan, values_from = nilai)
#> # A tibble: 1 × 2
#>     jan   feb
#>   <dbl> <dbl>
#> 1    10    20
```
