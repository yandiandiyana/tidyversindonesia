# Mengurutkan faktor berdasarkan frekuensi kemunculan

Padanan fungsi \`forcats::fct_infreq()\`

## Usage

``` r
transformasi_faktor_menurun(f, ...)
```

## Arguments

- f:

  Vektor faktor

- ...:

  Argumen tambahan

## Value

Faktor dengan urutan level berdasarkan frekuensi.

## See also

\[forcats::fct_infreq()\]

## Examples

``` r
f <- factor(c("A","B","A","C"))
transformasi_faktor_menurun(f)
#> [1] A B A C
#> Levels: A B C
```
