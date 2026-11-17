# tidyversindonesia 0.2.0

Desain ulang menyeluruh. Versi ini tidak kompatibel dengan versi 0.1.x yang lebih lama.

* 108 fungsi berbahasa Indonesia dalam sembilan keluarga (`imp_`, `inp_`, `rpi_`,
  `trn_`, `frm_`, `vis_`, `grf_`, `dsr_`, `dtr_`). Fungsi memanggil fungsi tidyverse asli;
  hanya nama fungsi dan nama argumen yang diterjemahkan, nilai argumen tidak diubah.
* 12 dataset berbahasa Indonesia (`penguin`, `penerbangan`, `mobil`, `mobil_mpg`, `berlian`,
  `tabel1`, `tabel2`, `tabel3`, `tangga_lagu`, `tb_who`, `rumah_tangga`,
  `pengalaman_pasien`). Hanya `penguin` disimpan di dalam paket; lainnya dibuat saat
  dipakai dari paket sumbernya sehingga paket ini tidak mendistribusikan ulang datanya.
* `imp_berkas_contoh()` dan berkas CSV contoh orisinal untuk berlatih mengimpor data.
* Pengujian kompatibilitas dengan seluruh contoh dan latihan berkode di delapan bab
  Bagian I buku *R for Data Science* edisi ke-2.
* Enam vignette: mulai cepat, pemetaan fungsi, kamus dataset, kompatibilitas R4DS,
  panduan migrasi, dan pemecahan masalah.
* Dataset `mobil` (dari `datasets::mtcars`): nama baris dipindahkan menjadi kolom `mobil`, nama
  kolom diterjemahkan, nilai dan satuan tidak diubah. Seperti dataset lain (kecuali `penguin`),
  dibuat saat dipakai sehingga data tidak didistribusikan ulang.
* `dsr_daftar_berkas()` menerima argumen `harfiah` (asli: `fixed`), yang ditambahkan ke
  `list.files()` pada R 4.6.0. Pada R yang lebih lama, argumen ini tidak tersedia.
* `DESCRIPTION` memakai `Language: id` untuk menandai dokumentasi berbahasa Indonesia.
