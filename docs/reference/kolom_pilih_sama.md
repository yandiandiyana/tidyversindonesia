# Memilih kolom berdasarkan kesamaan nama

Padanan fungsi \`tidyselect::matches()\`.

## Usage

``` r
kolom_pilih_sama(pattern, ignore.case = FALSE)
```

## Arguments

- pattern:

  Pola regular expression yang akan dikolom_cocokkan.

- ignore.case:

  Logika, apakah mengabaikan huruf besar/kecil.

## Value

Objek tidyselect.

## Examples

``` r
df <- tibble::tibble(
  x1 = 1:3,
  x2 = 3:5,
  y = 10:12
)

transformasi_seleksi(df, kolom_cocok("^x[0-9]+"))
#> Error in dplyr::select(data, ...): ℹ In argument: `kolom_cocok("^x[0-9]+")`.
#> Caused by error in `kolom_cocok()`:
#> ! could not find function "kolom_cocok"
```
