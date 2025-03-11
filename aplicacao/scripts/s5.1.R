# total de ocupados -------------------------------------------------------

nivel_confianca = 0.95

a1_total <-
  svytotal(
    x = ~ VD4002, 
    design = base_design,
    na.rm = TRUE
  )

a1_ic <- 
  confint(
    object = a1_total,
    level = nivel_confianca
  )