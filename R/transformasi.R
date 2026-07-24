# ============================================================================
# BAGIAN 3: TRANSFORMASI DATA (Transform)
# ============================================================================

#' Memilih kolom tertentu dari data
#'
#' Padanan fungsi `dplyr::select()`
#'
#' @param data Data frame atau tibble
#' @param ... Kolom yang ingin dipilih
#'
#' @return Data frame dengan kolom yang dipilih
#' @examples
#' df <- tibble::tibble(nama = c("A", "B"), usia = c(20, 25))
#' transformasi_seleksi(df, nama)
#'
#' @export
#' @seealso [dplyr::select()]
#' @family transformasi
transformasi_seleksi <- function(data, ...) {
  dplyr::select(data, ...)
}

#' Menyaring baris berdasarkan kondisi tertentu
#'
#' Padanan fungsi `dplyr::filter()`
#'
#' @param data Data frame atau tibble
#' @param ... Kondisi logika untuk menyaring baris
#'
#' @return Data frame hasil penyaringan
#' @examples
#' df <- tibble::tibble(nama = c("A", "B"), usia = c(20, 30))
#' transformasi_filter(df, usia > 25)
#'
#' @export
#' @seealso [dplyr::filter()]
#' @family transformasi
transformasi_filter <- function(data, ...) {
  dplyr::filter(data, ...)
}

#' Membuat atau mengubah kolom dalam data
#'
#' Padanan fungsi `dplyr::mutate()`
#'
#' @param data Data frame atau tibble
#' @param ... Ekspresi untuk membuat atau mengubah kolom
#'
#' @return Data frame dengan kolom baru atau yang telah diperbarui
#' @examples
#' df <- tibble::tibble(usia_bulan = c(120, 180))
#' transformasi_mutasi(df, usia_tahun = usia_bulan / 12)
#'
#' @export
#' @seealso [dplyr::mutate()]
#' @family transformasi
transformasi_mutasi <- function(data, ...) {
  dplyr::mutate(data, ...)
}

#' Mengurutkan baris dalam data
#'
#' Padanan fungsi `dplyr::arrange()`
#'
#' @param data Data frame atau tibble
#' @param ... Kolom yang digunakan untuk pengurutan
#'
#' @return Data frame yang telah diurutkan
#' @examples
#' df <- tibble::tibble(nama = c("A", "B"), usia = c(25, 20))
#' transformasi_urutkan(df, usia)
#'
#' @export
#' @seealso [dplyr::arrange()]
#' @family transformasi
transformasi_urutkan <- function(data, ...) {
  dplyr::arrange(data, ...)
}

#' Memilih hanya baris berbeda (distingsi) tanpa duplikat
#'
#' Padanan fungsi `dplyr::distinct()`
#'
#' @param data Data frame
#' @param ... Kolom opsional
#'
#' @return Data frame berbeda (distingsi) tanpa duplikat
#'
#' @examples
#' df <- data.frame(a = c(1,1,2))
#' transformasi_distingsi(df)
#'
#' @export
#' @seealso [dplyr::distinct()]
#' @family transformasi
transformasi_distingsi <- function(data, ...) {
  dplyr::distinct(data, ...)
}

#' Relokasi kolom dalam data
#'
#' Padanan fungsi `dplyr::relocate()`
#'
#' @param data Data frame
#' @param ... Kolom yang ingin dipindahkan
#' @param .before Kolom tujuan sebelum posisi relokasi
#' @param .after Kolom tujuan setelah posisi relokasi
#'
#' @return Data frame dengan kolom yang sudah dipindah
#' @family transformasi
#' @export
transformasi_relokasi <- function(data, ..., .before = NULL, .after = NULL) {

  if (!is.null(.before) && !is.null(.after)) {
    rlang::abort("Hanya salah satu dari `.before` atau `.after` yang boleh digunakan.")
  }

  if (!is.null(.before)) {
    return(dplyr::relocate(data, ..., .before = .before))
  }

  if (!is.null(.after)) {
    return(dplyr::relocate(data, ..., .after = .after))
  }

  # default
  dplyr::relocate(data, ...)
}

