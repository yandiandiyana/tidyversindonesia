# Menampilkan beberapa baris terakhir dari data frame

Padanan fungsi \`utils::tail()\`

## Usage

``` r
data_lihat_ekor(data, n = 6)
```

## Arguments

- data:

  Data frame atau vektor

- n:

  Jumlah baris yang ingin ditampilkan (default = 6)

## Value

Data frame berisi baris akhir

## See also

\[utils::tail()\]

## Examples

``` r
data_lihat_ekor(penguin, 3)
#>       spesies pulau panjang_paruh tebal_paruh panjang_sirip massa_tubuh
#> 342 Chinstrap Dream          49.6        18.2           193        3775
#> 343 Chinstrap Dream          50.8        19.0           210        4100
#> 344 Chinstrap Dream          50.2        18.7           198        3775
#>     jenis_kelamin tahun
#> 342        Jantan  2009
#> 343        Jantan  2009
#> 344        Betina  2009
```
