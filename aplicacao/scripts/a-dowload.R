# Dowload PNADc 2024 - 4º trimestre
# Rodar apenas 1 vez

# dowload -----------------------------------------------------------------

ano <- 2024

# 4º trimestre
PNADcIBGE::get_pnadc(ano,
                     quarter = 4,
                     deflator = TRUE,
                     design = FALSE, 
                     savedir = "aplicacao/bases/PNAD012024/")