#' Merangkum data menjadi nilai statistik ringkas
#'
#' Padanan fungsi `dplyr::summarize()`
#'
#' @param data Data frame atau tibble (biasanya dikelompokkan)
#' @param ... Ekspresi ringkasan yang ingin dihitung
#'
#' @return Data frame hasil peringkasan
#' @examples
#' df <- tibble::tibble(usia = c(20, 30, 40))
#' transformasi_statistik_ringkas(df, rata = mean(usia))
#'
#' @export
#' @seealso [dplyr::summarize()]
#' @family transformasi
transformasi_statistik_ringkas <- function(data, ...) {
  dplyr::summarize(data, ...)
}

#' Mengelompokkan data berdasarkan kolom tertentu
#'
#' Padanan fungsi `dplyr::group_by()`
#'
#' @param data Data frame atau tibble
#' @param ... Kolom yang digunakan untuk pengelompokan
#'
#' @return Data frame bertipe `grouped_df`
#' @examples
#' df <- tibble::tibble(jk = c("L", "P", "L"), usia = c(20, 22, 25))
#' transformasi_kelompok_berdasarkan(df, jk)
#'
#' @export
#' @seealso [dplyr::group_by()]
#' @family transformasi
transformasi_kelompok_berdasarkan <- function(data, ...) {
  dplyr::group_by(data, ...)
}

#' Melepas pengelompokan dari data
#'
#' Padanan fungsi `dplyr::ungroup()`
#'
#' @param data Data frame atau tibble yang sudah dikelompokkan
#'
#' @return Data frame tanpa pengelompokan
#' @examples
#' df <- tibble::tibble(jk = c("L", "P", "L"), usia = c(20, 22, 25))
#' g <- transformasi_kelompok_berdasarkan(df, jk)
#' transformasi_kelompok_hapus(g)
#'
#' @export
#' @seealso [dplyr::ungroup()]
#' @family transformasi
transformasi_kelompok_hapus <- function(data) {
  dplyr::ungroup(data)
}

#' Memotong baris data berdasarkan indeks
#'
#' Padanan fungsi `dplyr::slice()`
#'
#' @param data Data frame atau tibble
#' @param ... Indeks baris yang ingin dipilih
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong <- function(data, ...) {
  dplyr::slice(data, ...)
}

#' Memotong baris bagian awal (kepala)
#'
#' Padanan fungsi `dplyr::slice_head()`
#'
#' @param data Data frame atau tibble
#' @param n Jumlah baris
#' @param prop Proporsi baris
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong_kepala <- function(data, n = NULL, prop = NULL) {

  if (!is.null(n) && !is.null(prop)) {
    rlang::abort("Gunakan hanya satu: `n` atau `prop`.")
  }

  if (!is.null(n)) {
    return(dplyr::slice_head(data, n = n))
  }

  if (!is.null(prop)) {
    return(dplyr::slice_head(data, prop = prop))
  }

  # default dplyr: n = 5
  dplyr::slice_head(data, n = 5)
}

#' Memotong baris bagian akhir (ekor)
#'
#' Padanan fungsi `dplyr::slice_tail()`
#'
#' @param data Data frame atau tibble
#' @param n Jumlah baris
#' @param prop Proporsi baris
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong_ekor <- function(data, n = NULL, prop = NULL) {

  if (!is.null(n) && !is.null(prop)) {
    rlang::abort("Gunakan hanya satu: `n` atau `prop`.")
  }

  if (!is.null(n)) {
    return(dplyr::slice_tail(data, n = n))
  }

  if (!is.null(prop)) {
    return(dplyr::slice_tail(data, prop = prop))
  }

  # default dplyr: n = 5
  dplyr::slice_tail(data, n = 5)
}

