# Mengisi nilai hilang (NA)

Padanan fungsi \`tidyr::fill()\`

## Usage

``` r
rapi_isi_na(data, ..., .direction = "down")
```

## Arguments

- data:

  Data frame.

- ...:

  Kolom untuk diisi.

- .direction:

  Arah pengisian.

## Value

Data frame dengan NA yang sudah diisi.

## See also

\[tidyr::fill()\]

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
df <- data.frame(a = c(1, NA, 3))
rapi_isi_na(df, a, .direction = "down")
#>   a
#> 1 1
#> 2 1
#> 3 3
```
