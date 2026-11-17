#' Penguin Kepulauan Palmer
#'
#' Ukuran tubuh tiga spesies penguin di Kepulauan Palmer, Antartika. Ini
#' adalah versi Bahasa Indonesia dari `palmerpenguins::penguins`. Nilai
#' numerik, urutan baris, dan nilai hilang tidak diubah; satuan tetap
#' milimeter dan gram.
#'
#' @format Sebuah tibble dengan 344 baris dan 8 kolom:
#' \describe{
#'   \item{spesies}{Spesies penguin: Adelie, Chinstrap, atau Gentoo. Asli:
#'   `species`.}
#'   \item{pulau}{Pulau tempat pengamatan: Biscoe, Dream, atau Torgersen.
#'   Asli: `island`.}
#'   \item{panjang_paruh_mm}{Panjang paruh dalam milimeter. Asli:
#'   `bill_length_mm`.}
#'   \item{kedalaman_paruh_mm}{Kedalaman paruh dalam milimeter. Asli:
#'   `bill_depth_mm`.}
#'   \item{panjang_sirip_mm}{Panjang sirip dalam milimeter. Asli:
#'   `flipper_length_mm`.}
#'   \item{massa_tubuh_g}{Massa tubuh dalam gram. Asli: `body_mass_g`.}
#'   \item{jenis_kelamin}{Jenis kelamin: `jantan` atau `betina`. Asli:
#'   `sex` (`male`, `female`).}
#'   \item{tahun}{Tahun pengamatan. Asli: `year`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan, dan nilai `jenis_kelamin` diterjemahkan dari
#' `male`/`female` menjadi `jantan`/`betina`. Nama spesies dan pulau tidak
#' diubah karena merupakan nama diri. Dataset asli tersedia sebagai
#' `palmerpenguins::penguins`.
#'
#' @source Data dikumpulkan oleh Dr. Kristen Gorman dan Palmer Station LTER,
#' tersedia melalui paket palmerpenguins (lisensi CC0).
#'
#' @seealso `palmerpenguins::penguins`
"penguin"

