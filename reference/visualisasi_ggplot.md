# Membuat grafik/plot dari ggplot

Padanan fungsi \`ggplot2::ggplot()\`

## Usage

``` r
visualisasi_ggplot(data, mapping = NULL, ...)
```

## Arguments

- data:

  Data frame atau tibble yang akan divisualisasikan.

- mapping:

  Pemetaan estetika, biasanya dibuat dengan \`estetika()\`.

- ...:

  Argumen tambahan untuk \`ggplot2::ggplot()\`.

## Value

Objek \`ggplot\` yang dapat ditambahkan layer visualisasi.

## See also

\[ggplot2::ggplot()\]

Other visualisasi:
[`estetika()`](https://yandiandiyana.github.io/tidyversindonesia/reference/estetika.md),
[`grafik_facet_baris_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_facet_baris_kolom.md),
[`grafik_facet_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_facet_kolom.md),
[`grafik_geometrik_batang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_batang.md),
[`grafik_geometrik_boxplot()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_boxplot.md),
[`grafik_geometrik_densitas()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_densitas.md),
[`grafik_geometrik_histogram()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_histogram.md),
[`grafik_geometrik_titik()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_titik.md),
[`grafik_geometrik_tren()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_tren.md),
[`grafik_label()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_label.md),
[`grafik_tema_gelap()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_tema_gelap.md),
[`grafik_tema_hampa()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_tema_hampa.md),
[`grafik_tema_klasik()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_tema_klasik.md),
[`grafik_tema_minimal()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_tema_minimal.md),
[`grafik_tema_ringan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_tema_ringan.md),
[`visualisasi_ggplot_simpan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot_simpan.md),
[`visualisasi_ggplot_terakhir()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot_terakhir.md)

## Examples

``` r
# Grafik kosong
visualisasi_ggplot(penguin)


# Grafik dengan pemetaan estetika
visualisasi_ggplot(penguin, estetika(x = mpg, y = hp))
#> Error in geom_blank(): Problem while computing aesthetics.
#> ℹ Error occurred in the 1st layer.
#> Caused by error:
#> ! object 'mpg' not found
```
