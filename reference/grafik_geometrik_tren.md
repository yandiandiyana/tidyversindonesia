# Menambahkan garis tren

Padanan fungsi \`ggplot2::geom_smooth()\`

## Usage

``` r
grafik_geometrik_tren(mapping = NULL, method = NULL, ...)
```

## Arguments

- mapping:

  Pemetaan estetika tambahan (opsional)

- method:

  Metode pemodelan seperti \`"lm"\`

- ...:

  Argumen tambahan

## Value

Layer garis semulus (tren)

## See also

\[ggplot2::geom_smooth()\]

Other visualisasi:
[`estetika()`](https://yandiandiyana.github.io/tidyversindonesia/reference/estetika.md),
[`grafik_facet_baris_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_facet_baris_kolom.md),
[`grafik_facet_kolom()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_facet_kolom.md),
[`grafik_geometrik_batang()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_batang.md),
[`grafik_geometrik_boxplot()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_boxplot.md),
[`grafik_geometrik_densitas()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_densitas.md),
[`grafik_geometrik_histogram()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_histogram.md),
[`grafik_geometrik_titik()`](https://yandiandiyana.github.io/tidyversindonesia/reference/grafik_geometrik_titik.md),
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
  grafik_geometrik_tren(method = "lm")
#> Error in ggplot2::geom_smooth(mapping = mapping, method = method, ...): Problem while computing aesthetics.
#> ℹ Error occurred in the 1st layer.
#> Caused by error:
#> ! object 'mpg' not found
```
