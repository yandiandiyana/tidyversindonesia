# Lisensi dan penyediaan data: catatan Phase 5

Tanggal: 24 Oktober 2026.

## Prinsip

Master prompt melarang berasumsi bahwa semua data boleh didistribusikan ulang. Karena itu paket ini **hanya menyimpan satu dataset di dalamnya**: `penguin`. Dataset lokal lainnya dibuat saat dipakai dari paket sumbernya (`R/dataset_lazy.R`), dengan satu-satunya perubahan berupa nama kolom dan, pada tiga dataset, terjemahan nilai kategorikal. Dengan cara itu paket ini tidak mendistribusikan ulang data tersebut; asal data dan hak pakainya tetap diatur oleh paket sumber.

## Yang sudah diverifikasi

| Sumber | Dipakai untuk | Lisensi | Status |
|---|---|---|---|
| palmerpenguins | `penguin` (disimpan di paket) | CC0 | terverifikasi (README paket di CRAN) |
| nycflights13 | `penerbangan` | CC0 | terverifikasi (metadata paket di CRAN) |
| ggplot2 4.0.3 | `mobil_mpg`, `berlian` (dibuat saat dipakai) | MIT + file LICENSE (Posit, PBC) | terverifikasi untuk paketnya |
| tidyr 1.3.2 | `tabel1`..`tabel3`, `tangga_lagu`, `tb_who`, `rumah_tangga`, `pengalaman_pasien` (dibuat saat dipakai) | MIT + file LICENSE | terverifikasi untuk paketnya |

## Yang belum atau tidak dapat diverifikasi, dan alasannya penyediaan "saat dipakai"

| Data | Temuan |
|---|---|
| WHO (di balik `tidyr::who2` dan `table1`-`table3`) | Laporan Global TB WHO berlisensi **CC BY-NC-SA 3.0 IGO** (hanya non-komersial, *share-alike*). Lisensi tepat data yang dimuat tidyr **tidak saya verifikasi**. Menyalinnya ke dalam paket berlisensi MIT berpotensi bermasalah. |
| EPA Fuel Economy (di balik `ggplot2::mpg`) | Tidak diverifikasi. |
| CMS (di balik `tidyr::cms_patient_experience`) | Tidak diverifikasi. |
| `ggplot2::diamonds` | Dokumentasi ggplot2 tidak menyebut sumber; tidak diverifikasi. |
| Billboard (di balik `tidyr::billboard`) | Status hak data peringkat tidak diverifikasi. |
| `datasets::mtcars` | Dipakai untuk `mobil` (dibuat saat dipakai, tidak disalin ke dalam paket). Paket datasets adalah bagian dari R; lisensi data ini tidak saya verifikasi terpisah. Sumber asli: Henderson dan Velleman (1981). |

Karena data di atas tidak disalin ke dalam paket, ketidakpastian ini tidak menghalangi rilis. Yang perlu dijaga: dokumentasi tiap dataset menyatakan bahwa paket ini tidak mendistribusikan ulang datanya, dan pengguna memperoleh data dari paket sumber (yang tetap bertanggung jawab atas hak pakainya).

## Konsekuensi teknis

- Ukuran paket kecil (hanya `penguin` dan berkas contoh kecil).
- Dataset bergantung pada paket ggplot2, tidyr, dan nycflights13, yang seluruhnya sudah ada di `Imports`, ditambah paket datasets (bagian dari R) untuk `mobil`.
- Bila struktur data di paket sumber berubah (nama kolom atau nilai kategorikal), pembuatan dataset berhenti dengan pesan yang jelas, dan uji `test-data-3d.R` gagal sehingga perubahan itu terdeteksi.
- Buku pendamping tidak boleh menyalin data dari buku R4DS; berkas contoh di `inst/extdata/` dibuat sendiri (orisinal).
