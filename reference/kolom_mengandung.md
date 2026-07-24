# Memilih kolom yang namanya mengandung teks tertentu

Padanan fungsi \`tidyselect::contains()\`

## Usage

``` r
kolom_mengandung(text, ignore.case = TRUE)
```

## Arguments

- text:

  Teks yang harus muncul di dalam nama kolom.

- ignore.case:

  Logika, apakah mengabaikan huruf besar/kecil.

## Value

Objek tidyselect.

## Examples

``` r
df <- tibble::tibble(
  nama_depan = c("A", "B", "C"),
  nama_belakang = c("X", "Y", "Z"),
  usia = c(20, 30, 40)
)

transformasi_seleksi(df, kolom_mengandung("nama"))
#> # A tibble: 3 × 2
#>   nama_depan nama_belakang
#>   <chr>      <chr>        
#> 1 A          X            
#> 2 B          Y            
#> 3 C          Z            
```
