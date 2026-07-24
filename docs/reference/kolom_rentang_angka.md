# Memilih kolom berdasarkan pola rentang angka

Padanan fungsi \`tidyselect::num_range()\`

## Usage

``` r
kolom_rentang_angka(prefix, range, width = NULL)
```

## Arguments

- prefix:

  Nama awal kolom

- range:

  Vektor angka, misalnya 1:5

- width:

  Jumlah digit, misalnya 2 untuk x01, x02

## Value

Objek tidyselect.

## Examples

``` r
df <- tibble::tibble(x1 = 1, x2 = 2, x3 = 3)
transformasi_seleksi(df, kolom_rentang_angka("x", 1:3))
#> # A tibble: 1 × 3
#>      x1    x2    x3
#>   <dbl> <dbl> <dbl>
#> 1     1     2     3
```
