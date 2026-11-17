# tidyversindonesia: Kamus Argumen dan Lisensi v2 (DRAFT)

Pelengkap `fase1_kamus_v8.md`. Dokumen ini membahas (1) aturan perilaku argumen, (2) kamus konsep argumen, (3) status verifikasi daftar argumen formal, dan (4) lisensi.
**Tidak ada kode yang dijalankan.**

## 1. Status verifikasi

| Tanda | Arti |
|---|---|
| ✔ | Dicocokkan dengan dokumentasi resmi dalam sesi ini |
| ○ | Dari ingatan saya, **belum diverifikasi**; akan diperiksa otomatis oleh uji drift (bagian 5) |

Yang berstatus ✔ saat ini: `ggplot()`, `geom_point()`, nama argumen `labs()`, nama argumen `theme_*` (ggplot2 4.0.x), kolom `mpg`, `flights` dan `mtcars`, serta lisensi pada bagian 6. Selebihnya ○.

**Mengapa tidak semua fungsi saya verifikasi lewat web.** Daftar formal sekitar 70 fungsi dari halaman web hanya cara kedua. Sumber yang benar adalah `formals()` pada versi paket yang benar-benar terpasang. Karena itu Phase 2 memuat uji otomatis (bagian 5) yang membandingkan kamus dengan `formals()` fungsi asli, dan uji itu **gagal** bila ada argumen asli yang belum punya terjemahan. Dengan cara ini tidak ada argumen yang terlewat diam-diam, dan hasilnya bisa Anda jalankan sendiri dengan `devtools::test()`. Bila Anda ingin fungsi tertentu saya verifikasi lewat web lebih dulu, sebut saja.

## 2. Temuan struktur dari fungsi yang sudah diverifikasi

**`ggplot(data = NULL, mapping = aes(), ..., environment = parent.frame())`** (4.0.1, ✔)
Lokal: `vis_ggplot(data = NULL, pemetaan = grf_estetika(), ..., lingkungan = parent.frame())`.

**`geom_point(mapping = NULL, data = NULL, stat = "identity", position = "identity", ..., na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)`** (4.0.1, ✔; tanda `...` hilang dari salinan halaman tetapi ada di versi 3.2.0 dan sesuai perilaku `geom_*`)
Lokal: `grf_geometrik_titik(pemetaan = NULL, data = NULL, statistik = "identity", posisi = "identity", ..., buang_na = FALSE, tampilkan_legenda = NA, warisi_estetika = TRUE)`.

Dua implikasi penting:
1. **Estetika seperti `colour`, `size`, `shape`, `alpha` bukan argumen formal `geom_point()`.** Mereka masuk lewat `...`. Maka `warna = "black"` baru bisa bekerja bila pembungkus menerjemahkan nama di dalam `...` menjadi `colour`. Ini perlu mekanisme sendiri, bukan sekadar mengganti nama formal.
2. **Argumen posisi tetap `mapping` lalu `data`** (kebalikan dari `ggplot()`, yang `data` dulu). Urutan ini dipertahankan agar `grf_geometrik_titik(grf_estetika(...))` bekerja seperti aslinya.

## 3. Aturan perilaku argumen (usulan; mohon persetujuan)

| No | Aturan |
|---|---|
| R1 | **Urutan posisi dipertahankan.** Fungsi lokal memakai urutan formal yang sama dengan fungsi asli, sehingga pemanggilan tanpa nama bekerja identik. |
| R2 | **Nama lokal selalu diterima.** Nama Inggris asli juga diterima tanpa peringatan, supaya pelajar bisa berpindah ke kode standar tanpa gagal. (Alternatif: menolak nama Inggris. Rekomendasi saya: terima.) |
| R3 | **Konflik adalah galat.** Bila nama lokal dan nama asli untuk argumen yang sama diberikan bersamaan (mis. `.sebelum` dan `.before`), fungsi berhenti dengan pesan Indonesia, bukan memilih salah satu secara diam-diam. |
| R4 | **Nama lokal tidak bocor.** Pembungkus menyusun panggilan ke fungsi asli hanya dengan nama asli. Diuji dengan memeriksa argumen yang benar-benar diterima fungsi asli. |
| R5 | **Hanya argumen yang dikenal yang diterjemahkan.** Nama yang dibuat pengguna lewat `...` (kolom baru di `trn_mutasi()`, `trn_statistik_ringkas()`, `inp_tibble()`) tidak pernah diubah. Pengecualian adalah fungsi yang `...`-nya memang membawa parameter estetika (`grf_geometrik_*`, `grf_estetika()`, `grf_label()`, `grf_faset_*`): di sana nama estetika dalam kamus (`warna`, `isian`, `bentuk`, `ukuran`, `alfa`, `tipe_garis`, `ketebalan_garis`, `kelompok`) diterjemahkan, dan nama lain diteruskan apa adanya. |
| R6 | **Nilai argumen tidak diubah.** `"identity"`, `"stack"`, `"blue"`, `21`, `".value"` diteruskan persis. |
| R7 | **Evaluasi tidy dipertahankan.** Ekspresi di `...` diteruskan tanpa dievaluasi lebih dini (data masking, tidyselect, formula seperti `~pulau`). |
| R8 | **Pesan galat dari fungsi asli tidak diterjemahkan** (prinsip *behavioral fidelity*). Pesan milik paket kita (konflik, argumen tidak dikenal) berbahasa Indonesia. |
| R9 | **Dokumentasi dibuat dari kamus**, bukan diketik ulang, supaya "Asli: ..." di setiap argumen tidak bisa menyimpang dari kode. |

