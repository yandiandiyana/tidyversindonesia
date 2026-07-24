# Melihat sekilas struktur data

Padanan fungsi \`dplyr::glimpse()\`

## Usage

``` r
data_lihat_sekilas(data)
```

## Arguments

- data:

  Data frame yang ingin dilihat strukturnya.

## Value

Invisible NULL; hanya menampilkan output di konsol

## See also

\[dplyr::glimpse()\]

## Examples

``` r
data_lihat_sekilas(penguin)
#> Rows: 344
#> Columns: 8
#> $ spesies       <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, …
#> $ pulau         <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torgersen, T…
#> $ panjang_paruh <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34.1, 42.0…
#> $ tebal_paruh   <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18.1, 20.2…
#> $ panjang_sirip <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, 186, 18…
#> $ massa_tubuh   <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 3475, 4250…
#> $ jenis_kelamin <fct> Jantan, Betina, Betina, NA, Betina, Jantan, Betina, Jant…
#> $ tahun         <int> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 20…
```
