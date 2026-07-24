# Mengimpor data dari file CSV

Padanan fungsi \`readr::read_csv()\`

## Usage

``` r
impor_baca_csv(path, ...)
```

## Arguments

- path:

  Jalur atau nama file CSV

- ...:

  Argumen tambahan untuk \`readr::read_csv()\`

## Value

Tibble hasil pembacaan CSV

## See also

\[readr::read_csv()\]

Other impor:
[`impor_baca_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/impor_baca_excel.md),
[`input_tulis_csv()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_csv.md),
[`input_tulis_excel()`](https://yandiandiyana.github.io/tidyversindonesia/reference/input_tulis_excel.md)

## Examples

``` r
# Contoh menggunakan file CSV buatan
temp <- tempfile(fileext = ".csv")
write.csv(iris, temp, row.names = FALSE)
impor_baca_csv(temp)
#> Rows: 150 Columns: 5
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): Species
#> dbl (4): Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
#> # A tibble: 150 × 5
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           <dbl>       <dbl>        <dbl>       <dbl> <chr>  
#>  1          5.1         3.5          1.4         0.2 setosa 
#>  2          4.9         3            1.4         0.2 setosa 
#>  3          4.7         3.2          1.3         0.2 setosa 
#>  4          4.6         3.1          1.5         0.2 setosa 
#>  5          5           3.6          1.4         0.2 setosa 
#>  6          5.4         3.9          1.7         0.4 setosa 
#>  7          4.6         3.4          1.4         0.3 setosa 
#>  8          5           3.4          1.5         0.2 setosa 
#>  9          4.4         2.9          1.4         0.2 setosa 
#> 10          4.9         3.1          1.5         0.1 setosa 
#> # ℹ 140 more rows
```