Perhatian khusus: `slice_*()` memakai `by` (tanpa titik), sedangkan `filter()`, `mutate()` dan `summarise()` memakai `.by` (○). Keputusan Anda `.by` → `.berdasarkan` saya perluas menjadi `by` → `berdasarkan` untuk keluarga `slice_*`, agar konsisten. Mohon koreksi bila tidak setuju.

## 4. Kamus konsep argumen

Satu istilah per konsep, dipakai di semua fungsi.

| Asli | Lokal | Status |
|---|---|---|
| `data` | `data` | ✔ |
| `mapping` | `pemetaan` | ✔ (keputusan Anda) |
| `stat` | `statistik` | ✔ |
| `position` | `posisi` | ✔ |
| `na.rm` | `buang_na` | ✔ |
| `show.legend` | `tampilkan_legenda` | ✔ |
| `inherit.aes` | `warisi_estetika` | ✔ |
| `environment` | `lingkungan` | ✔ |
| `colour` / `color` | `warna` | keputusan Anda |
| `fill` | `isian` | keputusan Anda |
| `shape` | `bentuk` | keputusan Anda |
| `size` | `ukuran` | keputusan Anda |
| `alpha` | `alfa` | keputusan Anda |
| `linetype` | `tipe_garis` | keputusan Anda |
| `linewidth` | `ketebalan_garis` | keputusan Anda |
| `group` | `kelompok` | ○ |
| `orientation` | `orientasi` | ○ |
| `binwidth` / `bins` | `lebar_bin` / `jumlah_bin` | ○ |
| `method` / `formula` | `metode` / `rumus` | ○ |
| `se` | `selang_kepercayaan` | ○ |
| `level` (di `geom_smooth`) | `tingkat_kepercayaan` | ○ |
| `span` | `rentang` | ○ |
| `.before` / `.after` | `.sebelum` / `.setelah` | keputusan Anda |
| `.by` / `by` | `.berdasarkan` / `berdasarkan` | keputusan Anda (`by` perluasan saya) |
| `.keep` / `.keep_all` | `.simpan` / `.simpan_semua` | usulan |
| `.groups` | `.hasil_kelompok` | usulan |
| `n` / `prop` / `with_ties` | `n` / `proporsi` / `dengan_seri` | usulan |
| `names_to` / `values_to` | `nama_ke` / `nilai_ke` | usulan |
| `names_from` / `values_from` | `nama_dari` / `nilai_dari` | usulan |
| `file` | `berkas` | usulan |
| `skip` / `comment` / `col_names` / `col_types` | `lewati` / `komentar` / `nama_kolom` / `tipe_kolom` | usulan |

## 5. Argumen di luar yang dipakai buku (usulan tahap 2)

Kamus v7 sudah memuat setiap argumen yang **muncul di delapan bab**. Argumen formal lain tiap fungsi diusulkan di bawah ini. Semuanya ○ dan menunggu uji drift.

