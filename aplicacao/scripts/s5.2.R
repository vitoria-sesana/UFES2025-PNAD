# rendimento médio --------------------------------------------------------

a2_media <-
  svymean(
    x = ~ VD4016, 
    design = subset(
      base_design,
      VD4002 == "1"
    ),
    na.rm = TRUE
  )

a2_ic <- 
  confint(
    object = a2_media ,
    level = nivel_confianca
  )