#' Efisiensi bahan bakar mobil populer 1999-2008
#'
#' Data efisiensi bahan bakar 38 model mobil populer tahun 1999-2008. Ini
#' adalah versi Bahasa Indonesia dari dataset `mpg` pada paket ggplot2. Nilai
#' numerik tidak diubah; satuan tetap mil per galon (MPG).
#'
#' @format Sebuah tibble dengan 234 baris dan 11 kolom:
#' \describe{
#'   \item{produsen}{Produsen mobil. Asli: `manufacturer`.}
#'   \item{model}{Nama model mobil. Asli: `model`.}
#'   \item{kapasitas_mesin}{Kapasitas mesin dalam liter. Asli: `displ`.}
#'   \item{tahun}{Tahun produksi mobil. Asli: `year`.}
#'   \item{silinder}{Jumlah silinder mesin. Asli: `cyl`.}
#'   \item{transmisi}{Jenis transmisi: `otomatis(...)` atau `manual(...)`.
#'     Asli: `trans`.}
#'   \item{penggerak}{Jenis sistem penggerak: `depan`, `belakang`, atau
#'     `4_roda`. Asli: `drv`.}
#'   \item{mpg_jalan_kota}{Efisiensi bahan bakar di jalan kota, dalam mil per
#'     galon (MPG). Asli: `cty`.}
#'   \item{mpg_jalan_raya}{Efisiensi bahan bakar di jalan raya, dalam mil per
#'     galon (MPG). Asli: `hwy`.}
#'   \item{bahan_bakar}{Jenis bahan bakar: `bensin_premium`,
#'     `bensin_reguler`, `etanol`, `diesel`, atau `CNG`. Asli: `fl`.}
#'   \item{kelas}{Kelas mobil: `2_penumpang`, `kompak`, `ukuran_menengah`,
#'     `minivan`, `pikap`, `subkompak`, atau `suv`. Asli: `class`.}
#' }
#'
#' @section Terjemahan nilai:
#' `transmisi` (asli: `trans`): `auto(av)` menjadi `otomatis(av)`, `auto(l3)`
#' menjadi `otomatis(l3)`, `auto(l4)` menjadi `otomatis(l4)`, `auto(l5)`
#' menjadi `otomatis(l5)`, `auto(l6)` menjadi `otomatis(l6)`, `auto(s4)`
#' menjadi `otomatis(s4)`, `auto(s5)` menjadi `otomatis(s5)`, `auto(s6)`
#' menjadi `otomatis(s6)`.
#'
#' `penggerak` (asli: `drv`): `4` menjadi `4_roda`, `f` menjadi `depan`, `r`
#' menjadi `belakang`.
#'
#' `bahan_bakar` (asli: `fl`): `c` menjadi `CNG`, `d` menjadi `diesel`, `e`
#' menjadi `etanol`, `p` menjadi `bensin_premium`, `r` menjadi
#' `bensin_reguler`.
#'
#' `kelas` (asli: `class`): `2seater` menjadi `2_penumpang`, `compact` menjadi
#' `kompak`, `midsize` menjadi `ukuran_menengah`, `pickup` menjadi `pikap`,
#' `subcompact` menjadi `subkompak`.
#'
#' Awalan `auto` pada `transmisi` menjadi `otomatis`; kode di dalam kurung
#' tidak diubah. Nama produsen dan model tidak diterjemahkan karena merupakan
#' nama diri.
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan dan sebagian nilai kategorikal. Jumlah dan urutan
#' baris, nilai numerik, dan nilai hilang tidak diubah. Dataset asli tetap
#' tersedia sebagai `ggplot2::mpg`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `ggplot2::mpg`, dengan perubahan
#' berupa nama kolom dan terjemahan nilai kategorikal. Dengan cara ini paket
#' ini tidak mendistribusikan ulang data tersebut; asal data dan status hak
#' pakainya tetap diatur oleh paket sumber. Paket ggplot2 dipasang otomatis
#' bersama paket ini.
#'
#' @rawNamespace export(mobil_mpg)
#'
#' @source Data asli dari EPA Fuel Economy Data,
#' \url{https://fueleconomy.gov/}, melalui `ggplot2::mpg`. Asal data asli dan
#' status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [ggplot2::mpg]
"mobil_mpg"

