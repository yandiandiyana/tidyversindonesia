# Memilih kolom yang namanya diakhiri dengan pola tertentu

Padanan fungsi \`tidyselect::ends_with()\`

## Usage

``` r
kolom_diakhiri(suffix, ignore.case = TRUE)
```

## Arguments

- suffix:

  Teks yang harus menjadi akhir nama kolom.

- ignore.case:

  Logika, apakah mengabaikan huruf besar/kecil.

## Value

Objek tidyselect untuk memilih kolom.

## Examples

``` r
df <- tibble::tibble(id_user = 1:3, nama = c("a","b","c"))
transformasi_seleksi(df, kolom_diakhiri("user"))
#> # A tibble: 3 × 1
#>   id_user
#>     <int>
#> 1       1
#> 2       2
#> 3       3
```
