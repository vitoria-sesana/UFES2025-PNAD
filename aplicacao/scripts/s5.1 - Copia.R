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

a1_total <- as.data.frame(a1_total)

a1 <- 
  cbind(
    a1_total,
    a1_ic
  ) %>%
  as.data.frame() %>% 
  round(2) %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "VD4002") 
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Total" = "total",
    "Erro padrão" = "SE",
    "Limite inferior" = "2.5 %",
    "Limite superior" = "97.5 %"
  ) %>% 
  mutate(
    Categoria = case_when(
      Categoria == 1 ~ "Ocupado",
      Categoria == 2 ~ "Não ocupado",
      .default = NA
    )
  )
