#' Data penguin untuk pembelajaran sains data
#'
#' Data pengamatan 344 ekor penguin dari tiga spesies di Kepulauan Palmer,
#' Antarktika. Data ini merupakan versi Bahasa Indonesia dari dataset
#' `penguins` pada paket `datasets`, dengan nama variabel yang diterjemahkan
#' untuk mendukung pembelajaran sains data menggunakan paket tidyversindonesia.
#'
#' @format Sebuah data frame dengan 344 observasi dan 8 variabel:
#' \describe{
#'   \item{spesies}{Nama spesies penguin.}
#'   \item{pulau}{Pulau tempat pengamatan dilakukan.}
#'   \item{panjang_paruh}{Panjang paruh dalam milimeter (mm).}
#'   \item{tebal_paruh}{Tebal paruh dalam milimeter (mm).}
#'   \item{panjang_sirip}{Panjang sirip dalam milimeter (mm).}
#'   \item{massa_tubuh}{Massa tubuh dalam gram (g).}
#'   \item{jenis_kelamin}{Jenis kelamin penguin.}
#'   \item{tahun}{Tahun pengamatan.}
#' }
#'
#' @source Dataset `penguins` dari paket `datasets` pada R.
#'
#' @examples
#' # Melihat enam baris pertama data
#' data_lihat_kepala(penguin)
#'
#' # Membuat grafik sebar (scatter plot)
#' visualisasi_ggplot(
#'   penguin,
#'   estetika(
#'     x = panjang_sirip,
#'     y = massa_tubuh
#'   )
#' ) +
#'   grafik_geometrik_titik()
#'
"penguin"
