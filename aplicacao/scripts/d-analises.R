# analises inicias


# por setor ---------------------------------------------------------------

Setor <- 
  svytotal(
    x = ~formalidade,
    design = base_design,
    na.rm = TRUE
  )

confint(
  object = Setor, 
  level = nivel_confianca
)


# por segmento ------------------------------------------------------------

segmento <- 
  svytotal(
    x = ~ Setor,
    design = base_design,
    na.rm = TRUE
  )
segmento

confint(
  object=segmento, 
  level = 0.9 # nivel_confianca
  )


# por segmento agrupado ---------------------------------------------------

segmento_agrup <- 
  svytotal(
    x = ~Segmento_Criativo_Agrupado,
    design = base_design,
    na.rm = TRUE
  )
segmento_agrup

confint(
  object=segmento_agrup, 
  level = nivel_confianca
)
