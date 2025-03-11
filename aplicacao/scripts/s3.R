# manipulacao -------------------------------------------------------------

b4 <- as.data.table(b4)
base_final_tratada <- b4[UF == "32",]
rm(b4)

# faixa etaria ------------------------------------------------------------

base_final_tratada[, fx_etaria := fcase(
  V2009 >= 0 & V2009 <= 13, "0 a 13 anos",
  V2009 == 14, "14 anos",
  V2009 >= 15 & V2009 <= 17, "15 a 17 anos",
  V2009 >= 18 & V2009 <= 24, "18 a 24 anos",
  V2009 >= 25 & V2009 <= 29, "25 a 29 anos",
  V2009 >= 30 & V2009 <= 39, "30 a 39 anos",
  V2009 >= 40 & V2009 <= 49, "40 a 49 anos",
  V2009 >= 50 & V2009 <= 64, "50 a 59 anos",
  V2009 >= 65, "65 anos ou mais",
  default = NA
)]

base_final_tratada[, fx_etaria_2 := fcase(
  V2009 <= 29, "Jovens",
  V2009 >= 30 & V2009 <= 59, "Adultos",
  V2009 >= 60, "Idosos",
  default = NA
)]

# formalidade -------------------------------------------------------------

base_final_tratada[, formalidade := fcase(
  VD4009 %in% c("01", "03", "05", "07"),
  "Formal",
  VD4009 %in% c("02", "04", "06", "10", "08", "09"), 
  "Informal",
  (VD4009 %in% c("08", "07")) & (V4019 == "2" & VD4012 == "2"), 
  "Informal",
  (VD4009 %in% c("08", "07") & V4019 != "2") | 
    (VD4009 %in% c("08", "07") & VD4012 != "2"), 
  "Formal",
  default = NA
)]
