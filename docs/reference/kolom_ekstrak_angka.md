# Mengekstrak angka dari teks

Padanan fungsi \`readr::parse_number()\`

## Usage

``` r
kolom_ekstrak_angka(
  x,
  locale = readr::locale(),
  na = c("", "NA"),
  trim_ws = TRUE
)
```

## Arguments

- x:

  Vektor karakter yang mengandung angka dan teks.

- locale:

  Lokasi numerik (opsional), mengikuti parameter
  \`readr::parse_number()\`.

- na:

  Pasangan teks tertentu yang dianggap sebagai \`NA\`.

- trim_ws:

  Logika: apakah spasi kosong di awal/akhir dihapus sebelum parsing.

## Value

Vektor numerik hasil ekstraksi angka dari teks.

## See also

\[readr::parse_number()\]

Other rapi:
[`rapi_gabung_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_gabung_kolom.md),
[`rapi_hapus_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_hapus_na.md),
[`rapi_isi_na()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_isi_na.md),
[`rapi_pisah_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pisah_kolom.md),
[`rapi_pivot_melebar()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_melebar.md),
[`rapi_pivot_memanjang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/rapi_pivot_memanjang.md)

## Examples

``` r
kolom_ekstrak_angka("Rp 1.500.000")
#> [1] 1.5
kolom_ekstrak_angka("Diskon 20%")
#> [1] 20
kolom_ekstrak_angka(c("abc123", "45kg"))
#> [1] 123  45
```
