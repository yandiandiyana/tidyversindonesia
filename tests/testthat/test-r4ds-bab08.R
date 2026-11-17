# Kompatibilitas R4DS 2e, Bab 8 (Workflow: getting help).
# Contoh berkode: contoh reprex (`y <- 1:4; mean(y)`), `dput()`, dan `Sys.setenv(LANGUAGE = "en")`.
# `reprex::reprex()` bersifat interaktif (papan klip, penampil) dan berada di luar cakupan.

# Uji kompatibilitas buku memakai tabel besar dan memakan waktu; CRAN tidak memerlukannya.
# Tetap berjalan di komputer pengembang (devtools::test(), devtools::check()).
testthat::skip_on_cran()

test_that("Bab 8.2: contoh reprex y <- 1:4; mean(y)", {
  y <- 1:4
  expect_equal(dsr_rerata(y), mean(y))
  expect_equal(dsr_rerata(y), 2.5)
})

test_that("Bab 8.2: dsr_dput() menghasilkan kode yang sama dengan dput(), pada data apa pun", {
  # buku memakai dput(mtcars); mtcars dari paket datasets tetap tersedia di R dasar
  expect_identical(
    capture.output(dsr_dput(datasets::mtcars)),
    capture.output(dput(datasets::mtcars))
  )
  expect_identical(
    capture.output(dsr_dput(mobil_mpg)),
    capture.output(dput(mobil_mpg))
  )
})

test_that("Bab 8.2: keluaran dsr_dput() dapat dijalankan ulang untuk membuat objek yang sama", {
  siswa <- inp_tibble(nomor = 1:3, nama = c("Rina", "Budi", "Sari"))
  kode <- capture.output(dsr_dput(siswa))
  hasil <- eval(parse(text = kode))
  expect_identical(hasil, siswa)
})

test_that("Bab 8.1: Sys.setenv(LANGUAGE = \"en\") tidak berubah", {
  lama <- Sys.getenv("LANGUAGE", unset = NA)
  Sys.setenv(LANGUAGE = "en")
  hasil <- Sys.getenv("LANGUAGE")
  if (is.na(lama)) Sys.unsetenv("LANGUAGE") else Sys.setenv(LANGUAGE = lama)
  expect_identical(hasil, "en")
})
