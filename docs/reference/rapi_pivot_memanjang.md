# Merapikan data menjadi format memanjang (menambah baris)

Padanan fungsi \`tidyr::pivot_longer()\`

## Usage

``` r
rapi_pivot_memanjang(data, cols, names_to = "name", values_to = "value", ...)
```

## Arguments

- data:

  Data frame.

- cols:

  Kolom yang diputar.

- names_to:

  Nama kolom baru.

- values_to:

  Nama kolom nilai.

- ...:

  Argumen tambahan.

## Value

Data frame dalam format memanjang.

## See also

\[tidyr::pivot_longer()\]

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md)

## Examples

``` r
df <- data.frame(a = 1:3, jan = 1:3, feb = 4:6)
rapi_pivot_memanjang(df, cols = c(jan, feb), names_to = "bulan", values_to = "nilai")
#> # A tibble: 6 × 3
#>       a bulan nilai
#>   <int> <chr> <int>
#> 1     1 jan       1
#> 2     1 feb       4
#> 3     2 jan       2
#> 4     2 feb       5
#> 5     3 jan       3
#> 6     3 feb       6
```
