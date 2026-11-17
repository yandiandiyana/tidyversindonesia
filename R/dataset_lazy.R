# Dihasilkan oleh dev/generator/buat_dataset.py. Jangan disunting langsung.
#
# Dataset lokal (selain `penguin`) tidak disimpan di dalam paket. Tiap objek dibuat saat
# pertama kali dipakai dari dataset aslinya di paket sumber, dengan perubahan berupa nama
# kolom dan (bila ada) terjemahan nilai kategorikal. Dengan cara ini paket tidak
# mendistribusikan ulang data tersebut, dan ukuran paket tetap kecil.

.dataset_lazy <- list(
  mobil_mpg = list(
    paket = "ggplot2", objek = "mpg",
    nama_asli = c(
      "manufacturer", "model", "displ", "year", "cyl", "trans", "drv", "cty",
      "hwy", "fl", "class"
    ),
    nama_baru = c(
      "produsen", "model", "kapasitas_mesin", "tahun", "silinder", "transmisi",
      "penggerak", "mpg_jalan_kota", "mpg_jalan_raya", "bahan_bakar", "kelas"
    ),
    peta_nilai = list(
      `trans` = c("auto(av)" = "otomatis(av)", "auto(l3)" = "otomatis(l3)", "auto(l4)" = "otomatis(l4)", "auto(l5)" = "otomatis(l5)", "auto(l6)" = "otomatis(l6)", "auto(s4)" = "otomatis(s4)", "auto(s5)" = "otomatis(s5)", "auto(s6)" = "otomatis(s6)", "manual(m5)" = "manual(m5)", "manual(m6)" = "manual(m6)"),
      `drv` = c("4" = "4_roda", "f" = "depan", "r" = "belakang"),
      `fl` = c("c" = "CNG", "d" = "diesel", "e" = "etanol", "p" = "bensin_premium", "r" = "bensin_reguler"),
      `class` = c("2seater" = "2_penumpang", "compact" = "kompak", "midsize" = "ukuran_menengah", "minivan" = "minivan", "pickup" = "pikap", "subcompact" = "subkompak", "suv" = "suv")
    )
  ),

  mobil = list(
    paket = "datasets", objek = "mtcars",
    nama_baris = "mobil",
    nama_asli = c(
      "mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"
    ),
    nama_baru = c(
      "efisiensi_mpg", "silinder", "kapasitas_mesin_in3", "tenaga_kuda",
      "rasio_gardan", "berat_ribu_lb", "waktu_seperempat_mil", "bentuk_mesin",
      "kode_transmisi", "jumlah_gigi", "jumlah_karburator"
    ),
    peta_nilai = list()
  ),

  berlian = list(
    paket = "ggplot2", objek = "diamonds",
    nama_asli = c(
      "carat", "cut", "color", "clarity", "depth", "table", "price", "x", "y", "z"
    ),
    nama_baru = c(
      "karat", "potongan", "warna", "kejernihan", "kedalaman_persen",
      "meja_persen", "harga", "panjang_mm", "lebar_mm", "kedalaman_mm"
    ),
    peta_nilai = list(
      `cut` = c("Fair" = "Cukup", "Good" = "Baik", "Very Good" = "Sangat Baik", "Premium" = "Premium", "Ideal" = "Ideal")
    )
  ),

  tabel1 = list(
    paket = "tidyr", objek = "table1",
    nama_asli = c(
      "country", "year", "cases", "population"
    ),
    nama_baru = c(
      "negara", "tahun", "kasus", "populasi"
    ),
    peta_nilai = list()
  ),

  tabel2 = list(
    paket = "tidyr", objek = "table2",
    nama_asli = c(
      "country", "year", "type", "count"
    ),
    nama_baru = c(
      "negara", "tahun", "jenis", "jumlah"
    ),
    peta_nilai = list(
      `type` = c("cases" = "kasus", "population" = "populasi")
    )
  ),

  tabel3 = list(
    paket = "tidyr", objek = "table3",
    nama_asli = c(
      "country", "year", "rate"
    ),
    nama_baru = c(
      "negara", "tahun", "rasio"
    ),
    peta_nilai = list()
  ),

  tangga_lagu = list(
    paket = "tidyr", objek = "billboard",
    nama_asli = c(
      "artist", "track", "date.entered", "wk1", "wk2", "wk3", "wk4", "wk5", "wk6",
      "wk7", "wk8", "wk9", "wk10", "wk11", "wk12", "wk13", "wk14", "wk15", "wk16",
      "wk17", "wk18", "wk19", "wk20", "wk21", "wk22", "wk23", "wk24", "wk25",
      "wk26", "wk27", "wk28", "wk29", "wk30", "wk31", "wk32", "wk33", "wk34",
      "wk35", "wk36", "wk37", "wk38", "wk39", "wk40", "wk41", "wk42", "wk43",
      "wk44", "wk45", "wk46", "wk47", "wk48", "wk49", "wk50", "wk51", "wk52",
      "wk53", "wk54", "wk55", "wk56", "wk57", "wk58", "wk59", "wk60", "wk61",
      "wk62", "wk63", "wk64", "wk65", "wk66", "wk67", "wk68", "wk69", "wk70",
      "wk71", "wk72", "wk73", "wk74", "wk75", "wk76"
    ),
    nama_baru = c(
      "artis", "lagu", "tanggal_masuk", "minggu1", "minggu2", "minggu3",
      "minggu4", "minggu5", "minggu6", "minggu7", "minggu8", "minggu9",
      "minggu10", "minggu11", "minggu12", "minggu13", "minggu14", "minggu15",
      "minggu16", "minggu17", "minggu18", "minggu19", "minggu20", "minggu21",
      "minggu22", "minggu23", "minggu24", "minggu25", "minggu26", "minggu27",
      "minggu28", "minggu29", "minggu30", "minggu31", "minggu32", "minggu33",
      "minggu34", "minggu35", "minggu36", "minggu37", "minggu38", "minggu39",
      "minggu40", "minggu41", "minggu42", "minggu43", "minggu44", "minggu45",
      "minggu46", "minggu47", "minggu48", "minggu49", "minggu50", "minggu51",
      "minggu52", "minggu53", "minggu54", "minggu55", "minggu56", "minggu57",
      "minggu58", "minggu59", "minggu60", "minggu61", "minggu62", "minggu63",
      "minggu64", "minggu65", "minggu66", "minggu67", "minggu68", "minggu69",
      "minggu70", "minggu71", "minggu72", "minggu73", "minggu74", "minggu75",
      "minggu76"
    ),
    peta_nilai = list()
  ),

  tb_who = list(
    paket = "tidyr", objek = "who2",
    nama_asli = c(
      "country", "year", "sp_m_014", "sp_m_1524", "sp_m_2534", "sp_m_3544",
      "sp_m_4554", "sp_m_5564", "sp_m_65", "sp_f_014", "sp_f_1524", "sp_f_2534",
      "sp_f_3544", "sp_f_4554", "sp_f_5564", "sp_f_65", "sn_m_014", "sn_m_1524",
      "sn_m_2534", "sn_m_3544", "sn_m_4554", "sn_m_5564", "sn_m_65", "sn_f_014",
      "sn_f_1524", "sn_f_2534", "sn_f_3544", "sn_f_4554", "sn_f_5564", "sn_f_65",
      "ep_m_014", "ep_m_1524", "ep_m_2534", "ep_m_3544", "ep_m_4554", "ep_m_5564",
      "ep_m_65", "ep_f_014", "ep_f_1524", "ep_f_2534", "ep_f_3544", "ep_f_4554",
      "ep_f_5564", "ep_f_65", "rel_m_014", "rel_m_1524", "rel_m_2534",
      "rel_m_3544", "rel_m_4554", "rel_m_5564", "rel_m_65", "rel_f_014",
      "rel_f_1524", "rel_f_2534", "rel_f_3544", "rel_f_4554", "rel_f_5564",
      "rel_f_65"
    ),
    nama_baru = c(
      "negara", "tahun", "sp_m_014", "sp_m_1524", "sp_m_2534", "sp_m_3544",
      "sp_m_4554", "sp_m_5564", "sp_m_65", "sp_f_014", "sp_f_1524", "sp_f_2534",
      "sp_f_3544", "sp_f_4554", "sp_f_5564", "sp_f_65", "sn_m_014", "sn_m_1524",
      "sn_m_2534", "sn_m_3544", "sn_m_4554", "sn_m_5564", "sn_m_65", "sn_f_014",
      "sn_f_1524", "sn_f_2534", "sn_f_3544", "sn_f_4554", "sn_f_5564", "sn_f_65",
      "ep_m_014", "ep_m_1524", "ep_m_2534", "ep_m_3544", "ep_m_4554", "ep_m_5564",
      "ep_m_65", "ep_f_014", "ep_f_1524", "ep_f_2534", "ep_f_3544", "ep_f_4554",
      "ep_f_5564", "ep_f_65", "rel_m_014", "rel_m_1524", "rel_m_2534",
      "rel_m_3544", "rel_m_4554", "rel_m_5564", "rel_m_65", "rel_f_014",
      "rel_f_1524", "rel_f_2534", "rel_f_3544", "rel_f_4554", "rel_f_5564",
      "rel_f_65"
    ),
    peta_nilai = list()
  ),

  rumah_tangga = list(
    paket = "tidyr", objek = "household",
    nama_asli = c(
      "family", "dob_child1", "dob_child2", "name_child1", "name_child2"
    ),
    nama_baru = c(
      "keluarga", "lahir_anak1", "lahir_anak2", "nama_anak1", "nama_anak2"
    ),
    peta_nilai = list()
  ),

  pengalaman_pasien = list(
    paket = "tidyr", objek = "cms_patient_experience",
    nama_asli = c(
      "org_pac_id", "org_nm", "measure_cd", "measure_title", "prf_rate"
    ),
    nama_baru = c(
      "organisasi_id", "organisasi_nama", "ukuran_kode", "ukuran_judul",
      "tingkat_kinerja"
    ),
    peta_nilai = list()
  ),

  penerbangan = list(
    paket = "nycflights13", objek = "flights",
    nama_asli = c(
      "year", "month", "day", "dep_time", "sched_dep_time", "dep_delay",
      "arr_time", "sched_arr_time", "arr_delay", "carrier", "flight", "tailnum",
      "origin", "dest", "air_time", "distance", "hour", "minute", "time_hour"
    ),
    nama_baru = c(
      "tahun", "bulan", "hari", "waktu_berangkat", "waktu_jadwal_berangkat",
      "keterlambatan_berangkat", "waktu_tiba", "waktu_jadwal_tiba",
      "keterlambatan_tiba", "maskapai", "nomor_penerbangan", "nomor_ekor", "asal",
      "tujuan", "waktu_terbang", "jarak", "jam", "menit", "waktu_jam"
    ),
    peta_nilai = list()
  )
)

