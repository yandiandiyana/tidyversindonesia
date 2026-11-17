# Membuat semua dataset lokal. Jalankan dari akar paket:
#   source("data-raw/semua.R")
# Prasyarat: install.packages(c("usethis", "palmerpenguins", "ggplot2", "tidyr"))
# Setiap dataset dibuat terpisah; satu kegagalan tidak menghentikan yang lain.

skrip <- c(
  "penguin"
)

hasil <- vapply(skrip, function(nama) {
  tryCatch({
    source(file.path("data-raw", paste0(nama, ".R")), local = new.env())
    "BERHASIL"
  }, error = function(e) paste("GAGAL:", conditionMessage(e)))
}, character(1))

print(data.frame(dataset = names(hasil), status = unname(hasil), row.names = NULL))
