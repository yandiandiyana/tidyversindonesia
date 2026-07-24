# Mengurutkan nilai secara menurun

Padanan fungsi \`dplyr::desc()\`

## Usage

``` r
kolom_menurun(x)
```

## Arguments

- x:

  Kolom atau vektor yang akan diurutkan menurun

## Value

Objek yang menandai pengurutan menurun

## See also

\[dplyr::desc()\], \[transformasi_urutkan()\]

## Examples

``` r
df <- tibble::tibble(nama = c("A", "B", "C"), nilai = c(10, 30, 20))

# Urutkan berdasarkan nilai secara menurun
transformasi_urutkan(df, kolom_menurun(nilai))
#> # A tibble: 3 × 2
#>   nama  nilai
#>   <chr> <dbl>
#> 1 B        30
#> 2 C        20
#> 3 A        10
```
