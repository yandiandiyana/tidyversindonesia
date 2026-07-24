# Menggabungkan beberapa kolom menjadi satu

Padanan fungsi \`tidyr::unite()\`.

## Usage

``` r
rapi_gabung_kolom(data, col, ..., sep = "_")
```

## Arguments

- data:

  Data frame.

- col:

  Kolom baru.

- ...:

  Kolom yang digabungkan.

- sep:

  Pemisah.

## Value

Data frame dengan kolom baru hasil penggabungan.

## See also

\[tidyr::unite()\]

Other rapi:
[`kolom_ekstrak_angka()`](https://yandiandiyana.github.io/tidyversindonesia/reference/kolom_ekstrak_angka.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
df <- data.frame(tahun = 2020, bulan = "01")
rapi_gabung_kolom(df, tanggal, tahun, bulan, sep = "-")
#>   tanggal
#> 1 2020-01
```
