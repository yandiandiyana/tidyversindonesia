# Menggabungkan nilai menjadi sebuah vektor

Fungsi terjemahan \`c()\`

## Usage

``` r
input_c(...)
```

## Arguments

- ...:

  Nilai-nilai yang ingin digabungkan menjadi vektor.

## Value

Sebuah vektor (numeric, character, logical, atau jenis lainnya
tergantung input).

## See also

\[base::c()\]

Other input:
[`input_tabel_tibble()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tabel_tibble.md),
[`input_tabel_tribble()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tabel_tribble.md)

## Examples

``` r
input_c(1, 2, 3)
#> [1] 1 2 3
input_c("a", "b", "c")
#> [1] "a" "b" "c"
```
