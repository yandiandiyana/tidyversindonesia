# Memilih kolom yang namanya diawali dengan pola tertentu

Padanan fungsi \`tidyselect::starts_with()\`

## Usage

``` r
kolom_diawali(prefix, ignore.case = TRUE)
```

## Arguments

- prefix:

  Teks yang harus menjadi awal nama kolom.

- ignore.case:

  Logika, apakah mengabaikan huruf besar/kecil

## Value

Objek tidyselect untuk memilih kolom

## Examples

``` r
df <- tibble::tibble(nama1 = 1:3, nama2 = 4:6, umur = 20:22)
transformasi_seleksi(df, kolom_diawali("nama"))
#> # A tibble: 3 × 2
#>   nama1 nama2
#>   <int> <int>
#> 1     1     4
#> 2     2     5
#> 3     3     6
```
