# Menggabungkan nilai menjadi sebuah vektor

Padanan fungsi \`c()\`

## Usage

``` r
input_vektor(...)
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
input_vektor(1, 2, 3)
#> [1] 1 2 3
input_vektor("a", "b", "c")
#> [1] "a" "b" "c"
```
