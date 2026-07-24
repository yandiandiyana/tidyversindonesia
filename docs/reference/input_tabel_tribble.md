# Membuat tibble baris-per-baris (tribble)

Padanan fungsi \`tibble::tribble()\`

## Usage

``` r
input_tabel_tribble(...)
```

## Arguments

- ...:

  Nilai yang dituliskan baris per baris untuk membentuk tibble.

## Value

Sebuah tibble yang disusun baris demi baris.

## See also

\[tibble::tribble()\], \[input_tabel_tibble()\]

Other input:
[`input_tabel_tibble()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tabel_tibble.md),
[`input_vektor()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_vektor.md)

## Examples

``` r
input_tabel_tribble(
  ~nama, ~nilai,
  "A",     10,
  "B",     20
)
#> # A tibble: 2 × 2
#>   nama  nilai
#>   <chr> <dbl>
#> 1 A        10
#> 2 B        20
```
