# Menampilkan beberapa baris pertama dari data frame

Padanan fungsi \`utils::head()\`

## Usage

``` r
data_lihat_kepala(data, n = 6)
```

## Arguments

- data:

  Data frame atau vektor

- n:

  Jumlah baris yang ingin ditampilkan (default = 6).

## Value

Data frame berisi baris awal.

## See also

\[utils::head()\]

## Examples

``` r
data_lihat_kepala(penguin, 3)
#>   spesies     pulau panjang_paruh tebal_paruh panjang_sirip massa_tubuh
#> 1  Adelie Torgersen          39.1        18.7           181        3750
#> 2  Adelie Torgersen          39.5        17.4           186        3800
#> 3  Adelie Torgersen          40.3        18.0           195        3250
#>   jenis_kelamin tahun
#> 1        Jantan  2007
#> 2        Betina  2007
#> 3        Betina  2007
```
