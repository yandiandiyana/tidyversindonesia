# Membuat dataset `penguin` dari palmerpenguins::penguins.
#
# Jalankan dari akar paket:  source("data-raw/penguin.R")
# Prasyarat: install.packages(c("palmerpenguins", "usethis"))
#
# Skrip ini berhenti dengan galat bila ada yang tidak sesuai harapan, supaya
# perubahan pada data asli tidak lolos diam-diam.

asli <- palmerpenguins::penguins

nama_asli <- c(
  "species", "island", "bill_length_mm", "bill_depth_mm",
  "flipper_length_mm", "body_mass_g", "sex", "year"
)
nama_lokal <- c(
  "spesies", "pulau", "panjang_paruh_mm", "kedalaman_paruh_mm",
  "panjang_sirip_mm", "massa_tubuh_g", "jenis_kelamin", "tahun"
)
stopifnot(identical(names(asli), nama_asli))
stopifnot(is.factor(asli$sex))

penguin <- asli
names(penguin) <- nama_lokal

# Terjemahan nilai jenis kelamin (faktor dipertahankan; NA tetap NA).
peta_kelamin <- c(female = "betina", male = "jantan")
tingkat <- levels(penguin$jenis_kelamin)
stopifnot(setequal(tingkat, names(peta_kelamin)))
levels(penguin$jenis_kelamin) <- unname(peta_kelamin[tingkat])

# Pemeriksaan: hanya nama kolom dan nilai jenis kelamin yang berbeda.
stopifnot(
  identical(dim(penguin), dim(asli)),
  identical(sum(is.na(penguin)), sum(is.na(asli))),
  identical(as.character(penguin$spesies), as.character(asli$species)),
  identical(as.character(penguin$pulau), as.character(asli$island)),
  identical(penguin$panjang_paruh_mm, asli$bill_length_mm),
  identical(penguin$kedalaman_paruh_mm, asli$bill_depth_mm),
  identical(penguin$panjang_sirip_mm, asli$flipper_length_mm),
  identical(penguin$massa_tubuh_g, asli$body_mass_g),
  identical(penguin$tahun, asli$year),
  identical(
    as.character(penguin$jenis_kelamin),
    unname(peta_kelamin[as.character(asli$sex)])
  )
)

message("penguin: ", nrow(penguin), " baris, ", ncol(penguin), " kolom. Semua pemeriksaan lolos.")
usethis::use_data(penguin, overwrite = TRUE)