| Fungsi asli | Argumen formal tambahan (○) | Usulan lokal |
|---|---|---|
| `pivot_longer()` | `cols_vary`, `names_ptypes`, `names_repair`, `values_ptypes`, `values_transform` | `variasi_kolom`, `ptype_nama`, `perbaikan_nama`, `ptype_nilai`, `transformasi_nilai` |
| `pivot_wider()` | `id_expand`, `names_glue`, `names_sort`, `names_vary`, `names_expand`, `values_fill`, `unused_fn` | `perluas_id`, `templat_nama`, `urutkan_nama`, `variasi_nama`, `perluas_nama`, `isi_nilai`, `fungsi_tak_terpakai` |
| `read_csv()` dan sejenisnya | `col_select`, `locale`, `quoted_na`, `trim_ws`, `n_max`, `name_repair`, `num_threads`, `progress`, `skip_empty_rows`, `lazy` | `pilih_kolom`, `lokal`, `na_berkutip`, `pangkas_spasi`, `maks_baris`, `perbaikan_nama`, `jumlah_utas`, `kemajuan`, `lewati_baris_kosong`, `tunda_baca` |
| `write_csv()` | `col_names`, `quote`, `escape`, `eol`, `num_threads`, `progress` | `nama_kolom`, `kutip`, `escape`, `akhir_baris`, `jumlah_utas`, `kemajuan` |
| `mean()` | `trim` | `pangkas` |
| `seq()` | `from`, `to`, `by`, `length.out`, `along.with` | `dari`, `sampai`, `selisih`, `panjang_keluaran`, `sepanjang` |
| `list.files()` | `path`, `pattern`, `all.files`, `full.names`, `recursive`, `ignore.case`, `include.dirs` | `lokasi`, `pola`, `semua_berkas`, `nama_lengkap`, `rekursif`, `abaikan_kapital`, `sertakan_dir` |
| `facet_wrap()` | `nrow`, `ncol`, `scales`, `shrink`, `labeller`, `as.table`, `switch`, `drop`, `dir`, `strip.position`, `axes` | `jumlah_baris`, `jumlah_kolom`, `skala`, `susutkan`, `pelabel`, `urut_tabel`, `pindah`, `buang`, `arah`, `posisi_strip`, `sumbu` |
| `ggsave()` | `device`, `path`, `scale`, `units`, `dpi`, `limitsize`, `bg`, `create.dir` | `perangkat`, `lokasi`, `skala_gambar`, `satuan`, `dpi`, `batasi_ukuran`, `latar`, `buat_dir` |
| `geom_boxplot()` (lokal: `grf_geometrik_boxplot()`) | banyak argumen `outlier.*` dan lainnya, berbeda antar versi | **ditentukan setelah `formals()` 4.0 dibaca**; saya tidak mau menebak |

Keputusan Anda: argumen `scales` pada faset tetap `skala`, dan awalan `grf_faset_skala_` dicadangkan untuk fungsi terkait skala faset di masa depan. Nama `grf_faset_*` sudah membedakannya dari `grf_skala_*`, jadi tidak ada bentrok.

### Uji drift (Phase 2)

Satu berkas uji membaca kamus dan, untuk setiap fungsi asli yang terpasang, membandingkan `names(formals(fungsi_asli))` dengan kamus. Hasilnya:
- Argumen asli tanpa entri kamus: uji **gagal**, dengan daftar argumen yang kurang.
- Entri kamus yang tidak ada lagi di fungsi asli: uji **gagal** (menangkap perubahan versi).
- Argumen sengaja tidak diterjemahkan: dicatat eksplisit dengan alasan.

Uji ini dilewati bila paket asli tidak terpasang (`skip_if_not_installed()`), jadi aman untuk pemeriksaan CRAN.

## 6. Lisensi

| Sumber | Dipakai untuk | Lisensi | Status |
|---|---|---|---|
| nycflights13 | `penerbangan` | CC0 | ✔ metadata paket di CRAN |
| palmerpenguins | `penguin` | CC0; data dikumpulkan oleh Dr. Kristen Gorman dan Palmer Station LTER | ✔ README paket di CRAN |
| ggplot2 4.0.3 | `mobil_mpg`, `berlian` | MIT + file LICENSE (pemegang hak cipta: Posit, PBC) | ✔ untuk paketnya; asal data `mpg` adalah EPA; status hukum data EPA dan asal `diamonds` **belum diverifikasi** |
| tidyr 1.3.2 | `tabel1`–`tabel3`, `tangga_lagu`, `tb_who`, `rumah_tangga`, `pengalaman_pasien` | MIT + file LICENSE | ✔ untuk paketnya; `cms_patient_experience` bersumber dari data publik CMS (data.cms.gov); status hukum sumber `billboard`, `who2`, `household` dan CMS **belum diverifikasi** |
| datasets (bagian R) | `mobil_mtcars` (ditunda) | belum diperiksa | tidak mendesak |
| R4DS (buku) | materi pendamping | CC BY-NC-ND 3.0 (ingatan saya) | ○ belum saya verifikasi pada halaman buku |

Implikasi:
1. **R minimum ≥ 4.1.0.** tidyr 1.3.2 menyatakan `Depends: R (>= 4.1.0)` (✔), dan operator `|>` juga baru ada di R 4.1.
2. **Lisensi paket kita.** Dengan `mobil_mtcars` ditunda, semua sumber yang sudah diverifikasi (CC0 dan MIT) sejalan dengan lisensi MIT untuk paket kita. Usulan awal: MIT + file LICENSE. Belum final: status hukum data EPA, CMS dan `diamonds` masih harus diverifikasi; keputusan akhir di Phase 6.
3. **Pemberitahuan hak cipta.** Menyalin data dari paket ber-lisensi MIT biasanya mensyaratkan mempertahankan pemberitahuan hak ciptanya (ingatan saya, belum diverifikasi). Rencana: berkas `inst/COPYRIGHTS` yang mencantumkan tiap sumber.
4. **Buku pendamping.** R4DS berlisensi CC BY-NC-ND (ingatan saya): terjemahan penuh tidak diizinkan, sehingga buku pendamping harus karya orisinal. Statusnya perlu diperiksa ulang pada halaman buku sebelum Phase 6.
