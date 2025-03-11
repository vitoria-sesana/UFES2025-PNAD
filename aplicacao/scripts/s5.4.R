# proporcao formalidade e informalidade por genero ------------------------

a4_prop <-
  svyby(
    formula = ~V2007,
    by = ~formalidade,
    design = subset(
      base_design,
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

a4_ic <- 
  confint(
    object = a4_prop,
    level = nivel_confianca
  )
