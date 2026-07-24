# Memisahkan satu kolom menjadi beberapa kolom

Padanan fungsi \`tidyr::separate()\`.

## Usage

``` r
rapi_pisah_kolom(data, col, into, sep, ...)
```

## Arguments

- data:

  Data frame.

- col:

  Kolom yang ingin dipisah.

- into:

  Nama kolom hasil.

- sep:

  Pola pemisah.

- ...:

  Argumen tambahan.

## Value

Data frame dengan kolom baru hasil pemisahan.

## See also

\[tidyr::separate()\]

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
df <- data.frame(tanggal = c("2020-01", "2020-02"))
rapi_pisah_kolom(df, tanggal, into = c("tahun", "bulan"), sep = "-")
#>   tahun bulan
#> 1  2020    01
#> 2  2020    02
```