#' Uji jalan mobil dari majalah Motor Trend
#'
#' Data diekstrak dari majalah Motor Trend US tahun 1974. Memuat efisiensi
#' bahan bakar dan 10 aspek desain dan kinerja 32 mobil (model 1973-74). Ini
#' adalah versi Bahasa Indonesia dari dataset `mtcars` pada paket datasets.
#' Nilai numerik tidak diubah, dan satuan tetap satuan AS (mil per galon, inci
#' kubik, ribuan pon).
#'
#' @format Sebuah tibble dengan 32 baris dan 12 kolom:
#' \describe{
#'   \item{mobil}{Nama mobil. Asli: nama baris `mtcars`.}
#'   \item{efisiensi_mpg}{Efisiensi bahan bakar dalam mil per galon AS; makin
#'     besar makin hemat. Asli: `mpg`.}
#'   \item{silinder}{Jumlah silinder. Asli: `cyl`.}
#'   \item{kapasitas_mesin_in3}{Kapasitas mesin dalam inci kubik. Berbeda
#'     dari `kapasitas_mesin` pada `mobil_mpg` yang berupa liter. Asli:
#'     `disp`.}
#'   \item{tenaga_kuda}{Tenaga kuda kotor (gross horsepower). Asli: `hp`.}
#'   \item{rasio_gardan}{Rasio gardan belakang (rear axle ratio). Asli:
#'     `drat`.}
#'   \item{berat_ribu_lb}{Berat dalam ribuan pon. Asli: `wt`.}
#'   \item{waktu_seperempat_mil}{Waktu menempuh seperempat mil. Dokumentasi
#'     asli tidak menyebut satuannya. Asli: `qsec`.}
#'   \item{bentuk_mesin}{Bentuk mesin: 0 = V, 1 = lurus. Angka tidak diubah.
#'     Asli: `vs`.}
#'   \item{kode_transmisi}{Transmisi: 0 = otomatis, 1 = manual. Angka tidak
#'     diubah. Berbeda dari `transmisi` pada `mobil_mpg` yang berupa teks.
#'     Asli: `am`.}
#'   \item{jumlah_gigi}{Jumlah gigi maju. Asli: `gear`.}
#'   \item{jumlah_karburator}{Jumlah karburator. Asli: `carb`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama baris dipindahkan menjadi kolom pertama `mobil`, dan nama kolom
#' diterjemahkan. Objek hasilnya berupa tibble (aslinya data frame dengan nama
#' baris), seperti dataset lokal lainnya. Nilai, satuan, urutan baris, dan
#' nilai hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `datasets::mtcars`.
#'
#' @section Catatan dari sumber asli:
#' Dokumentasi asli mencatat bahwa mesin rotari Mazda dikodekan sebagai enam
#' silinder lurus, mesin datar Porsche sebagai V, dan Mercedes 240D (diesel)
#' tetap disertakan agar sebanding dengan analisis terdahulu. Catatan ini
#' tidak diubah.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `datasets::mtcars`, dengan
#' perubahan berupa nama kolom dan pemindahan nama baris menjadi kolom
#' `mobil`. Paket datasets adalah bagian dari R.
#'
#' @rawNamespace export(mobil)
#'
#' @source Henderson dan Velleman (1981), Building multiple regression models
#' interactively. Biometrics, 37, 391-411, melalui `datasets::mtcars`. Asal
#' data asli dan status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [datasets::mtcars]
#'
#' @examples
#' head(mobil)
#'
#' mobil |>
#'   vis_ggplot(grf_estetika(x = berat_ribu_lb, y = efisiensi_mpg)) +
#'   grf_geometrik_titik()
"mobil"

#' Harga dan ciri berlian
#'
#' Harga dan ciri lebih dari 50.000 berlian. Ini adalah versi Bahasa Indonesia
#' dari dataset `diamonds` pada paket ggplot2. Nilai numerik tidak diubah.
#'
#' @format Sebuah tibble dengan 53.940 baris dan 10 kolom:
#' \describe{
#'   \item{karat}{Berat berlian dalam karat. Asli: `carat`.}
#'   \item{potongan}{Kualitas potongan, faktor berurutan dari terburuk ke
#'     terbaik: `Cukup`, `Baik`, `Sangat Baik`, `Premium`, `Ideal`. Asli:
#'     `cut`.}
#'   \item{warna}{Warna berlian, faktor berurutan dari `D` (terbaik) sampai
#'     `J` (terburuk). Nilai tidak diubah. Asli: `color`.}
#'   \item{kejernihan}{Kejernihan berlian, faktor berurutan dari `I1`
#'     (terburuk) sampai `IF` (terbaik). Nilai tidak diubah. Asli:
#'     `clarity`.}
#'   \item{kedalaman_persen}{Kedalaman total dalam persen, dihitung dari
#'     `kedalaman_mm` dibagi rerata `panjang_mm` dan `lebar_mm`. Asli:
#'     `depth`.}
#'   \item{meja_persen}{Lebar bagian atas (meja) berlian relatif terhadap
#'     titik terlebar, dalam persen. Asli: `table`.}
#'   \item{harga}{Harga dalam dolar AS. Asli: `price`.}
#'   \item{panjang_mm}{Panjang dalam milimeter. Asli: `x`.}
#'   \item{lebar_mm}{Lebar dalam milimeter. Asli: `y`.}
#'   \item{kedalaman_mm}{Kedalaman dalam milimeter. Asli: `z`.}
#' }
#'
#' @section Terjemahan nilai:
#' `potongan` (asli: `cut`): `Fair` menjadi `Cukup`, `Good` menjadi `Baik`,
#' `Very Good` menjadi `Sangat Baik`.
#'
#' Hanya level `cut` yang diterjemahkan; urutan level dan kelas faktor
#' berurutan dipertahankan. Level `color` dan `clarity` adalah kode dan tidak
#' diubah.
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan dan sebagian nilai kategorikal. Jumlah dan urutan
#' baris, nilai numerik, dan nilai hilang tidak diubah. Dataset asli tetap
#' tersedia sebagai `ggplot2::diamonds`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `ggplot2::diamonds`, dengan
#' perubahan berupa nama kolom dan terjemahan nilai kategorikal. Dengan cara
#' ini paket ini tidak mendistribusikan ulang data tersebut; asal data dan
#' status hak pakainya tetap diatur oleh paket sumber. Paket ggplot2 dipasang
#' otomatis bersama paket ini.
#'
#' @rawNamespace export(berlian)
#'
#' @source Data asli melalui `ggplot2::diamonds` (paket ggplot2, lisensi MIT).
#' Asal data asli dan status hak pakainya diatur oleh paket sumber; paket ini
#' tidak mendistribusikan ulang data tersebut.
#'
#' @seealso [ggplot2::diamonds]
"berlian"

