# Menghapus baris dengan nilai hilang (NA)

Padanan fungsi \`tidyr::drop_na()\`

## Usage

``` r
rapi_hapus_na(data, ...)
```

## Arguments

- data:

  Data frame.

- ...:

  Kolom opsional untuk diperiksa.

## Value

Data frame tanpa baris NA.

## See also

\[tidyr::drop_na()\]

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
df <- data.frame(a = c(1, NA, 3))
rapi_hapus_na(df)
#>   a
#> 1 1
#> 2 3
```
