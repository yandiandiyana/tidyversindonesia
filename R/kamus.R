# Kamus fungsi ---------------------------------------------------------------
#
# BERKAS INI DIHASILKAN oleh dev/generator/buat_pembungkus.py (kecuali entri
# yang ditandai "dikelola tangan"). Sumber tunggal pemetaan fungsi dan
# argumen: lokal -> asli.
#
# Daftar argumen formal fungsi asli berasal dari audit di komputer pengguna
# (dev/generator/formals_terverifikasi.txt) dan DIPERIKSA OTOMATIS oleh
# tests/testthat/test-drift.R terhadap `formals()` paket yang terpasang.
#
# Isi tiap entri (lihat `.spec()`):
#   paket, fungsi  : fungsi asli, mis. "dplyr", "filter".
#   argumen        : vektor bernama, nama lokal = nama asli.
#   sama           : argumen asli yang namanya tidak diubah.
#   estetika       : TRUE bila nama estetika (warna, isian, ...) di `...`
#                    ikut diterjemahkan (lihat `.estetika`).
#   melalui_titik  : nama asli yang diterima lewat `...` fungsi asli, bukan
#                    argumen formal (mis. `x` dan `y` pada labs()).
#   opsional       : TRUE bila paket asli ada di Suggests dan dipasang terpisah.
#   setara         : vektor bernama, sinonim = nama asli baku (mis. outlier.color =
#                    "outlier.colour"). Sinonim diterima apa adanya dan menimbulkan
#                    konflik bila diberikan bersama nama lokalnya.

# Estetika: nama lokal -> nama asli. Elemen pertama adalah nama baku;
# elemen lain adalah sinonim yang menimbulkan konflik bila diberikan bersamaan.
.estetika <- list(
  warna           = c("colour", "color"),
  isian           = "fill",
  bentuk          = "shape",
  ukuran          = "size",
  alfa            = "alpha",
  tipe_garis      = "linetype",
  ketebalan_garis = "linewidth",
  kelompok        = "group"
)

.spec <- function(paket, fungsi, argumen = character(), sama = character(),
                  estetika = FALSE, melalui_titik = character(),
                  opsional = FALSE, setara = character()) {
  list(
    paket = paket, fungsi = fungsi, argumen = argumen, sama = sama,
    estetika = estetika, melalui_titik = melalui_titik, opsional = opsional,
    setara = setara
  )
}