#' Contoh tabel rapi: kasus dan populasi (bentuk 1)
#'
#' Versi Bahasa Indonesia dari `table1` pada paket tidyr. Data yang sama
#' tersedia dalam bentuk berbeda sebagai `tabel2` dan `tabel3`.
#'
#' @format Sebuah tibble dengan 6 baris dan 4 kolom:
#' \describe{
#'   \item{negara}{Nama negara. Asli: `country`.}
#'   \item{tahun}{Tahun. Asli: `year`.}
#'   \item{kasus}{Jumlah kasus. Asli: `cases`.}
#'   \item{populasi}{Jumlah penduduk. Asli: `population`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai `tidyr::table1`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::table1`, dengan perubahan
#' berupa nama kolom. Dengan cara ini paket ini tidak mendistribusikan ulang
#' data tersebut; asal data dan status hak pakainya tetap diatur oleh paket
#' sumber. Paket tidyr dipasang otomatis bersama paket ini.
#'
#' @rawNamespace export(tabel1)
#'
#' @source Data asli melalui `tidyr::table1` (paket tidyr, lisensi MIT). Asal
#' data asli dan status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::table1]
"tabel1"

#' Contoh tabel: kasus dan populasi (bentuk 2)
#'
#' Versi Bahasa Indonesia dari `table2` pada paket tidyr: satu baris per
#' negara, tahun, dan jenis ukuran.
#'
#' @format Sebuah tibble dengan 12 baris dan 4 kolom:
#' \describe{
#'   \item{negara}{Nama negara. Asli: `country`.}
#'   \item{tahun}{Tahun. Asli: `year`.}
#'   \item{jenis}{Jenis ukuran: `kasus` atau `populasi`. Asli: `type`.}
#'   \item{jumlah}{Nilai ukuran. Asli: `count`.}
#' }
#'
#' @section Terjemahan nilai:
#' `jenis` (asli: `type`): `cases` menjadi `kasus`, `population` menjadi
#' `populasi`.
#'
#' Nilai `jenis` diterjemahkan dari `cases` dan `population` agar sejalan
#' dengan nama kolom `tabel1` setelah `rpi_lebar()`.
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan dan sebagian nilai kategorikal. Jumlah dan urutan
#' baris, nilai numerik, dan nilai hilang tidak diubah. Dataset asli tetap
#' tersedia sebagai `tidyr::table2`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::table2`, dengan perubahan
#' berupa nama kolom dan terjemahan nilai kategorikal. Dengan cara ini paket
#' ini tidak mendistribusikan ulang data tersebut; asal data dan status hak
#' pakainya tetap diatur oleh paket sumber. Paket tidyr dipasang otomatis
#' bersama paket ini.
#'
#' @rawNamespace export(tabel2)
#'
#' @source Data asli melalui `tidyr::table2` (paket tidyr, lisensi MIT). Asal
#' data asli dan status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::table2]
"tabel2"

