# Uji drift: membandingkan kamus dengan `formals()` fungsi asli yang terpasang.
# Gagal bila (a) ada argumen asli tanpa padanan di kamus, atau (b) kamus
# memuat argumen yang sudah tidak ada pada fungsi asli.

for (nama in names(.kamus_fungsi)) {
  local({
    nama <- nama
    spec <- .kamus_fungsi[[nama]]

    test_that(paste("drift:", nama), {
      skip_if_not_installed(spec$paket)
      asli <- getExportedValue(spec$paket, spec$fungsi)
      formal_asli <- as.character(setdiff(names(formals(args(asli))), "..."))

      sinonim <- names(spec$setara)

      # (a) setiap argumen asli punya padanan, sengaja tidak diubah, atau
      #     merupakan sinonim dari argumen lain
      hilang <- setdiff(formal_asli, c(unname(spec$argumen), spec$sama, sinonim))
      expect_identical(hilang, character(0))

      # (b) setiap entri kamus masih ada di fungsi asli
      kelebihan <- setdiff(
        c(unname(spec$argumen), spec$sama, sinonim),
        c(formal_asli, spec$melalui_titik)
      )
      expect_identical(kelebihan, character(0))
      expect_true(all(unname(spec$setara) %in% c(unname(spec$argumen), spec$sama)))

      # (c) formal fungsi lokal mengikuti urutan fungsi asli (R1)
      lokal <- get(nama, mode = "function")
      formal_lokal <- as.character(setdiff(names(formals(lokal)), "..."))
      formal_asli <- setdiff(formal_asli, sinonim)
      terjemah <- vapply(formal_asli, function(f) {
        cocok <- names(spec$argumen)[unname(spec$argumen) == f]
        if (length(cocok) > 0L) cocok[1L] else f
      }, character(1))
      expect_true(all(terjemah %in% formal_lokal))
      expect_identical(formal_lokal[formal_lokal %in% terjemah], unname(terjemah))

      # formal lokal tambahan hanya boleh berasal dari `melalui_titik`
      tambahan <- setdiff(formal_lokal, terjemah)
      diizinkan <- c(
        names(spec$argumen)[unname(spec$argumen) %in% spec$melalui_titik],
        intersect(spec$sama, spec$melalui_titik)
      )
      expect_true(all(tambahan %in% diizinkan))
    })
  })
}
