# Daftar periksa rilis (Phase 6)

Diperbarui: 17 November 2026. Paket ini **belum dikirim ke CRAN** dan **belum ada jaminan diterima**.

Tanda: ✔ terbukti di komputer pengguna · ⏳ belum dijalankan · ❓ belum dapat dipastikan · 👤 butuh tindakan atau keputusan pengguna

## Kualitas kode dan uji

| Item | Status | Catatan |
|---|---|---|
| `devtools::check()` lokal (Windows 11, R 4.5.0), termasuk vignette | ✔ | 0 galat, 0 peringatan, 0 catatan |
| `devtools::test()` | ✔ | 2.753 pemeriksaan lolos |
| Kompatibilitas R4DS Bagian I (delapan bab) | ✔ | 233 butir cakupan; semua contoh berkode lolos pada uji terakhir pengguna. Butir 3.4 (`mtcars`) kini kelas B dengan `mobil`: uji barunya belum dijalankan |
| Dataset `mobil` (baru): `test-data-3d.R`, `test-mobil.R`, uji Bab 3.4 | ⏳ 👤 | kode ditulis tanpa R. Jalankan `devtools::document()` dua kali, lalu `devtools::test()` dan `devtools::check()` |
| `skip_on_cran()` pada delapan berkas `test-r4ds-bab*.R` | ⏳ 👤 | ukur waktu uji; simulasi CRAN: `Sys.setenv(NOT_CRAN = "false")` lalu `devtools::test()` |
| Uji dengan ggplot2 terbaru (4.0.4; uji saat ini memakai 4.0.3) | ⏳ 👤 | `install.packages("ggplot2")` lalu `devtools::test()` |
| `lintr` | ⏳ 👤 | `source("dev/jalankan-lintr.R")` |

## Platform lain

| Item | Status | Catatan |
|---|---|---|
| win-builder (R-devel dan R-release) | ⏳ 👤 | `devtools::check_win_devel()` dan `devtools::check_win_release()`; mengunggah paket ke layanan CRAN dan membalas ke email penjaga paket |
| Linux dan macOS | ⏳ 👤 | memerlukan repositori GitHub (GitHub Actions) atau R-hub |
| `R CMD check` dengan pemeriksaan "incoming" CRAN | ⏳ 👤 | `devtools::check(cran = TRUE, remote = TRUE, manual = FALSE)` |

## Metadata dan dokumentasi

| Item | Status | Catatan |
|---|---|---|
| Lisensi paket (MIT + file LICENSE) | ✔ | kompatibel dengan seluruh sumber yang dibundel |
| Lisensi data | ✔ | hanya `penguin` (CC0) disimpan; data lain dibuat saat dipakai (`dev/LISENSI_DATA.md`) |
| README.Rmd, NEWS.md | ✔ | |
| README.md dirender | ✔ | berkas ada dan berisi keluaran (dicek 17 Nov). Angka fungsi dan dataset diubah manual; jalankan `devtools::build_readme()` sekali lagi |
| Enam vignette | ✔ | dibangun tanpa galat dalam `check()` |
| `cran-comments.md` | draf | bagian platform lain masih kosong |
| `URL` dan `BugReports` di DESCRIPTION | ⏳ 👤 | menunggu alamat repositori |
| Nomor versi rilis | ✔ 👤 | 0.2.0 (keputusan pengguna, 17 Nov). Harus lebih tinggi dari semua versi yang pernah terbit di CRAN |
| Riwayat CRAN versi 0.1.0-0.1.3 | ⏳ 👤 | cek `cran.r-project.org/package=tidyversindonesia`, folder `Archive`, dan email dari CRAN; ubah teks "first submission" bila pernah terbit |
| `Language: id` di DESCRIPTION | ❓ | ditambahkan; belum diuji oleh `check(cran = TRUE)` (dapat memengaruhi pemeriksaan ejaan) |
| `Title` dan `Description` berbahasa Inggris | ✔ | |
| Dokumentasi bantuan dan vignette berbahasa Indonesia | ❓ | teks kebijakan CRAN yang pasti tentang dokumentasi non-Inggris belum saya temukan; jawaban nyata hanya didapat dari pemeriksaan CRAN |

## Risiko penerimaan yang saya ketahui

1. **Bahasa dokumentasi** (lihat ❓ di atas). Bisa memicu pertanyaan penelaah CRAN.
2. **Ketergantungan Imports pada nycflights13** (sekitar 4,5 MB), hanya untuk dataset `penerbangan`. Sah menurut kebijakan, tetapi menambah ukuran pemasangan.
3. **Pembungkus memakai `eval()` pada panggilan yang disusun.** Dijelaskan di `cran-comments.md`; ini pola yang jarang, sehingga penelaah mungkin meminta penjelasan lebih lanjut.
4. **Sembilan nama keluarga baru** (`imp_`, `inp_`, ...) tidak berisiko bentrok nama dengan paket lain, tetapi nama paket "tidyversindonesia" memuat kata "tidyverse"; belum diperiksa apakah ada kebijakan merek dagang yang relevan.
5. **Hasil dari platform lain belum ada.** Sampai ini dijalankan, status "siap kirim" tidak boleh dinyatakan.
