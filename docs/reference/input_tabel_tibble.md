# Membuat tabel tibble

Padanan fungsi \`tibble::tibble()\`

## Usage

``` r
input_tabel_tibble(...)
```

## Arguments

- ...:

  Nama kolom dan nilai yang akan dimasukkan ke dalam tibble

## Value

Sebuah tibble

## See also

\[tibble::tibble()\], \[input_tabel_tribble()\]

Other input:
[`input_tabel_tribble()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tabel_tribble.md),
[`input_vektor()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_vektor.md)

## Examples

``` r
input_tabel_tibble(
  nama = c("A", "B"),
  nilai = c(10, 20)
)
#> # A tibble: 2 × 2
#>   nama  nilai
#>   <chr> <dbl>
#> 1 A        10
#> 2 B        20
```
