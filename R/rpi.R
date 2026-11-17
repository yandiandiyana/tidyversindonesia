# Berkas ini DIHASILKAN oleh dev/generator/buat_pembungkus.py. Jangan disunting
# langsung; ubah spesifikasinya lalu jalankan ulang generator.

#' Ubah data menjadi format panjang
#'
#' Versi Bahasa Indonesia dari [tidyr::pivot_longer()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Nilai argumen (misalnya `".value"`) tidak diubah.
#'
#' @param data Tabel data. Sama dengan asli: `data`.
#' @param kolom Variabel faset untuk kolom, ditulis dengan `vars()`. Asli:
#'   `cols`.
#' @param ... Argumen lain, ditulis seperti pada [tidyr::pivot_longer()].
#' @param variasi_kolom Urutan baris hasil bila beberapa kolom dipanjangkan.
#'   Asli: `cols_vary`.
#' @param nama_ke Nama kolom baru untuk nama-nama kolom lama. Asli: `names_to`.
#' @param awalan_nama Ekspresi reguler awalan yang dibuang dari nama kolom.
#'   Asli: `names_prefix`.
#' @param pemisah_nama Pemisah untuk memecah atau menyusun nama kolom. Asli:
#'   `names_sep`.
#' @param pola_nama Ekspresi reguler untuk memecah nama kolom. Asli:
#'   `names_pattern`.
#' @param ptype_nama Prototipe tipe untuk kolom nama. Asli: `names_ptypes`.
#' @param transformasi_nama Fungsi yang diterapkan pada kolom nama. Asli:
#'   `names_transform`.
#' @param perbaikan_nama Cara memperbaiki nama kolom hasil. Asli:
#'   `names_repair`.
#' @param nilai_ke Nama kolom baru untuk nilai. Asli: `values_to`.
#' @param buang_nilai_na Apakah baris bernilai `NA` dibuang. Asli:
#'   `values_drop_na`.
#' @param ptype_nilai Prototipe tipe untuk kolom nilai. Asli: `values_ptypes`.
#' @param transformasi_nilai Fungsi yang diterapkan pada kolom nilai. Asli:
#'   `values_transform`.
#'
#' @return Sebuah tabel data, sama seperti [tidyr::pivot_longer()].
#'
#' @section Padanan dengan fungsi asli:
#' `rpi_panjang()` memanggil [tidyr::pivot_longer()].
#'
#' @examples
#' lebar <- inp_tibble(id = 1:2, a = c(1, 2), b = c(3, 4))
#' rpi_panjang(lebar, kolom = c(a, b), nama_ke = "variabel", nilai_ke = "nilai")
#' rpi_panjang(lebar, kolom = !id, nama_ke = "variabel", nilai_ke = "nilai")
#'
#' # Setara dengan kode standar:
#' tidyr::pivot_longer(lebar, cols = c(a, b), names_to = "variabel",
#'                     values_to = "nilai")
#' @export
rpi_panjang <- function(data, kolom, ..., variasi_kolom, nama_ke, awalan_nama,
                        pemisah_nama, pola_nama, ptype_nama,
                        transformasi_nama, perbaikan_nama, nilai_ke,
                        buang_nilai_na, ptype_nilai, transformasi_nilai) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("rpi_panjang", .panggilan, .lingkungan)
}

#' Ubah data menjadi format lebar
#'
#' Versi Bahasa Indonesia dari [tidyr::pivot_wider()]. Hanya nama fungsi dan
#' nama argumen yang diterjemahkan; perilaku dan nilai argumen sama dengan
#' fungsi asli. Kebalikan dari [rpi_panjang()].
#'
#' @param data Tabel data. Sama dengan asli: `data`.
#' @param ... Argumen lain, ditulis seperti pada [tidyr::pivot_wider()].
#' @param kolom_id Kolom pengenal baris; bawaannya semua kolom selain
#'   `nama_dari` dan `nilai_dari`. Asli: `id_cols`.
#' @param perluas_id Apakah kombinasi pengenal yang tidak ada ditambahkan.
#'   Asli: `id_expand`.
#' @param nama_dari Kolom yang nilainya menjadi nama kolom baru. Asli:
#'   `names_from`.
#' @param awalan_nama Ekspresi reguler awalan yang dibuang dari nama kolom.
#'   Asli: `names_prefix`.
#' @param pemisah_nama Pemisah untuk memecah atau menyusun nama kolom. Asli:
#'   `names_sep`.
#' @param templat_nama Templat glue untuk nama kolom baru. Asli: `names_glue`.
#' @param urutkan_nama Apakah kolom baru diurutkan menurut nama. Asli:
#'   `names_sort`.
#' @param variasi_nama Urutan kolom baru bila ada beberapa `nama_dari` dan
#'   `nilai_dari`. Asli: `names_vary`.
#' @param perluas_nama Apakah kombinasi nama yang tidak ada ditambahkan. Asli:
#'   `names_expand`.
#' @param perbaikan_nama Cara memperbaiki nama kolom hasil. Asli:
#'   `names_repair`.
#' @param nilai_dari Kolom yang nilainya mengisi kolom baru. Asli:
#'   `values_from`.
#' @param isi_nilai Nilai pengisi untuk sel yang hilang. Asli: `values_fill`.
#' @param fungsi_nilai Fungsi untuk meringkas nilai yang berulang. Asli:
#'   `values_fn`.
#' @param fungsi_tak_terpakai Fungsi untuk meringkas kolom yang tidak dipakai.
#'   Asli: `unused_fn`.
#'
#' @return Sebuah tabel data, sama seperti [tidyr::pivot_wider()].
#'
#' @section Padanan dengan fungsi asli:
#' `rpi_lebar()` memanggil [tidyr::pivot_wider()].
#'
#' @examples
#' panjang <- inp_tibble(
#'   id = c(1, 1, 2, 2),
#'   kunci = c("a", "b", "a", "b"),
#'   nilai = 1:4
#' )
#' rpi_lebar(panjang, nama_dari = kunci, nilai_dari = nilai)
#'
#' # Setara dengan kode standar:
#' tidyr::pivot_wider(panjang, names_from = kunci, values_from = nilai)
#' @export
rpi_lebar <- function(data, ..., kolom_id, perluas_id, nama_dari, awalan_nama,
                      pemisah_nama, templat_nama, urutkan_nama, variasi_nama,
                      perluas_nama, perbaikan_nama, nilai_dari, isi_nilai,
                      fungsi_nilai, fungsi_tak_terpakai) {
  .panggilan <- sys.call()
  .lingkungan <- parent.frame()
  .panggil_asli("rpi_lebar", .panggilan, .lingkungan)
}
