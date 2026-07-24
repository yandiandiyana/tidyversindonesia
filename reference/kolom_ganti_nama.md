# Mengganti nama kolom

Padanan fungsi \`dplyr::rename()\`

## Usage

``` r
kolom_ganti_nama(data, ...)
```

## Arguments

- data:

  Data frame

- ...:

  pasangan nama baru = nama lama

## Value

Data frame dengan nama kolom baru

## See also

\[dplyr::rename()\]

## Examples

``` r
df <- data.frame(age = 10)
kolom_ganti_nama(df, umur = age)
#>   umur
#> 1   10
```
