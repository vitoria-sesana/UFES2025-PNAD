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
  ) %>% 
  round(2)

a4_prop <- a4_prop %>%
  pivot_longer(
    cols = c(V20071,
             V20072),
    names_to = "Genero",
    values_to = "Proporção"
  ) %>% 
  mutate(
    Proporção = round(Proporção, 2),
    se1 = round(se1, 2)
  ) %>% 
  rename(
    "Categoria" = "Genero",
    "Erro padrão" = "se1",
    "Formalidade" = "formalidade"
  ) %>% 
  select(-se2) %>% 
  arrange(
    Categoria,
    Formalidade
  ) %>% 
  mutate(
    Formalidade = 
      stringr::str_remove(
        string = Formalidade, 
        pattern = "formalidade") 
  ) %>% 
  relocate(
    Categoria,
    Formalidade,
    Proporção
  )

a4_ic <- a4_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "2.5 %",
    "Limite superior" = "97.5 %"
  ) %>% 
  select(-rowname)

a4 <- 
  cbind(
    a4_prop,
    a4_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = stringr::str_remove(
      string = Categoria, 
      pattern = "V2007") ,
    Categoria = case_when(
      Categoria == 1 ~ "Homem",
      Categoria == 2 ~ "Mulher",
      .default = NA
    )
  ) %>% 
  relocate(Formalidade, Categoria) %>% 
  arrange(Formalidade)


# a4_prop <-
#   svyby(
#     formula = ~formalidade,
#     by = ~V2007,
#     design = subset(
#       base_design,
#         VD4002 == "1"
#     ),
#     FUN = svymean,
#     na.rm = TRUE
#   )
# 
# a4_ic <- 
#   confint(
#     object = a4_prop,
#     level = nivel_confianca
#   ) %>% 
#   round(2)
# 
# a4_prop <- a4_prop %>%
#   pivot_longer(
#     cols = c(formalidadeFormal,
#              formalidadeInformal),
#     names_to = "Tipo_Formalidade",
#     values_to = "Proporção"
#   ) %>% 
#   mutate(
#     Proporção = round(Proporção, 2),
#     se1 = round(se1, 2)
#   ) %>% 
#   rename(
#     "Categoria" = "V2007",
#     "Erro padrão" = "se1",
#     "Formalidade" = "Tipo_Formalidade"
#   ) %>% 
#   select(-se2) %>% 
#   arrange(
#     Categoria,
#     Formalidade
#   ) %>% 
#   mutate(
#     Formalidade = 
#       stringr::str_remove(
#         string = Formalidade, 
#         pattern = "formalidade") 
#   ) %>% 
#   relocate(
#     Categoria,
#     Formalidade,
#     Proporção
#   )
# 
# a4_ic <- a4_ic %>% 
#   as.data.frame() %>% 
#   rownames_to_column() %>% 
#   arrange(rowname) %>% 
#   rename(
#     "Limite inferior" = "2.5 %",
#     "Limite superior" = "97.5 %"
#   ) %>% 
#   select(-rowname)
# 
# a4 <- 
#   cbind(
#     a4_prop,
#     a4_ic
#   ) %>% 
#   as.data.frame() %>% 
#   mutate(
#     Categoria = case_when(
#       Categoria == 1 ~ "Homem",
#       Categoria == 2 ~ "Mulher",
#       .default = NA
#     )
#   )
