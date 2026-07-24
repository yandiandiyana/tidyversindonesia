# Menyimpan data ke file Excel

Padanan fungsi \`writexl::write_xlsx()\`

## Usage

``` r
input_tulis_excel(data, path, ...)
```

## Arguments

- data:

  Sebuah data frame atau tibble yang akan disimpan

- path:

  Jalur atau nama file Excel tujuan

- ...:

  Argumen tambahan untuk \`writexl::write_xlsx()\`

## Value

File Excel tersimpan ke lokasi yang ditentukan

## See also

\[writexl::write_xlsx()\]

Other impor:
[`impor_baca_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_csv.md),
[`impor_baca_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_excel.md),
[`input_tulis_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_csv.md)

## Examples

``` r
# \donttest{
# contoh data
# input_tulis_excel(mtcars, "data/mtcars.xlsx")
# }
```
