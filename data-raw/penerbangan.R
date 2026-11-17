# CATATAN KEPUTUSAN (24 Okt 2026): hasil pengukuran (bzip2 4,3 MB, xz 4,7 MB, gzip 7,0 MB)
# menunjukkan `penerbangan` tidak dapat disimpan di paket tanpa melampaui batas 5 MB
# CRAN. Dataset ini dibuat saat dipakai dari nycflights13 (lihat R/penerbangan.R).
# Skrip ini disimpan sebagai catatan pengukuran.
#
# Mengukur ukuran dataset `penerbangan` (dari nycflights13::flights) sebelum
# memutuskan cara menyediakannya di paket. Jalankan dari akar paket:
#   source("data-raw/penerbangan.R")
# Skrip ini TIDAK menulis ke folder data/ kecuali SIMPAN <- TRUE di bawah.
# Prasyarat: install.packages("nycflights13")

SIMPAN <- FALSE

source("data-raw/bantu.R", local = TRUE)

asli <- nycflights13::flights

nama_asli <- c(
  "year", "month", "day", "dep_time", "sched_dep_time", "dep_delay",
  "arr_time", "sched_arr_time", "arr_delay", "carrier", "flight", "tailnum",
  "origin", "dest", "air_time", "distance", "hour", "minute", "time_hour"
)
nama_baru <- c(
  "tahun", "bulan", "hari", "waktu_berangkat", "waktu_jadwal_berangkat",
  "keterlambatan_berangkat", "waktu_tiba", "waktu_jadwal_tiba",
  "keterlambatan_tiba", "maskapai", "nomor_penerbangan", "nomor_ekor", "asal",
  "tujuan", "waktu_terbang", "jarak", "jam", "menit", "waktu_jam"
)

stopifnot(identical(names(asli), nama_asli))
penerbangan <- bangun_dataset(asli, nama_baru)
periksa_dataset(asli, penerbangan, nama_asli, nama_baru)
message("penerbangan: ", nrow(penerbangan), " baris, ", ncol(penerbangan),
        " kolom. Semua pemeriksaan lolos.")

cat("\n=== UKURAN penerbangan menurut metode kompresi (byte) ===\n")
for (metode in c("gzip", "bzip2", "xz")) {
  berkas <- tempfile(fileext = ".rda")
  waktu <- system.time(save(penerbangan, file = berkas, compress = metode))[["elapsed"]]
  cat(sprintf("%-6s %10d byte  (%.1f detik)\n", metode, as.integer(file.size(berkas)), waktu))
}
cat("Di memori:", format(object.size(penerbangan), units = "MB"), "\n")

if (isTRUE(SIMPAN)) {
  usethis::use_data(penerbangan, compress = "xz", overwrite = TRUE)
}
cat("\n=== SELESAI ===\n")
