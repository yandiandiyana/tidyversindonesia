# Fungsi bantu untuk skrip pembuat dataset. Dihasilkan oleh
# dev/generator/buat_dataset.py.

terjemahkan_nilai <- function(x, peta) {
  ada <- unique(as.character(x[!is.na(x)]))
  tak_dikenal <- setdiff(ada, names(peta))
  if (length(tak_dikenal) > 0L) {
    stop("Nilai tak dikenal pada data asli: ", paste(tak_dikenal, collapse = ", "),
         call. = FALSE)
  }
  if (is.factor(x)) {
    tingkat <- levels(x)
    if (!all(tingkat %in% names(peta))) {
      stop("Level faktor tak dikenal: ",
           paste(setdiff(tingkat, names(peta)), collapse = ", "), call. = FALSE)
    }
    levels(x) <- unname(peta[tingkat])
    x
  } else {
    unname(peta[as.character(x)])
  }
}

bangun_dataset <- function(asli, nama_baru, peta_nilai = list()) {
  baru <- asli
  for (kolom in names(peta_nilai)) {
    baru[[kolom]] <- terjemahkan_nilai(baru[[kolom]], peta_nilai[[kolom]])
  }
  names(baru) <- nama_baru
  baru
}

periksa_dataset <- function(asli, baru, nama_asli, nama_baru, peta_nilai = list()) {
  stopifnot(
    identical(names(baru), nama_baru),
    identical(dim(baru), dim(asli)),
    identical(class(baru), class(asli)),
    identical(sum(is.na(baru)), sum(is.na(asli)))
  )
  for (i in seq_along(nama_asli)) {
    a <- asli[[nama_asli[i]]]
    b <- baru[[nama_baru[i]]]
    if (nama_asli[i] %in% names(peta_nilai)) {
      peta <- peta_nilai[[nama_asli[i]]]
      stopifnot(identical(as.character(b), unname(peta[as.character(a)])))
      if (is.factor(a)) {
        stopifnot(
          identical(class(a), class(b)),
          identical(levels(b), unname(peta[levels(a)]))
        )
      }
    } else {
      stopifnot(identical(a, b))
    }
  }
  invisible(TRUE)
}