.terjemahkan_nilai <- function(x, peta) {
  ada <- unique(as.character(x[!is.na(x)]))
  tak_dikenal <- setdiff(ada, names(peta))
  if (length(tak_dikenal) > 0L) {
    stop(
      "Nilai tak dikenal pada data asli: ", paste(tak_dikenal, collapse = ", "),
      ". Mohon laporkan agar paket diperbarui.",
      call. = FALSE
    )
  }
  if (is.factor(x)) {
    tingkat <- levels(x)
    if (!all(tingkat %in% names(peta))) {
      stop(
        "Level faktor tak dikenal: ",
        paste(setdiff(tingkat, names(peta)), collapse = ", "),
        ". Mohon laporkan agar paket diperbarui.",
        call. = FALSE
      )
    }
    levels(x) <- unname(peta[tingkat])
    x
  } else {
    unname(peta[as.character(x)])
  }
}

.buat_dataset <- function(nama) {
  spec <- .dataset_lazy[[nama]]
  asli <- getExportedValue(spec$paket, spec$objek)
  if (!identical(names(asli), spec$nama_asli)) {
    stop(
      "Struktur `", spec$paket, "::", spec$objek, "` berbeda dari yang diharapkan ",
      "paket ini. Mohon laporkan agar paket diperbarui.",
      call. = FALSE
    )
  }
  baru <- asli
  for (kolom in names(spec$peta_nilai)) {
    baru[[kolom]] <- .terjemahkan_nilai(baru[[kolom]], spec$peta_nilai[[kolom]])
  }
  names(baru) <- spec$nama_baru
  if (!is.null(spec[["nama_baris"]])) {
    baru <- tibble::as_tibble(baru, rownames = spec[["nama_baris"]])
  }
  baru
}

.onLoad <- function(libname, pkgname) {
  ns <- topenv(environment())
  for (nama in names(.dataset_lazy)) {
    local({
      n <- nama
      delayedAssign(n, .buat_dataset(n), assign.env = ns)
    })
  }
}