#' Contoh tabel: kasus dan populasi (bentuk 3)
#'
#' Versi Bahasa Indonesia dari `table3` pada paket tidyr: kasus dan populasi
#' digabung dalam satu kolom teks.
#'
#' @format Sebuah tibble dengan 6 baris dan 3 kolom:
#' \describe{
#'   \item{negara}{Nama negara. Asli: `country`.}
#'   \item{tahun}{Tahun. Asli: `year`.}
#'   \item{rasio}{Kasus dan populasi sebagai satu teks berbentuk
#'     `kasus/populasi`. Asli: `rate`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai `tidyr::table3`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::table3`, dengan perubahan
#' berupa nama kolom. Dengan cara ini paket ini tidak mendistribusikan ulang
#' data tersebut; asal data dan status hak pakainya tetap diatur oleh paket
#' sumber. Paket tidyr dipasang otomatis bersama paket ini.
#'
#' @rawNamespace export(tabel3)
#'
#' @source Data asli melalui `tidyr::table3` (paket tidyr, lisensi MIT). Asal
#' data asli dan status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::table3]
"tabel3"

#' Peringkat lagu pada tangga lagu Billboard
#'
#' Versi Bahasa Indonesia dari `billboard` pada paket tidyr: peringkat
#' mingguan lagu pada tangga lagu Billboard. Kolom `minggu1` sampai `minggu76`
#' adalah padanan `wk1` sampai `wk76`.
#'
#' @format Sebuah tibble dengan 317 baris dan 79 kolom:
#' \describe{
#'   \item{artis}{Nama artis. Asli: `artist`.}
#'   \item{lagu}{Judul lagu. Asli: `track`.}
#'   \item{tanggal_masuk}{Tanggal lagu pertama masuk tangga lagu. Asli:
#'     `date.entered`.}
#'   \item{minggu1, ..., minggu76}{Peringkat lagu pada minggu ke-n sejak
#'     masuk tangga lagu. Asli: `wk1`, ..., `wk76`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `tidyr::billboard`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::billboard`, dengan
#' perubahan berupa nama kolom. Dengan cara ini paket ini tidak
#' mendistribusikan ulang data tersebut; asal data dan status hak pakainya
#' tetap diatur oleh paket sumber. Paket tidyr dipasang otomatis bersama paket
#' ini.
#'
#' @rawNamespace export(tangga_lagu)
#'
#' @source Data asli melalui `tidyr::billboard` (paket tidyr, lisensi MIT).
#' Asal data asli dan status hak pakainya diatur oleh paket sumber; paket ini
#' tidak mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::billboard]
"tangga_lagu"

#' Kasus tuberkulosis menurut WHO (kolom bersandi)
#'
#' Versi Bahasa Indonesia dari `who2` pada paket tidyr. Hanya kolom `negara`
#' dan `tahun` yang diterjemahkan. Kolom sisanya tetap bernama kode WHO
#' berformat `<diagnosis>_<jenis kelamin>_<kelompok umur>` agar teknik memecah
#' nama kolom pada [rpi_panjang()] tetap sama.
#'
#' @format Sebuah tibble dengan 7.240 baris dan 58 kolom:
#' \describe{
#'   \item{negara}{Nama negara. Asli: `country`.}
#'   \item{tahun}{Tahun. Asli: `year`.}
#'   \item{sp_m_014, ..., rel_f_65}{Jumlah kasus menurut kode WHO. Nama kolom
#'     tidak diubah (56 kolom).}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai `tidyr::who2`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::who2`, dengan perubahan
#' berupa nama kolom. Dengan cara ini paket ini tidak mendistribusikan ulang
#' data tersebut; asal data dan status hak pakainya tetap diatur oleh paket
#' sumber. Paket tidyr dipasang otomatis bersama paket ini.
#'
#' @rawNamespace export(tb_who)
#'
#' @source Data asli melalui `tidyr::who2` (paket tidyr, lisensi MIT). Asal
#' data asli dan status hak pakainya diatur oleh paket sumber; paket ini tidak
#' mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::who2]
"tb_who"

