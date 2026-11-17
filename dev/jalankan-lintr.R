# Menjalankan lintr pada paket (pemeriksaan gaya kode). Jalankan dari akar paket:
#   source("dev/jalankan-lintr.R")
# Prasyarat: install.packages("lintr")
# Hasilnya hanya laporan; tidak mengubah berkas apa pun. Salin keluarannya ke Claude.

hasil <- lintr::lint_package()
cat("\nJumlah temuan:", length(hasil), "\n")
if (length(hasil) > 0L) {
  ringkas <- as.data.frame(hasil)
  cat("\nRingkasan menurut jenis:\n")
  print(sort(table(ringkas$linter), decreasing = TRUE))
  cat("\n20 temuan pertama:\n")
  print(utils::head(ringkas[, c("filename", "line_number", "linter", "message")], 20L),
        row.names = FALSE)
}
