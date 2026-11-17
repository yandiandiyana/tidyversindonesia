# Mesin penerjemah panggilan ---------------------------------------------------
#
# Fungsi lokal (mis. `trn_filter()`) tidak menghitung apa pun sendiri. Ia
# mengambil panggilannya (`sys.call()`), mengganti nama fungsi dan nama argumen
# lokal dengan padanan aslinya menurut `.kamus_fungsi`, lalu mengevaluasi
# panggilan asli di lingkungan pemanggil.
#
# Karena ekspresi argumen tidak pernah dievaluasi oleh fungsi lokal, tidy
# evaluation (data masking, tidyselect, formula, `...`) bekerja persis seperti
# pada fungsi asli. Nilai argumen tidak pernah diubah.
#
# Aturan perilaku (lihat dev/fase1_argumen_v2.md):
#   R2: nama asli (Inggris) juga diterima; ia lewat tanpa diubah.
#   R3: nama lokal dan nama asli untuk argumen yang sama sekaligus -> galat.
#   R4: yang diteruskan ke fungsi asli hanya nama asli.
#   R5: hanya nama yang ada di kamus yang diterjemahkan; nama buatan pengguna
#       (mis. kolom baru di `trn_mutasi()`) tidak disentuh.

# Menyusun panggilan asli dari panggilan lokal. Fungsi murni (tanpa evaluasi)
# sehingga mudah diuji.
.susun_panggilan <- function(nama_fungsi, panggilan) {
  spec <- .kamus_fungsi[[nama_fungsi]]
  if (is.null(spec)) {
    stop(
      "Fungsi `", nama_fungsi, "()` tidak ada di kamus paket. ",
      "Ini kesalahan internal; mohon dilaporkan.",
      call. = FALSE
    )
  }

  # Paket opsional (Suggests): beri pesan yang jelas bila belum terpasang.
  if (isTRUE(spec$opsional) && !requireNamespace(spec$paket, quietly = TRUE)) {
    stop(
      "`", nama_fungsi, "()` memerlukan paket '", spec$paket,
      "' yang belum terpasang. Pasang dengan install.packages(\"",
      spec$paket, "\").",
      call. = FALSE
    )
  }

  # peta: nama lokal -> nama asli; alias: semua nama asli yang setara.
  peta <- spec$argumen
  alias <- as.list(peta)
  # Sinonim: nama asli lain yang setara (mis. outlier.color untuk outlier.colour).
  # Sinonim itu diterima apa adanya, tetapi memicu konflik bila diberikan
  # bersamaan dengan nama lokalnya.
  if (length(spec$setara) > 0L) {
    for (lokal in names(peta)) {
      sinonim <- names(spec$setara)[unname(spec$setara) == peta[[lokal]]]
      if (length(sinonim) > 0L) {
        alias[[lokal]] <- c(peta[[lokal]], sinonim)
      }
    }
  }
  if (isTRUE(spec$estetika)) {
    for (lokal in names(.estetika)) {
      if (!(lokal %in% names(peta))) {
        peta[[lokal]] <- .estetika[[lokal]][1L]
        alias[[lokal]] <- .estetika[[lokal]]
      }
    }
  }

  nama <- names(panggilan)
  if (is.null(nama)) {
    nama <- rep("", length(panggilan))
  }
  nama_awal <- nama

  # Elemen pertama panggilan adalah fungsinya; argumen mulai dari elemen 2.
  for (i in seq_along(nama)[-1L]) {
    lokal <- nama_awal[i]
    if (!nzchar(lokal) || !(lokal %in% names(peta))) {
      next
    }
    bentrok <- intersect(alias[[lokal]], nama_awal[-i])
    if (length(bentrok) > 0L) {
      stop(
        "Konflik argumen pada `", nama_fungsi, "()`: `", lokal, "` dan `",
        bentrok[1L], "` sama-sama diberikan padahal merujuk ke argumen yang ",
        "sama. Gunakan salah satu.",
        call. = FALSE
      )
    }
    nama[i] <- peta[[lokal]]
  }

  names(panggilan) <- nama
  panggilan[[1L]] <- call("::", as.name(spec$paket), as.name(spec$fungsi))
  panggilan
}

# Menyusun lalu mengevaluasi panggilan asli di lingkungan pemanggil.
.panggil_asli <- function(nama_fungsi, panggilan, lingkungan) {
  eval(.susun_panggilan(nama_fungsi, panggilan), lingkungan)
}
