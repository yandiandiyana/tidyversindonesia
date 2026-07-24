# Mengimpor data dari file Excel

Padanan fungsi \`readxl::read_excel()\`

## Usage

``` r
impor_baca_excel(path, sheet = NULL, range = NULL, col_types = NULL, na = "NA")
```

## Arguments

- path:

  Jalur atau nama file Excel

- sheet:

  Nama atau nomor sheet (default: sheet pertama)

- range:

  Rentang sel (opsional)

- col_types:

  Jenis kolom (opsional)

- na:

  Nilai string yang dianggap sebagai \`NA\`. Default: \`"NA"\`

## Value

Sebuah data frame berisi data dari file Excel

## See also

\[readxl::read_excel()\]

Other impor:
[`impor_baca_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_csv.md),
[`input_tulis_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_csv.md),
[`input_tulis_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_excel.md)

## Examples

``` r
# Contoh minimal (file harus tersedia)
# \donttest{
# impor_baca_excel("data/penjualan.xlsx")
# }
```