#' Memotong baris berdasarkan nilai minimum kolom
#'
#' Padanan fungsi `dplyr::slice_min()`
#'
#' @param data Data frame atau tibble
#' @param order_by Kolom acuan
#' @param n Jumlah baris
#' @param prop Proporsi baris
#' @param with_ties Sertakan nilai yang sama
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong_minimum <- function(data, order_by,
                                        n = NULL, prop = NULL, with_ties = TRUE) {

  if (!is.null(n) && !is.null(prop)) {
    rlang::abort("Gunakan hanya satu: `n` atau `prop`.")
  }

  if (!is.null(n)) {
    return(
      dplyr::slice_min(
        data,
        order_by = {{ order_by }},
        n = n,
        with_ties = with_ties
      )
    )
  }

  if (!is.null(prop)) {
    return(
      dplyr::slice_min(
        data,
        order_by = {{ order_by }},
        prop = prop,
        with_ties = with_ties
      )
    )
  }

  # default dplyr: n = 1
  dplyr::slice_min(
    data,
    order_by = {{ order_by }},
    n = 1,
    with_ties = with_ties
  )
}

#' Memotong baris berdasarkan nilai maksimum kolom
#'
#' Padanan fungsi `dplyr::slice_max()`
#'
#' @param data Data frame atau tibble
#' @param order_by Kolom acuan
#' @param n Jumlah baris
#' @param prop Proporsi baris
#' @param with_ties Sertakan nilai yang sama.
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong_maksimum <- function(data, order_by,
                                         n = NULL, prop = NULL, with_ties = TRUE) {

  if (!is.null(n) && !is.null(prop)) {
    rlang::abort("Gunakan hanya satu: `n` atau `prop`.")
  }

  if (!is.null(n)) {
    return(
      dplyr::slice_max(
        data,
        order_by = {{ order_by }},
        n = n,
        with_ties = with_ties
      )
    )
  }

  if (!is.null(prop)) {
    return(
      dplyr::slice_max(
        data,
        order_by = {{ order_by }},
        prop = prop,
        with_ties = with_ties
      )
    )
  }

  # default dplyr: n = 1
  dplyr::slice_max(
    data,
    order_by = {{ order_by }},
    n = 1,
    with_ties = with_ties
  )
}

#' Memotong baris secara acak
#'
#' Padanan fungsi `dplyr::slice_sample()`
#'
#' @param data Data frame atau tibble
#' @param n Jumlah baris acak
#' @param prop Proporsi baris acak
#' @param weight_by Kolom pembobot
#' @param replace Sampling dengan pengulangan atau tidak
#'
#' @return Data frame
#' @family transformasi
#' @export
transformasi_potong_acak <- function(data, n = NULL, prop = NULL,
                                     weight_by = NULL, replace = FALSE) {

  if (!is.null(n) && !is.null(prop)) {
    rlang::abort("Gunakan hanya satu: `n` atau `prop`.")
  }

  if (!is.null(n)) {
    return(
      dplyr::slice_sample(
        data,
        n = n,
        weight_by = {{ weight_by }},
        replace = replace
      )
    )
  }

  if (!is.null(prop)) {
    return(
      dplyr::slice_sample(
        data,
        prop = prop,
        weight_by = {{ weight_by }},
        replace = replace
      )
    )
  }

  # default dplyr: n = 1
  dplyr::slice_sample(
    data,
    n = 1,
    weight_by = {{ weight_by }},
    replace = replace
  )
}

#' Mengurutkan faktor berdasarkan frekuensi kemunculan
#'
#' Padanan fungsi `forcats::fct_infreq()`
#'
#' @param f Vektor faktor
#' @param ... Argumen tambahan
#'
#' @return Faktor dengan urutan level berdasarkan frekuensi.
#' @examples
#' f <- factor(c("A","B","A","C"))
#' transformasi_faktor_menurun(f)
#'
#' @export
#' @seealso [forcats::fct_infreq()]
transformasi_faktor_menurun <- function(f, ...) {
  forcats::fct_infreq(f, ...)
}
