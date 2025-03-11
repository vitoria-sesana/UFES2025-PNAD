# proporcao formalidade ---------------------------------------------------

a3_prop <-
  svymean(
    x = ~ formalidade, 
    design = subset(
      base_design,
      VD4002 == "1"
    ),
    na.rm = TRUE
  )

a3_ic <- 
  confint(
    object = a3_prop,
    level = nivel_confianca
  )

a3_prop <- as.data.frame(a3_prop)

a3 <- 
  cbind(
    a3_prop,
    a3_ic
  ) %>%
  as.data.frame() %>% 
  round(2) %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "formalidade") 
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "2.5 %",
    "Limite superior" = "97.5 %"
  ) 


