<!-- DRAF. Bagian yang bertanda "BELUM DIJALANKAN" harus diisi setelah pemeriksaannya benar-benar
     dijalankan. Jangan dikirim ke CRAN sebelum semuanya terisi.
     TODO (pemelihara): pastikan dulu apakah versi 0.1.0-0.1.3 pernah terbit di CRAN
     (https://cran.r-project.org/package=tidyversindonesia dan folder Archive). Bila ya, ganti
     "This is a first submission" dengan penjelasan bahwa 0.2.0 adalah desain ulang menyeluruh. -->

## Test environments

* Local: Windows 11 x64, R 4.5.0 (ucrt), `R CMD check --as-cran`
* win-builder (R-devel and R-release): BELUM DIJALANKAN
* Linux and macOS (GitHub Actions or R-hub): BELUM DIJALANKAN

## R CMD check results

Local (Windows, R 4.5.0): 0 errors | 0 warnings | 0 notes.

The remote results above are pending. A NOTE "New submission" is expected on the first
submission.

## Notes for reviewers

* This is a first submission.
* The package is an educational interface for Indonesian-speaking learners of R. The help pages
  and vignettes are written in Indonesian (Bahasa Indonesia), declared with `Language: id`; the
  `Title` and `Description` fields of `DESCRIPTION` are in English.
* The package contains thin wrappers around functions of dplyr, tidyr, readr, tibble, tidyselect
  and ggplot2. Each wrapper forwards the call to the original function by rewriting the call
  (`eval()` of a constructed call such as `dplyr::filter(...)`), so that tidy evaluation is
  preserved. Only argument names are translated; argument values are never changed.
* Only one data set (`penguin`, derived from palmerpenguins, CC0) is stored in the package. All
  other localized data sets are created on first use from the original data sets of ggplot2,
  tidyr, nycflights13 and datasets (part of base R) (see `R/dataset_lazy.R`), so no third-party data are redistributed and
  the data size stays small.
* Examples and tests that use optional packages (arrow, forcats, ggthemes, hexbin, janitor,
  palmerpenguins) are guarded with `requireNamespace()` or `skip_if_not_installed()`.
* No tests, examples or vignettes need an internet connection.
