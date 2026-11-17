test_that("penguin sesuai palmerpenguins::penguins", {
  skip_if_not_installed("palmerpenguins")
  skip_if_not(exists("penguin"), "dataset `penguin` belum dibuat (jalankan data-raw/penguin.R)")
  asli <- palmerpenguins::penguins

  expect_s3_class(penguin, "tbl_df")
  expect_identical(dim(penguin), dim(asli))
  expect_identical(
    names(penguin),
    c("spesies", "pulau", "panjang_paruh_mm", "kedalaman_paruh_mm",
      "panjang_sirip_mm", "massa_tubuh_g", "jenis_kelamin", "tahun")
  )

  # nilai numerik tidak berubah
  expect_identical(penguin$panjang_paruh_mm, asli$bill_length_mm)
  expect_identical(penguin$kedalaman_paruh_mm, asli$bill_depth_mm)
  expect_identical(penguin$panjang_sirip_mm, asli$flipper_length_mm)
  expect_identical(penguin$massa_tubuh_g, asli$body_mass_g)
  expect_identical(penguin$tahun, asli$year)

  # nilai hilang tidak berubah
  expect_identical(sum(is.na(penguin)), sum(is.na(asli)))
  expect_identical(is.na(penguin$jenis_kelamin), is.na(asli$sex))

  # nama diri tetap, jenis kelamin diterjemahkan
  expect_identical(as.character(penguin$spesies), as.character(asli$species))
  expect_identical(as.character(penguin$pulau), as.character(asli$island))
  expect_s3_class(penguin$jenis_kelamin, "factor")
  expect_setequal(levels(penguin$jenis_kelamin), c("betina", "jantan"))
  peta <- c(female = "betina", male = "jantan")
  expect_identical(
    as.character(penguin$jenis_kelamin),
    unname(peta[as.character(asli$sex)])
  )
})
