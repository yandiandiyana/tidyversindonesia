# Menyimpan data ke file CSV

Padanan fungsi \`readr::write_csv()\`

## Usage

``` r
input_tulis_csv(data, path, ...)
```

## Arguments

- data:

  Sebuah data frame atau tibble yang akan disimpan

- path:

  Jalur atau nama file CSV tujuan

- ...:

  Argumen tambahan untuk \`readr::write_csv()\`

## Value

File CSV tersimpan ke lokasi yang ditentukan

## See also

\[readr::write_csv()\]

Other impor:
[`impor_baca_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_csv.md),
[`impor_baca_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_excel.md),
[`input_tulis_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_excel.md)

## Examples

``` r
# \donttest{
# contoh data
# input_tulis_csv(mtcars, "data/mtcars.csv")
# }
```
