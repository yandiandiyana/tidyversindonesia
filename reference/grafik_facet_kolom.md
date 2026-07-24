# Facet dengan kolom

Padanan fungsi \`ggplot2::facet_wrap()\`

## Usage

``` r
grafik_facet_kolom(facets, ...)
```

## Arguments

- facets:

  Formula untuk pemisahan

- ...:

  Argumen tambahan

## Value

Layer facet

## See also

\[ggplot2::facet_wrap()\]

Other visualisasi:
[`estetika()`](https://yandiandiyana.github.io/tidyversindonesia/reference/estetika.md),
[`grafik_facet_baris_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_facet_baris_kolom.md),
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
[`visualisasi_ggplot()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot.md),
[`visualisasi_ggplot_simpan()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot_simpan.md),
[`visualisasi_ggplot_terakhir()`](https://yandiandiyana.github.io/tidyversindonesia/reference/visualisasi_ggplot_terakhir.md)

## Examples

``` r
visualisasi_ggplot(penguin, estetika(mpg, hp)) +
  grafik_geometrik_titik() +
  grafik_facet_kolom(~ cyl)
#> Error in combine_vars(data, params$plot_env, vars, drop = params$drop): At least one layer must contain all faceting variables: `cyl`
#> ✖ Plot is missing `cyl`
#> ✖ Layer 1 is missing `cyl`
```
