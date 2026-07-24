# Memilih nilai berdasarkan logika

Padanan fungsi \`dplyr::if_else()\`

## Usage

``` r
kolom_jika_maka(kondisi, nilai_true, nilai_false, missing = NULL)
```

## Arguments

- kondisi:

  Vektor logis (TRUE/FALSE) yang menentukan pemilihan nilai.

- nilai_true:

  Nilai yang diberikan ketika kondisi bernilai TRUE.

- nilai_false:

  Nilai yang diberikan ketika kondisi bernilai FALSE.

- missing:

  Nilai opsional yang diberikan ketika kondisi adalah NA. Jika tidak
  diisi, nilai NA dikembalikan.

## Value

Vektor dengan panjang sama seperti \`kondisi\`, berisi hasil pemilihan
nilai untuk setiap elemen.

## See also

\[dplyr::if_else()\], \[base::ifelse()\]

## Examples

``` r
df <- tibble::tibble(nilai = c(70, 40, 90))

# Menandai apakah nilai lulus atau tidak
dplyr::mutate(df,
  status = kolom_jika_maka(nilai >= 60, "Lulus", "Tidak Lulus")
)
#> # A tibble: 3 × 2
#>   nilai status     
#>   <dbl> <chr>      
#> 1    70 Lulus      
#> 2    40 Tidak Lulus
#> 3    90 Lulus      

# Menangani NA pada kondisi
kolom_jika_maka(c(TRUE, FALSE, NA), "Ya", "Tidak", missing = "Tidak Diketahui")
#> [1] "Ya"              "Tidak"           "Tidak Diketahui"
```
