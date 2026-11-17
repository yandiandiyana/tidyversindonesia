# audit-formals.R ----------------------------------------------------------
# Mengambil daftar argumen formal fungsi asli (urutan sebenarnya) dan struktur
# dataset dari paket yang TERPASANG di komputer Anda. Hasilnya menjadi dasar
# kamus Phase 3, sehingga kamus dibuat dari kenyataan, bukan dari ingatan.
#
# Cara pakai: source("dev/audit-formals.R")
# Lalu salin SELURUH keluaran konsol dan kirim ke Claude.
# Skrip ini hanya membaca; tidak mengubah file apa pun.

cat("=== VERSI ===\n")
cat("R:", as.character(getRversion()), "\n")
for (p in c("ggplot2", "dplyr", "tidyr", "readr", "tibble", "tidyselect",
            "forcats", "ggthemes", "janitor", "arrow", "palmerpenguins",
            "nycflights13")) {
  v <- tryCatch(as.character(utils::packageVersion(p)),
                error = function(e) "TIDAK TERPASANG")
  cat(p, v, "\n")
}

fungsi <- list(
  ggplot2 = c(
    "ggplot", "last_plot", "get_last_plot", "ggsave", "aes", "labs",
    "geom_point", "geom_line", "geom_bar", "geom_histogram", "geom_density",
    "geom_boxplot", "geom_smooth", "geom_hex", "facet_wrap", "facet_grid",
    "scale_x_continuous", "scale_y_reverse",
    "theme_grey", "theme_gray", "theme_bw", "theme_linedraw", "theme_light",
    "theme_dark", "theme_minimal", "theme_classic", "theme_void", "theme_test"
  ),
  ggthemes = c("scale_color_colorblind", "scale_fill_colorblind"),
  dplyr = c(
    "filter", "arrange", "desc", "distinct", "count", "mutate", "select",
    "rename", "relocate", "pull", "group_by", "ungroup", "summarise",
    "slice", "slice_head", "slice_tail", "slice_min", "slice_max",
    "slice_sample", "if_else", "n", "glimpse"
  ),
  tidyselect = c(
    "starts_with", "ends_with", "contains", "matches", "num_range",
    "everything", "where", "any_of", "all_of", "last_col"
  ),
  tidyr = c("pivot_longer", "pivot_wider"),
  readr = c(
    "read_csv", "read_csv2", "read_tsv", "read_delim", "read_fwf",
    "read_table", "read_log", "fwf_widths", "fwf_positions", "cols",
    "cols_only", "col_logical", "col_double", "col_integer",
    "col_character", "col_factor", "col_date", "col_datetime", "col_number",
    "col_skip", "problems", "spec", "parse_number", "write_csv", "write_tsv",
    "read_rds", "write_rds"
  ),
  tibble = c("tibble", "tribble"),
  forcats = c("fct_infreq"),
  janitor = c("clean_names"),
  arrow = c("read_parquet", "write_parquet"),
  base = c(
    "mean", "sum", "sin", "is.na", "seq", "rnorm", "length", "factor",
    "list.files", "getwd", "setwd", "dput"
  ),
  utils = c("head", "tail", "View")
)

cat("\n=== FORMALS FUNGSI (urutan sebenarnya) ===\n")
for (paket in names(fungsi)) {
  for (nama in fungsi[[paket]]) {
    hasil <- tryCatch({
      f <- getExportedValue(paket, nama)
      paste(names(formals(args(f))), collapse = " ")
    }, error = function(e) "<TIDAK DITEMUKAN>")
    cat(paket, "::", nama, ": ", hasil, "\n", sep = "")
  }
}

# Generik S3: argumen yang dipakai pengguna sering ada di metodenya.
metode <- c(
  "mean:default", "seq:default", "head:default", "head:data.frame",
  "tail:default", "tail:data.frame",
  "filter:data.frame", "arrange:data.frame", "distinct:data.frame",
  "count:data.frame", "mutate:data.frame", "select:data.frame",
  "rename:data.frame", "relocate:data.frame", "pull:data.frame",
  "group_by:data.frame", "ungroup:data.frame", "summarise:data.frame",
  "slice_head:data.frame", "slice_tail:data.frame", "slice_min:data.frame",
  "slice_max:data.frame", "slice_sample:data.frame",
  "glimpse:default", "glimpse:data.frame",
  "pivot_longer:data.frame", "pivot_wider:data.frame"
)
cat("\n=== FORMALS METODE S3 ===\n")
for (m in metode) {
  bagian <- strsplit(m, ":", fixed = TRUE)[[1]]
  hasil <- tryCatch({
    f <- utils::getS3method(bagian[1], bagian[2], optional = TRUE)
    if (is.null(f)) "<TIDAK ADA>" else paste(names(formals(args(f))), collapse = " ")
  }, error = function(e) "<GALAT>")
  cat(bagian[1], ".", bagian[2], ": ", hasil, "\n", sep = "")
}

cat("\n=== DATASET ===\n")
dataset <- list(
  ggplot2 = c("mpg", "diamonds"),
  tidyr = c("table1", "table2", "table3", "billboard", "who2", "household",
            "cms_patient_experience"),
  nycflights13 = "flights",
  palmerpenguins = "penguins"
)
for (paket in names(dataset)) {
  for (nama in dataset[[paket]]) {
    d <- tryCatch(getExportedValue(paket, nama), error = function(e) NULL)
    if (is.null(d)) {
      cat(paket, "::", nama, ": <TIDAK DITEMUKAN>\n", sep = "")
      next
    }
    cat(paket, "::", nama, " [", nrow(d), " x ", ncol(d), "] kelas: ",
        paste(class(d), collapse = "/"), "\n", sep = "")
    cat("  ", paste0(names(d), ":", vapply(d, function(x) class(x)[1L], ""),
                     collapse = ", "), "\n", sep = "")
  }
}

cat("\n=== NILAI KATEGORIKAL ggplot2::mpg ===\n")
m <- ggplot2::mpg
for (k in c("manufacturer", "drv", "fl", "class", "trans")) {
  cat(k, ": ", paste(sort(unique(as.character(m[[k]]))), collapse = " | "),
      "\n", sep = "")
}

cat("\n=== UKURAN DATA nycflights13 (untuk batas CRAN) ===\n")
folder <- system.file("data", package = "nycflights13")
if (nzchar(folder)) {
  berkas <- list.files(folder, full.names = TRUE)
  cat(paste0(basename(berkas), ": ", file.info(berkas)$size, " byte"),
      sep = "\n")
} else {
  cat("<folder data tidak ditemukan>\n")
}
cat("flights di memori:",
    format(object.size(nycflights13::flights), units = "MB"), "\n")

cat("\n=== SELESAI ===\n")