.kamus_fungsi <- list(

  # dihasilkan generator ----------------------------------------------------

  imp_baca_csv = .spec(
    "readr", "read_csv",
    argumen = c(
      berkas = "file", nama_kolom = "col_names",
      tipe_kolom = "col_types", pilih_kolom = "col_select",
      lokal = "locale", na_berkutip = "quoted_na", kutip = "quote",
      komentar = "comment", pangkas_spasi = "trim_ws",
      lewati = "skip", maks_baris = "n_max",
      maks_tebakan = "guess_max", perbaikan_nama = "name_repair",
      jumlah_utas = "num_threads", kemajuan = "progress",
      tampilkan_tipe_kolom = "show_col_types",
      lewati_baris_kosong = "skip_empty_rows", tunda_baca = "lazy"
    ),
    sama = c("id", "na")
  ),

  imp_baca_csv2 = .spec(
    "readr", "read_csv2",
    argumen = c(
      berkas = "file", nama_kolom = "col_names",
      tipe_kolom = "col_types", pilih_kolom = "col_select",
      lokal = "locale", na_berkutip = "quoted_na", kutip = "quote",
      komentar = "comment", pangkas_spasi = "trim_ws",
      lewati = "skip", maks_baris = "n_max",
      maks_tebakan = "guess_max", kemajuan = "progress",
      perbaikan_nama = "name_repair", jumlah_utas = "num_threads",
      tampilkan_tipe_kolom = "show_col_types",
      lewati_baris_kosong = "skip_empty_rows", tunda_baca = "lazy"
    ),
    sama = c("id", "na")
  ),

  imp_baca_tsv = .spec(
    "readr", "read_tsv",
    argumen = c(
      berkas = "file", nama_kolom = "col_names",
      tipe_kolom = "col_types", pilih_kolom = "col_select",
      lokal = "locale", na_berkutip = "quoted_na", kutip = "quote",
      komentar = "comment", pangkas_spasi = "trim_ws",
      lewati = "skip", maks_baris = "n_max",
      maks_tebakan = "guess_max", kemajuan = "progress",
      perbaikan_nama = "name_repair", jumlah_utas = "num_threads",
      tampilkan_tipe_kolom = "show_col_types",
      lewati_baris_kosong = "skip_empty_rows", tunda_baca = "lazy"
    ),
    sama = c("id", "na")
  ),

  imp_baca_delim = .spec(
    "readr", "read_delim",
    argumen = c(
      berkas = "file", pembatas = "delim", kutip = "quote",
      escape_garis_miring = "escape_backslash",
      escape_ganda = "escape_double", nama_kolom = "col_names",
      tipe_kolom = "col_types", pilih_kolom = "col_select",
      lokal = "locale", na_berkutip = "quoted_na",
      komentar = "comment", pangkas_spasi = "trim_ws",
      lewati = "skip", maks_baris = "n_max",
      maks_tebakan = "guess_max", perbaikan_nama = "name_repair",
      jumlah_utas = "num_threads", kemajuan = "progress",
      tampilkan_tipe_kolom = "show_col_types",
      lewati_baris_kosong = "skip_empty_rows", tunda_baca = "lazy"
    ),
    sama = c("id", "na")
  ),

  imp_baca_lebar_tetap = .spec(
    "readr", "read_fwf",
    argumen = c(
      berkas = "file", posisi_kolom = "col_positions",
      tipe_kolom = "col_types", pilih_kolom = "col_select",
      lokal = "locale", komentar = "comment",
      pangkas_spasi = "trim_ws", lewati = "skip",
      maks_baris = "n_max", maks_tebakan = "guess_max",
      kemajuan = "progress", perbaikan_nama = "name_repair",
      jumlah_utas = "num_threads",
      tampilkan_tipe_kolom = "show_col_types", tunda_baca = "lazy",
      lewati_baris_kosong = "skip_empty_rows"
    ),
    sama = c("id", "na")
  ),

  imp_baca_tabel = .spec(
    "readr", "read_table",
    argumen = c(
      berkas = "file", nama_kolom = "col_names",
      tipe_kolom = "col_types", lokal = "locale", lewati = "skip",
      maks_baris = "n_max", maks_tebakan = "guess_max",
      kemajuan = "progress", komentar = "comment",
      tampilkan_tipe_kolom = "show_col_types",
      lewati_baris_kosong = "skip_empty_rows"
    ),
    sama = c("na")
  ),

  imp_baca_log = .spec(
    "readr", "read_log",
    argumen = c(
      berkas = "file", nama_kolom = "col_names",
      tipe_kolom = "col_types", pangkas_spasi = "trim_ws",
      lewati = "skip", maks_baris = "n_max",
      tampilkan_tipe_kolom = "show_col_types",
      kemajuan = "progress"
    )
  ),

  imp_baca_rds = .spec(
    "readr", "read_rds",
    argumen = c(
      berkas = "file"
    ),
    sama = c("refhook")
  ),

  imp_baca_parquet = .spec(
    "arrow", "read_parquet",
    argumen = c(
      berkas = "file", pilih_kolom = "col_select",
      sebagai_data_frame = "as_data_frame"
    ),
    sama = c("props", "mmap"),
    opsional = TRUE
  ),

  imp_lebar_kolom = .spec(
    "readr", "fwf_widths",
    argumen = c(
      lebar = "widths", nama_kolom = "col_names"
    )
  ),

  imp_posisi_kolom = .spec(
    "readr", "fwf_positions",
    argumen = c(
      mulai = "start", akhir = "end", nama_kolom = "col_names"
    )
  ),

  imp_masalah = .spec(
    "readr", "problems",
    sama = c("x")
  ),

  imp_spesifikasi = .spec(
    "readr", "spec",
    sama = c("x")
  ),

  imp_kolom = .spec(
    "readr", "cols",
    argumen = c(
      .bawaan = ".default"
    )
  ),

  imp_kolom_saja = .spec(
    "readr", "cols_only"
  ),

  imp_kolom_logika = .spec(
    "readr", "col_logical"
  ),

  imp_kolom_desimal = .spec(
    "readr", "col_double"
  ),

  imp_kolom_bulat = .spec(
    "readr", "col_integer"
  ),

  imp_kolom_teks = .spec(
    "readr", "col_character"
  ),

  imp_kolom_faktor = .spec(
    "readr", "col_factor",
    argumen = c(
      level = "levels", berurut = "ordered",
      sertakan_na = "include_na"
    )
  ),

  imp_kolom_tanggal = .spec(
    "readr", "col_date",
    sama = c("format")
  ),

  imp_kolom_waktu = .spec(
    "readr", "col_datetime",
    sama = c("format")
  ),

  imp_kolom_angka = .spec(
    "readr", "col_number"
  ),

  imp_kolom_lewati = .spec(
    "readr", "col_skip"
  ),

  imp_urai_angka = .spec(
    "readr", "parse_number",
    argumen = c(
      lokal = "locale", pangkas_spasi = "trim_ws"
    ),
    sama = c("x", "na")
  ),

  inp_tulis_csv = .spec(
    "readr", "write_csv",
    argumen = c(
      berkas = "file", tambahkan = "append",
      nama_kolom = "col_names", kutip = "quote",
      akhir_baris = "eol", jumlah_utas = "num_threads",
      kemajuan = "progress"
    ),
    sama = c("x", "na", "escape")
  ),

  inp_tulis_tsv = .spec(
    "readr", "write_tsv",
    argumen = c(
      berkas = "file", tambahkan = "append",
      nama_kolom = "col_names", kutip = "quote",
      akhir_baris = "eol", jumlah_utas = "num_threads",
      kemajuan = "progress"
    ),
    sama = c("x", "na", "escape")
  ),

  inp_tulis_rds = .spec(
    "readr", "write_rds",
    argumen = c(
      berkas = "file", kompresi = "compress", versi = "version",
      teks = "text"
    ),
    sama = c("x", "refhook")
  ),

  inp_tulis_parquet = .spec(
    "arrow", "write_parquet",
    argumen = c(
      tujuan = "sink", ukuran_potongan = "chunk_size",
      versi = "version", kompresi = "compression",
      tingkat_kompresi = "compression_level",
      pakai_kamus = "use_dictionary",
      tulis_statistik = "write_statistics",
      ukuran_halaman_data = "data_page_size",
      pakai_stempel_waktu_int96 = "use_deprecated_int96_timestamps",
      paksa_stempel_waktu = "coerce_timestamps",
      izinkan_stempel_waktu_terpotong = "allow_truncated_timestamps"
    ),
    sama = c("x"),
    opsional = TRUE
  ),

  vis_ggplot = .spec(
    "ggplot2", "ggplot",
    argumen = c(
      pemetaan = "mapping", lingkungan = "environment"
    ),
    sama = c("data")
  ),

  vis_ggplot_simpan = .spec(
    "ggplot2", "ggsave",
    argumen = c(
      nama_berkas = "filename", perangkat = "device",
      lokasi = "path", skala_gambar = "scale", lebar = "width",
      tinggi = "height", satuan = "units",
      batasi_ukuran = "limitsize", latar = "bg",
      buat_dir = "create.dir"
    ),
    sama = c("plot", "dpi")
  ),

  vis_ggplot_terakhir = .spec(
    "ggplot2", "last_plot"
  ),

  grf_estetika = .spec(
    "ggplot2", "aes",
    sama = c("x", "y"),
    estetika = TRUE
  ),

  grf_label = .spec(
    "ggplot2", "labs",
    argumen = c(
      judul = "title", subjudul = "subtitle",
      keterangan = "caption", kamus = "dictionary",
      teks_alternatif = "alt", wawasan_alternatif = "alt_insight",
      sumbu_x = "x", sumbu_y = "y"
    ),
    sama = c("tag"),
    melalui_titik = c("x", "y"),
    estetika = TRUE
  ),

  grf_geometrik_titik = .spec(
    "ggplot2", "geom_point",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", buang_na = "na.rm",
      tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    estetika = TRUE
  ),

  grf_geometrik_garis = .spec(
    "ggplot2", "geom_line",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", orientasi = "orientation",
      panah = "arrow", isian_panah = "arrow.fill",
      ujung_garis = "lineend", sambungan_garis = "linejoin",
      batas_sambungan = "linemitre", buang_na = "na.rm",
      tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    estetika = TRUE
  ),

  grf_geometrik_batang = .spec(
    "ggplot2", "geom_bar",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", perataan = "just",
      ujung_garis = "lineend", sambungan_garis = "linejoin",
      buang_na = "na.rm", tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    estetika = TRUE
  ),

  grf_geometrik_histogram = .spec(
    "ggplot2", "geom_histogram",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", lebar_bin = "binwidth",
      jumlah_bin = "bins", orientasi = "orientation",
      ujung_garis = "lineend", sambungan_garis = "linejoin",
      buang_na = "na.rm", tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    estetika = TRUE
  ),

  grf_geometrik_densitas = .spec(
    "ggplot2", "geom_density",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", tipe_kontur = "outline.type",
      ujung_garis = "lineend", sambungan_garis = "linejoin",
      batas_sambungan = "linemitre", buang_na = "na.rm",
      tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    estetika = TRUE
  ),

  grf_geometrik_boxplot = .spec(
    "ggplot2", "geom_boxplot",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", pencilan = "outliers",
      warna_pencilan = "outlier.colour",
      isian_pencilan = "outlier.fill",
      bentuk_pencilan = "outlier.shape",
      ukuran_pencilan = "outlier.size",
      ketebalan_tepi_pencilan = "outlier.stroke",
      alfa_pencilan = "outlier.alpha",
      warna_kumis = "whisker.colour",
      tipe_garis_kumis = "whisker.linetype",
      ketebalan_garis_kumis = "whisker.linewidth",
      warna_ujung_kumis = "staple.colour",
      tipe_garis_ujung_kumis = "staple.linetype",
      ketebalan_garis_ujung_kumis = "staple.linewidth",
      warna_median = "median.colour",
      tipe_garis_median = "median.linetype",
      ketebalan_garis_median = "median.linewidth",
      warna_kotak = "box.colour",
      tipe_garis_kotak = "box.linetype",
      ketebalan_garis_kotak = "box.linewidth", takik = "notch",
      lebar_takik = "notchwidth",
      lebar_ujung_kumis = "staplewidth",
      lebar_variabel = "varwidth", buang_na = "na.rm",
      orientasi = "orientation", tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes"
    ),
    sama = c("data"),
    setara = c(
      outlier.color = "outlier.colour",
      whisker.color = "whisker.colour",
      staple.color = "staple.colour",
      median.color = "median.colour",
      box.color = "box.colour"
    ),
    estetika = TRUE
  ),

  grf_geometrik_haluskan = .spec(
    "ggplot2", "geom_smooth",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", metode = "method", rumus = "formula",
      selang_kepercayaan = "se", buang_na = "na.rm",
      orientasi = "orientation", tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes", rentang = "span",
      tingkat_kepercayaan = "level", rentang_penuh = "fullrange"
    ),
    sama = c("data"),
    melalui_titik = c("span", "level", "fullrange"),
    estetika = TRUE
  ),

  grf_geometrik_heksagon = .spec(
    "ggplot2", "geom_hex",
    argumen = c(
      pemetaan = "mapping", statistik = "stat",
      posisi = "position", ujung_garis = "lineend",
      sambungan_garis = "linejoin", batas_sambungan = "linemitre",
      buang_na = "na.rm", tampilkan_legenda = "show.legend",
      warisi_estetika = "inherit.aes", jumlah_bin = "bins",
      lebar_bin = "binwidth"
    ),
    sama = c("data"),
    melalui_titik = c("bins", "binwidth"),
    estetika = TRUE
  ),

  grf_faset_bungkus = .spec(
    "ggplot2", "facet_wrap",
    argumen = c(
      faset = "facets", jumlah_baris = "nrow",
      jumlah_kolom = "ncol", skala = "scales", ruang = "space",
      susutkan = "shrink", pelabel = "labeller",
      urut_tabel = "as.table", pindah_strip = "switch",
      buang_kosong = "drop", arah = "dir",
      posisi_strip = "strip.position", sumbu = "axes",
      label_sumbu = "axis.labels"
    )
  ),

  grf_faset_jendela = .spec(
    "ggplot2", "facet_grid",
    argumen = c(
      baris = "rows", kolom = "cols", skala = "scales",
      ruang = "space", susutkan = "shrink", pelabel = "labeller",
      urut_tabel = "as.table", pindah_strip = "switch",
      buang_kosong = "drop", marjin = "margins", sumbu = "axes",
      label_sumbu = "axis.labels", faset = "facets"
    )
  ),

  grf_skala_x_kontinu = .spec(
    "ggplot2", "scale_x_continuous",
    argumen = c(
      nama = "name", posisi_tanda = "breaks",
      posisi_tanda_minor = "minor_breaks",
      jumlah_tanda = "n.breaks", label_tanda = "labels",
      batas = "limits", perluasan = "expand", luar_batas = "oob",
      nilai_na = "na.value", transformasi = "transform",
      panduan = "guide", posisi = "position",
      sumbu_sekunder = "sec.axis"
    ),
    sama = c("trans")
  ),

  grf_skala_y_balik = .spec(
    "ggplot2", "scale_y_reverse",
    argumen = c(
      nama = "name", posisi_tanda = "breaks",
      posisi_tanda_minor = "minor_breaks",
      jumlah_tanda = "n.breaks", label_tanda = "labels",
      batas = "limits", perluasan = "expand", luar_batas = "oob",
      nilai_na = "na.value", panduan = "guide",
      posisi = "position", sumbu_sekunder = "sec.axis"
    ),
    melalui_titik = c("name", "breaks", "minor_breaks", "n.breaks", "labels", "limits", "expand", "oob", "na.value", "guide", "position", "sec.axis")
  ),

  grf_skalawarna_butawarna = .spec(
    "ggthemes", "scale_color_colorblind",
    argumen = c(
      hitam = "black"
    ),
    opsional = TRUE
  ),

  grf_tema_abu = .spec(
    "ggplot2", "theme_grey",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_hitamputih = .spec(
    "ggplot2", "theme_bw",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_gambar_garis = .spec(
    "ggplot2", "theme_linedraw",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_terang = .spec(
    "ggplot2", "theme_light",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_gelap = .spec(
    "ggplot2", "theme_dark",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_minimal = .spec(
    "ggplot2", "theme_minimal",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_klasik = .spec(
    "ggplot2", "theme_classic",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_kosong = .spec(
    "ggplot2", "theme_void",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  grf_tema_uji = .spec(
    "ggplot2", "theme_test",
    argumen = c(
      ukuran_dasar = "base_size",
      keluarga_font_dasar = "base_family",
      keluarga_font_judul = "header_family",
      ketebalan_garis_dasar = "base_line_size",
      ukuran_persegi_dasar = "base_rect_size", tinta = "ink",
      kertas = "paper", aksen = "accent"
    )
  ),

  dsr_rerata = .spec(
    "base", "mean",
    argumen = c(
      pangkas = "trim", buang_na = "na.rm"
    ),
    sama = c("x"),
    melalui_titik = c("trim", "na.rm")
  ),

  dsr_jumlah = .spec(
    "base", "sum",
    argumen = c(
      buang_na = "na.rm"
    )
  ),

  dsr_sinus = .spec(
    "base", "sin",
    sama = c("x")
  ),

  dsr_adalah_na = .spec(
    "base", "is.na",
    sama = c("x")
  ),

  dsr_urutan = .spec(
    "base", "seq",
    argumen = c(
      dari = "from", sampai = "to", selisih = "by",
      panjang_keluaran = "length.out", sepanjang = "along.with"
    ),
    melalui_titik = c("from", "to", "by", "length.out", "along.with")
  ),

  dsr_acak_normal = .spec(
    "stats", "rnorm",
    argumen = c(
      rerata = "mean"
    ),
    sama = c("n", "sd")
  ),

  dsr_panjang = .spec(
    "base", "length",
    sama = c("x")
  ),

  dsr_faktor = .spec(
    "base", "factor",
    argumen = c(
      level = "levels", label_level = "labels",
      kecualikan = "exclude", berurut = "ordered",
      maks_level = "nmax"
    ),
    sama = c("x")
  ),

  dsr_daftar_berkas = .spec(
    "base", "list.files",
    argumen = c(
      lokasi = "path", pola = "pattern",
      semua_berkas = "all.files", nama_lengkap = "full.names",
      rekursif = "recursive", abaikan_kapital = "ignore.case",
      sertakan_dir = "include.dirs", tanpa_titik_titik = "no..",
      harfiah = "fixed"
    ),
    # `fixed` baru ada di R >= 4.6.0; diterima lewat `...` pada R yang lebih lama.
    melalui_titik = "fixed"
  ),

  dsr_dir_kerja = .spec(
    "base", "getwd"
  ),

  dsr_set_dir_kerja = .spec(
    "base", "setwd",
    argumen = c(
      direktori = "dir"
    )
  ),

  dsr_dput = .spec(
    "base", "dput",
    argumen = c(
      berkas = "file", kontrol = "control"
    ),
    sama = c("x")
  ),

  dtr_sekilas = .spec(
    "dplyr", "glimpse",
    argumen = c(
      lebar = "width"
    ),
    sama = c("x")
  ),

  dtr_kepala = .spec(
    "utils", "head",
    sama = c("x", "n"),
    melalui_titik = c("n")
  ),

  dtr_ekor = .spec(
    "utils", "tail",
    argumen = c(
      pertahankan_nomor = "keepnums", nomor_baris = "addrownums"
    ),
    sama = c("x", "n"),
    melalui_titik = c("n", "keepnums", "addrownums")
  ),

  dtr_lihat = .spec(
    "utils", "View",
    argumen = c(
      judul = "title"
    ),
    sama = c("x")
  ),

  inp_tibble = .spec(
    "tibble", "tibble",
    argumen = c(
      .baris = ".rows", .perbaikan_nama = ".name_repair"
    )
  ),

  inp_tribble = .spec(
    "tibble", "tribble"
  ),

  rpi_panjang = .spec(
    "tidyr", "pivot_longer",
    argumen = c(
      kolom = "cols", variasi_kolom = "cols_vary",
      nama_ke = "names_to", awalan_nama = "names_prefix",
      pemisah_nama = "names_sep", pola_nama = "names_pattern",
      ptype_nama = "names_ptypes",
      transformasi_nama = "names_transform",
      perbaikan_nama = "names_repair", nilai_ke = "values_to",
      buang_nilai_na = "values_drop_na",
      ptype_nilai = "values_ptypes",
      transformasi_nilai = "values_transform"
    ),
    sama = c("data")
  ),

  rpi_lebar = .spec(
    "tidyr", "pivot_wider",
    argumen = c(
      kolom_id = "id_cols", perluas_id = "id_expand",
      nama_dari = "names_from", awalan_nama = "names_prefix",
      pemisah_nama = "names_sep", templat_nama = "names_glue",
      urutkan_nama = "names_sort", variasi_nama = "names_vary",
      perluas_nama = "names_expand",
      perbaikan_nama = "names_repair", nilai_dari = "values_from",
      isi_nilai = "values_fill", fungsi_nilai = "values_fn",
      fungsi_tak_terpakai = "unused_fn"
    ),
    sama = c("data")
  ),

  trn_filter = .spec(
    "dplyr", "filter",
    argumen = c(
      .berdasarkan = ".by", .pertahankan = ".preserve"
    ),
    sama = c(".data")
  ),

  trn_urutkan = .spec(
    "dplyr", "arrange",
    argumen = c(
      .per_kelompok = ".by_group"
    ),
    sama = c(".data")
  ),

  trn_unik = .spec(
    "dplyr", "distinct",
    argumen = c(
      .simpan_semua = ".keep_all"
    ),
    sama = c(".data")
  ),

  trn_hitung = .spec(
    "dplyr", "count",
    argumen = c(
      bobot = "wt", urut = "sort", nama = "name"
    ),
    sama = c("x")
  ),

  trn_mutasi = .spec(
    "dplyr", "mutate",
    argumen = c(
      .berdasarkan = ".by", .simpan = ".keep",
      .sebelum = ".before", .setelah = ".after"
    ),
    sama = c(".data"),
    melalui_titik = c(".by", ".keep", ".before", ".after")
  ),

  trn_pilih = .spec(
    "dplyr", "select",
    sama = c(".data")
  ),

  trn_ubah_nama = .spec(
    "dplyr", "rename",
    sama = c(".data")
  ),

  trn_pindah = .spec(
    "dplyr", "relocate",
    argumen = c(
      .sebelum = ".before", .setelah = ".after"
    ),
    sama = c(".data")
  ),

  trn_tarik = .spec(
    "dplyr", "pull",
    argumen = c(
      variabel = "var", nama = "name"
    ),
    sama = c(".data")
  ),

  trn_gabung_kelompok = .spec(
    "dplyr", "group_by",
    argumen = c(
      .tambah = ".add", .buang_kosong = ".drop"
    ),
    sama = c(".data")
  ),

  trn_lepas_kelompok = .spec(
    "dplyr", "ungroup",
    sama = c("x")
  ),

  trn_statistik_ringkas = .spec(
    "dplyr", "summarise",
    argumen = c(
      .berdasarkan = ".by", .hasil_kelompok = ".groups"
    ),
    sama = c(".data")
  ),

  trn_iris = .spec(
    "dplyr", "slice",
    argumen = c(
      .berdasarkan = ".by", .pertahankan = ".preserve"
    ),
    sama = c(".data")
  ),

  trn_iris_kepala = .spec(
    "dplyr", "slice_head",
    argumen = c(
      proporsi = "prop", berdasarkan = "by"
    ),
    sama = c(".data", "n")
  ),

  trn_iris_ekor = .spec(
    "dplyr", "slice_tail",
    argumen = c(
      proporsi = "prop", berdasarkan = "by"
    ),
    sama = c(".data", "n")
  ),

  trn_iris_min = .spec(
    "dplyr", "slice_min",
    argumen = c(
      urutan_oleh = "order_by", proporsi = "prop",
      berdasarkan = "by", dengan_seri = "with_ties",
      buang_na = "na_rm"
    ),
    sama = c(".data", "n")
  ),

  trn_iris_maks = .spec(
    "dplyr", "slice_max",
    argumen = c(
      urutan_oleh = "order_by", proporsi = "prop",
      berdasarkan = "by", dengan_seri = "with_ties",
      buang_na = "na_rm"
    ),
    sama = c(".data", "n")
  ),

  trn_iris_acak = .spec(
    "dplyr", "slice_sample",
    argumen = c(
      proporsi = "prop", berdasarkan = "by",
      bobot_oleh = "weight_by", dengan_pengembalian = "replace"
    ),
    sama = c(".data", "n")
  ),

  trn_rapikan_nama = .spec(
    "janitor", "clean_names",
    sama = c("dat"),
    opsional = TRUE
  ),

  frm_diawali = .spec(
    "tidyselect", "starts_with",
    argumen = c(
      cocok = "match", abaikan_kapital = "ignore.case",
      variabel = "vars"
    )
  ),

  frm_diakhiri = .spec(
    "tidyselect", "ends_with",
    argumen = c(
      cocok = "match", abaikan_kapital = "ignore.case",
      variabel = "vars"
    )
  ),

  frm_memuat = .spec(
    "tidyselect", "contains",
    argumen = c(
      cocok = "match", abaikan_kapital = "ignore.case",
      variabel = "vars"
    )
  ),

  frm_cocok = .spec(
    "tidyselect", "matches",
    argumen = c(
      cocok = "match", abaikan_kapital = "ignore.case",
      variabel = "vars"
    ),
    sama = c("perl")
  ),

  frm_rentang_angka = .spec(
    "tidyselect", "num_range",
    argumen = c(
      awalan = "prefix", rentang = "range", akhiran = "suffix",
      lebar = "width", variabel = "vars"
    )
  ),

  frm_semua = .spec(
    "tidyselect", "everything",
    argumen = c(
      variabel = "vars"
    )
  ),

  frm_di_mana = .spec(
    "tidyselect", "where",
    argumen = c(
      fungsi = "fn"
    )
  ),

  frm_salah_satu = .spec(
    "tidyselect", "any_of",
    argumen = c(
      variabel = "vars"
    ),
    sama = c("x")
  ),

  frm_turun = .spec(
    "dplyr", "desc",
    sama = c("x")
  ),

  frm_jumlah = .spec(
    "dplyr", "n"
  ),

  frm_jika_lain = .spec(
    "dplyr", "if_else",
    argumen = c(
      kondisi = "condition", benar = "true", salah = "false",
      hilang = "missing", ukuran_keluaran = "size"
    ),
    sama = c("ptype")
  ),

  frm_faktor_frekuensi = .spec(
    "forcats", "fct_infreq",
    argumen = c(
      bobot = "w", berurut = "ordered"
    ),
    sama = c("f"),
    opsional = TRUE
  )
)
