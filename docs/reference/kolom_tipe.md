# Memilih kolom berdasarkan kondisi fungsi

Padanan fungsi \`tidyselect::where()\`

## Usage

``` r
kolom_tipe(fn)
```

## Arguments

- fn:

  Fungsi predicate yang mengembalikan TRUE/FALSE

## Value

Objek tidyselect.

## Details

Fungsi ini hanya digunakan dalam konteks seleksi seperti
\`transformasi_seleksi()\`

## Examples

``` r
df <- tibble::tibble(a = 1:3, b = 4:6, c = c("x", "y", "z"))
transformasi_seleksi(df, kolom_tipe(is.numeric))
#> # A tibble: 3 × 2
#>       a     b
#>   <int> <int>
#> 1     1     4
#> 2     2     5
#> 3     3     6
```