#' Contoh data rumah tangga dengan dua anak
#'
#' Versi Bahasa Indonesia dari `household` pada paket tidyr. Nama kolom
#' berpola `<nilai>_<anak>` agar `pemisah_nama = "_"` dapat memecahnya.
#'
#' @format Sebuah tibble dengan 5 baris dan 5 kolom:
#' \describe{
#'   \item{keluarga}{Nomor keluarga. Asli: `family`.}
#'   \item{lahir_anak1}{Tanggal lahir anak pertama. Asli: `dob_child1`.}
#'   \item{lahir_anak2}{Tanggal lahir anak kedua. Asli: `dob_child2`.}
#'   \item{nama_anak1}{Nama anak pertama. Asli: `name_child1`.}
#'   \item{nama_anak2}{Nama anak kedua. Asli: `name_child2`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `tidyr::household`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::household`, dengan
#' perubahan berupa nama kolom. Dengan cara ini paket ini tidak
#' mendistribusikan ulang data tersebut; asal data dan status hak pakainya
#' tetap diatur oleh paket sumber. Paket tidyr dipasang otomatis bersama paket
#' ini.
#'
#' @rawNamespace export(rumah_tangga)
#'
#' @source Data asli melalui `tidyr::household` (paket tidyr, lisensi MIT).
#' Asal data asli dan status hak pakainya diatur oleh paket sumber; paket ini
#' tidak mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::household]
"rumah_tangga"

#' Pengalaman pasien menurut organisasi layanan kesehatan
#'
#' Versi Bahasa Indonesia dari `cms_patient_experience` pada paket tidyr. Dua
#' kolom organisasi berawalan sama (`organisasi_`) agar dapat dipilih dengan
#' [frm_diawali()].
#'
#' @format Sebuah tibble dengan 500 baris dan 5 kolom:
#' \describe{
#'   \item{organisasi_id}{Pengenal organisasi. Asli: `org_pac_id`.}
#'   \item{organisasi_nama}{Nama organisasi. Asli: `org_nm`.}
#'   \item{ukuran_kode}{Kode ukuran. Asli: `measure_cd`.}
#'   \item{ukuran_judul}{Judul ukuran. Asli: `measure_title`.}
#'   \item{tingkat_kinerja}{Tingkat kinerja. Asli: `prf_rate`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `tidyr::cms_patient_experience`.
#'
#' @section Cara penyediaan:
#' Berbeda dari `penguin`, dataset ini tidak disimpan di dalam paket. Objek
#' ini dibuat saat pertama kali dipakai dari `tidyr::cms_patient_experience`,
#' dengan perubahan berupa nama kolom. Dengan cara ini paket ini tidak
#' mendistribusikan ulang data tersebut; asal data dan status hak pakainya
#' tetap diatur oleh paket sumber. Paket tidyr dipasang otomatis bersama paket
#' ini.
#'
#' @rawNamespace export(pengalaman_pasien)
#'
#' @source Data asli melalui `tidyr::cms_patient_experience` (paket tidyr,
#' lisensi MIT). Asal data asli dan status hak pakainya diatur oleh paket
#' sumber; paket ini tidak mendistribusikan ulang data tersebut.
#'
#' @seealso [tidyr::cms_patient_experience]
"pengalaman_pasien"

