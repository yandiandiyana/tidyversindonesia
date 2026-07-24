library(dplyr)

penguin <- datasets::penguins |>
  rename(
    spesies        = species,
    pulau          = island,
    panjang_paruh  = bill_len,
    tebal_paruh    = bill_dep,
    panjang_sirip  = flipper_len,
    massa_tubuh    = body_mass,
    jenis_kelamin  = sex,
    tahun          = year
  ) |>
  mutate(
    jenis_kelamin = recode(
      jenis_kelamin,
      male = "Jantan",
      female = "Betina"
    )
  )
