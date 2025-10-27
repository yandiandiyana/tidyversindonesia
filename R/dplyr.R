#' Saring
#'
#' Wrapper untuk dplyr::filter()
#' @param .data Dataset
#' @param ... Kondisi filter
#' @return Dataset tersaring
#' @export
saring <- function(.data, ...) {
  dplyr::filter(.data, ...)
}

#' Pilih
#'
#' Wrapper untuk dplyr::select()
#' @param .data Dataset
#' @param ... Nama kolom
#' @return Dataset terpilih kolomnya
#' @export
pilih <- function(.data, ...) {
  dplyr::select(.data, ...)
}

#' Ubah
#'
#' Wrapper untuk dplyr::mutate()
#' @param .data Dataset
#' @param ... Kolom baru / transformasi
#' @return Dataset dengan kolom baru / diubah
#' @export
ubah <- function(.data, ...) {
  dplyr::mutate(.data, ...)
}

#' Buat Kolom Saja
#'
#' Wrapper untuk dplyr::transmute()
#' @param .data Dataset
#' @param ... Kolom baru
#' @return Dataset hanya berisi kolom baru
#' @export
buat_kolom_saja <- function(.data, ...) {
  dplyr::transmute(.data, ...)
}

#' Urutkan
#'
#' Wrapper untuk dplyr::arrange()
#' @param .data Dataset
#' @param ... Kolom untuk diurutkan
#' @return Dataset diurutkan
#' @export
urutkan <- function(.data, ...) {
  dplyr::arrange(.data, ...)
}

#' Ganti Nama
#'
#' Wrapper untuk dplyr::rename()
#' @param .data Dataset
#' @param ... Kolom baru = kolom lama
#' @return Dataset dengan kolom diubah namanya
#' @export
ganti_nama <- function(.data, ...) {
  dplyr::rename(.data, ...)
}

#' Ringkas
#'
#' Wrapper untuk dplyr::summarise()
#' @param .data Dataset
#' @param ... Fungsi ringkasan
#' @return Dataset yang diringkas
#' @export
ringkas <- function(.data, ...) {
  dplyr::summarise(.data, ...)
}

#' Kelompokkan
#'
#' Wrapper untuk dplyr::group_by()
#' @param .data Dataset
#' @param ... Kolom untuk pengelompokan
#' @return Dataset yang sudah dikelompokkan
#' @export
kelompokkan <- function(.data, ...) {
  dplyr::group_by(.data, ...)
}

#' Ambil Baris
#'
#' Wrapper untuk dplyr::slice()
#' @param .data Dataset
#' @param ... Posisi baris
#' @return Dataset yang diambil barisnya
#' @export
ambil_baris <- function(.data, ...) {
  dplyr::slice(.data, ...)
}

intip <- function(x) {
  if (!tibble::is_tibble(x)) x <- tibble::as_tibble(x)

  cat(crayon::bold$green(paste0("Baris: ", nrow(x), "  Kolom: ", ncol(x), "\n")))

  max_name_len <- max(nchar(names(x)))

  for (col_name in names(x)) {
    vec <- x[[col_name]]
    type <- class(vec)[1]

    # pad column names
    padded_name <- format(col_name, width = max_name_len, justify = "left")

    # color variable names white
    cat(crayon::white(paste0("$", padded_name)))

    # color type brown
    cat(crayon::yellow(paste0(" <", type, "> ")))

    # preview first 3 values
    preview_vals <- utils::head(vec, 3)
    preview_str <- sapply(preview_vals, function(v) {
      if (is.na(v)) crayon::red("NA") else crayon::cyan(as.character(v))
    })
    cat(paste(preview_str, collapse = ", "))

    if (nrow(x) > 3) cat(", ...")
    cat("\n")
  }

  invisible(x)
}