#' Penerbangan dari Kota New York, 2013
#'
#' Data ketepatan waktu penerbangan dari Kota New York pada tahun 2013. Ini
#' adalah versi Bahasa Indonesia dari dataset `flights` pada paket
#' nycflights13. Nilai, satuan (menit, mil, HHMM), urutan baris, dan nilai
#' hilang tidak diubah.
#'
#' @format Sebuah tibble dengan 336.776 baris dan 19 kolom:
#' \describe{
#'   \item{tahun}{Tahun keberangkatan. Asli: `year`.}
#'   \item{bulan}{Bulan keberangkatan. Asli: `month`.}
#'   \item{hari}{Hari keberangkatan. Asli: `day`.}
#'   \item{waktu_berangkat}{Waktu keberangkatan aktual dalam format HHMM atau
#'     HMM, zona waktu lokal. Asli: `dep_time`.}
#'   \item{waktu_jadwal_berangkat}{Waktu keberangkatan terjadwal dalam format
#'     HHMM atau HMM, zona waktu lokal. Asli: `sched_dep_time`.}
#'   \item{keterlambatan_berangkat}{Keterlambatan keberangkatan dalam menit;
#'     nilai negatif berarti lebih awal. Asli: `dep_delay`.}
#'   \item{waktu_tiba}{Waktu kedatangan aktual dalam format HHMM atau HMM,
#'     zona waktu lokal. Asli: `arr_time`.}
#'   \item{waktu_jadwal_tiba}{Waktu kedatangan terjadwal dalam format HHMM
#'     atau HMM, zona waktu lokal. Asli: `sched_arr_time`.}
#'   \item{keterlambatan_tiba}{Keterlambatan kedatangan dalam menit; nilai
#'     negatif berarti lebih awal. Asli: `arr_delay`.}
#'   \item{maskapai}{Singkatan dua huruf maskapai. Nama maskapai ada pada
#'     `nycflights13::airlines`. Asli: `carrier`.}
#'   \item{nomor_penerbangan}{Nomor penerbangan. Asli: `flight`.}
#'   \item{nomor_ekor}{Nomor ekor pesawat. Metadata tambahan ada pada
#'     `nycflights13::planes`. Asli: `tailnum`.}
#'   \item{asal}{Bandara asal. Metadata tambahan ada pada
#'     `nycflights13::airports`. Asli: `origin`.}
#'   \item{tujuan}{Bandara tujuan. Metadata tambahan ada pada
#'     `nycflights13::airports`. Asli: `dest`.}
#'   \item{waktu_terbang}{Waktu di udara, dalam menit. Asli: `air_time`.}
#'   \item{jarak}{Jarak antarbandara, dalam mil. Asli: `distance`.}
#'   \item{jam}{Jam keberangkatan terjadwal. Asli: `hour`.}
#'   \item{menit}{Menit keberangkatan terjadwal. Asli: `minute`.}
#'   \item{waktu_jam}{Tanggal dan jam penerbangan terjadwal sebagai
#'     `POSIXct`. Bersama `asal`, dapat dipakai untuk menggabungkan dengan
#'     data cuaca. Asli: `time_hour`.}
#' }
#'
#' @section Perbedaan dengan dataset asli:
#' Nama kolom diterjemahkan. Jumlah dan urutan baris, nilai numerik, dan nilai
#' hilang tidak diubah. Dataset asli tetap tersedia sebagai
#' `nycflights13::flights`.
#'
#' @section Cara penyediaan:
#' Berbeda dari dataset lain, `penerbangan` tidak disimpan di dalam paket.
#' Objek ini dibuat saat pertama kali dipakai dari `nycflights13::flights`
#' (hanya tabel `flights`), dengan satu-satunya perubahan berupa nama kolom.
#' Cara ini dipilih karena tabel `flights` saja berukuran sekitar 4,3 MB
#' dengan kompresi bzip2, sehingga bila disimpan di dalam paket, ukuran paket
#' melampaui batas 5 MB yang dianjurkan CRAN. Paket nycflights13 dipasang
#' otomatis bersama paket ini.
#'
#' @rawNamespace export(penerbangan)
#'
#' @source Data asli dari RITA, Bureau of Transportation Statistics,
#' \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236},
#' melalui paket nycflights13 (lisensi CC0).
#'
#' @seealso [nycflights13::flights]
"penerbangan"
