# Memilih semua kolom

Padanan fungsi \`tidyselect::everything()\`

## Usage

``` r
kolom_pilih_semua()
```

## Value

Objek tidyselect yang mewakili semua kolom

## Examples

``` r
df <- tibble::tibble(a = 1, b = 2, c = 3)
transformasi_seleksi(df, kolom_pilih_semua())
#> # A tibble: 1 × 3
#>       a     b     c
#>   <dbl> <dbl> <dbl>
#> 1     1     2     3
```
