# Kamus Phase 3a (ringkasan untuk ditinjau)

Dihasilkan otomatis dari spesifikasi. Urutan argumen mengikuti hasil audit di komputer Anda.

## Keluarga `inp_`

| Fungsi lokal | Fungsi asli | Argumen lokal (asli) |
|---|---|---|
| `inp_tibble()` | `tibble::tibble()` | `.baris` (`.rows`), `.perbaikan_nama` (`.name_repair`) |
| `inp_tribble()` | `tibble::tribble()` | (tidak ada yang diterjemahkan) |

## Keluarga `rpi_`

| Fungsi lokal | Fungsi asli | Argumen lokal (asli) |
|---|---|---|
| `rpi_panjang()` | `tidyr::pivot_longer()` | `kolom` (`cols`), `variasi_kolom` (`cols_vary`), `nama_ke` (`names_to`), `awalan_nama` (`names_prefix`), `pemisah_nama` (`names_sep`), `pola_nama` (`names_pattern`), `ptype_nama` (`names_ptypes`), `transformasi_nama` (`names_transform`), `perbaikan_nama` (`names_repair`), `nilai_ke` (`values_to`), `buang_nilai_na` (`values_drop_na`), `ptype_nilai` (`values_ptypes`), `transformasi_nilai` (`values_transform`) |
| `rpi_lebar()` | `tidyr::pivot_wider()` | `kolom_id` (`id_cols`), `perluas_id` (`id_expand`), `nama_dari` (`names_from`), `awalan_nama` (`names_prefix`), `pemisah_nama` (`names_sep`), `templat_nama` (`names_glue`), `urutkan_nama` (`names_sort`), `variasi_nama` (`names_vary`), `perluas_nama` (`names_expand`), `perbaikan_nama` (`names_repair`), `nilai_dari` (`values_from`), `isi_nilai` (`values_fill`), `fungsi_nilai` (`values_fn`), `fungsi_tak_terpakai` (`unused_fn`) |

## Keluarga `trn_`

| Fungsi lokal | Fungsi asli | Argumen lokal (asli) |
|---|---|---|
| `trn_filter()` | `dplyr::filter()` | `.berdasarkan` (`.by`), `.pertahankan` (`.preserve`) |
| `trn_urutkan()` | `dplyr::arrange()` | `.per_kelompok` (`.by_group`) |
| `trn_unik()` | `dplyr::distinct()` | `.simpan_semua` (`.keep_all`) |
| `trn_hitung()` | `dplyr::count()` | `bobot` (`wt`), `urut` (`sort`), `nama` (`name`) |
| `trn_mutasi()` | `dplyr::mutate()` | `.berdasarkan` (`.by`), `.simpan` (`.keep`), `.sebelum` (`.before`), `.setelah` (`.after`) |
| `trn_pilih()` | `dplyr::select()` | (tidak ada yang diterjemahkan) |
| `trn_ubah_nama()` | `dplyr::rename()` | (tidak ada yang diterjemahkan) |
| `trn_pindah()` | `dplyr::relocate()` | `.sebelum` (`.before`), `.setelah` (`.after`) |
| `trn_tarik()` | `dplyr::pull()` | `variabel` (`var`), `nama` (`name`) |
| `trn_gabung_kelompok()` | `dplyr::group_by()` | `.tambah` (`.add`), `.buang_kosong` (`.drop`) |
| `trn_lepas_kelompok()` | `dplyr::ungroup()` | (tidak ada yang diterjemahkan) |
| `trn_statistik_ringkas()` | `dplyr::summarise()` | `.berdasarkan` (`.by`), `.hasil_kelompok` (`.groups`) |
| `trn_iris()` | `dplyr::slice()` | `.berdasarkan` (`.by`), `.pertahankan` (`.preserve`) |
| `trn_iris_kepala()` | `dplyr::slice_head()` | `proporsi` (`prop`), `berdasarkan` (`by`) |
| `trn_iris_ekor()` | `dplyr::slice_tail()` | `proporsi` (`prop`), `berdasarkan` (`by`) |
| `trn_iris_min()` | `dplyr::slice_min()` | `urutan_oleh` (`order_by`), `proporsi` (`prop`), `berdasarkan` (`by`), `dengan_seri` (`with_ties`), `buang_na` (`na_rm`) |
| `trn_iris_maks()` | `dplyr::slice_max()` | `urutan_oleh` (`order_by`), `proporsi` (`prop`), `berdasarkan` (`by`), `dengan_seri` (`with_ties`), `buang_na` (`na_rm`) |
| `trn_iris_acak()` | `dplyr::slice_sample()` | `proporsi` (`prop`), `berdasarkan` (`by`), `bobot_oleh` (`weight_by`), `dengan_pengembalian` (`replace`) |
| `trn_rapikan_nama()` | `janitor::clean_names()` (opsional) | (tidak ada yang diterjemahkan) |

## Keluarga `frm_`

| Fungsi lokal | Fungsi asli | Argumen lokal (asli) |
|---|---|---|
| `frm_diawali()` | `tidyselect::starts_with()` | `cocok` (`match`), `abaikan_kapital` (`ignore.case`), `variabel` (`vars`) |
| `frm_diakhiri()` | `tidyselect::ends_with()` | `cocok` (`match`), `abaikan_kapital` (`ignore.case`), `variabel` (`vars`) |
| `frm_memuat()` | `tidyselect::contains()` | `cocok` (`match`), `abaikan_kapital` (`ignore.case`), `variabel` (`vars`) |
| `frm_cocok()` | `tidyselect::matches()` | `cocok` (`match`), `abaikan_kapital` (`ignore.case`), `variabel` (`vars`) |
| `frm_rentang_angka()` | `tidyselect::num_range()` | `awalan` (`prefix`), `rentang` (`range`), `akhiran` (`suffix`), `lebar` (`width`), `variabel` (`vars`) |
| `frm_semua()` | `tidyselect::everything()` | `variabel` (`vars`) |
| `frm_di_mana()` | `tidyselect::where()` | `fungsi` (`fn`) |
| `frm_salah_satu()` | `tidyselect::any_of()` | `variabel` (`vars`) |
| `frm_turun()` | `dplyr::desc()` | (tidak ada yang diterjemahkan) |
| `frm_jumlah()` | `dplyr::n()` | (tidak ada yang diterjemahkan) |
| `frm_jika_lain()` | `dplyr::if_else()` | `kondisi` (`condition`), `benar` (`true`), `salah` (`false`), `hilang` (`missing`), `ukuran_keluaran` (`size`) |
| `frm_faktor_frekuensi()` | `forcats::fct_infreq()` (opsional) | `bobot` (`w`), `berurut` (`ordered`) |
