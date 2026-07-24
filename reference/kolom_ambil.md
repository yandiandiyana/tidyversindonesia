# Mengambil kolom menjadi vektor

Padanan fungsi \`dplyr::pull()\`

## Usage

``` r
kolom_ambil(.data, col)
```

## Arguments

- .data:

  Data frame atau tibble yang berisi kolom yang akan diambil

- col:

  Kolom yang ingin ditarik. Bisa berupa nama kolom (tanpa tanda kutip)
  atau posisi kolom secara numerik. Nilai negatif dapat digunakan untuk
  memilih kolom berdasarkan posisi dari belakang

## Value

Vektor berisi nilai dari kolom yang dipilih

## Examples

``` r
library(tibble)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union

data <- tibble(
  nama = c("A", "B", "C"),
  nilai = c(10, 20, 30)
)

# Mengambil kolom sebagai vektor
kolom_ambil(data, nilai)
#> [1] 10 20 30

# Mengambil kolom kedua
kolom_ambil(data, 2)
#> [1] 10 20 30

# Mengambil kolom terakhir
kolom_ambil(data, -1)
#> [1] 10 20 30
```
