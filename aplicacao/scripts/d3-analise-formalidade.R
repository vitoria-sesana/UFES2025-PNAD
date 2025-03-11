# resultados seção formalidade --------------------------------------------
# estimativas: proporção de formais e não formais no setor criativo 

# proporção formalidade e informalidade no ES em 2023 ---------------------

s3t1_prop <-
  svymean(
    x = ~ formalidade, 
    design = subset(
      base_design,
      VD4002 == "1"
    ),
    na.rm = TRUE
  )

s3t1_ic <- 
  confint(
    object = s3t1_prop,
    level = nivel_confianca
  )

s3t1_prop <- as.data.frame(s3t1_prop)

s3t1 <- 
  cbind(
    s3t1_prop,
    s3t1_ic
  ) %>%
  as.data.frame() %>% 
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
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# prop criativos e não criativos-------------------------------------------

s3t2_prop <-
  svyby(
    formula = ~formalidade,
    by = ~ocupacao_criativo,
    design = subset(
      base_design,
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t2_ic <- 
  confint(
    object = s3t2_prop,
    level = nivel_confianca
  )

# tratamento 
s3t2_prop <- 
  s3t2_prop %>% 
  pivot_longer(
  cols = c(formalidadeFormal,
           formalidadeInformal),
  names_to = "Tipo_Formalidade",
  values_to = "Proporção"
) %>% 
  rename(
    "Categoria" = "ocupacao_criativo", ##
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t2_ic <- 
  s3t2_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t2 <- 
  cbind(
    s3t2_prop,
    s3t2_ic
  )

# proporção formalidade e informalidade por segmentos ---------------------
s3t3_prop <-
  svyby(
    formula = ~formalidade,
    by = ~Segmento_Criativo_Agrupado,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t3_ic <- 
  confint(
    object = s3t3_prop,
    level = nivel_confianca
  )

# tratamento 
s3t3_prop <- s3t3_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
    ) %>% 
  rename(
    "Categoria" = "Segmento_Criativo_Agrupado",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t3_ic <- s3t3_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t3 <- 
  cbind(
    s3t3_prop,
    s3t3_ic
  )

# proporção formalidade e informalidade por gênero ------------------------
s3t4_prop <-
  svyby(
    formula = ~formalidade,
    by = ~V2007,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t4_ic <- 
  confint(
    object = s3t4_prop,
    level = nivel_confianca
  )

# tratamento 
s3t4_prop <- s3t4_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "V2007",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t4_ic <- s3t4_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t4 <- 
  cbind(
    s3t4_prop,
    s3t4_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = case_when(
      Categoria == 1 ~ "Homem",
      Categoria == 2 ~ "Mulher",
      .default = NA
    )
  )

# proporção formalidade e informalidade por cor/raça ----------------------

s3t5_prop <-
  svyby(
    formula = ~formalidade,
    by = ~V2010,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t5_ic <- 
  confint(
    object = s3t5_prop,
    level = nivel_confianca
  )

# tratamento 
s3t5_prop <- s3t5_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "V2010",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t5_ic <- s3t5_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t5 <- 
  cbind(
    s3t5_prop,
    s3t5_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = 
      case_when(
        Categoria == 1 ~ "Branca",
        Categoria == 2 ~ "Preta",
        Categoria == 3 ~ "Amarela",
        Categoria == 4 ~ "Parda",
        Categoria == 5 ~ "Indígena",
        Categoria == 9 ~ "Ignorado",
      .default = NA
    )
  )

# proporção informalidade por faixa etaria --------------------------------
s3t6_prop <-
  svyby(
    formula = ~formalidade,
    by = ~fx_etaria,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t6_ic <- 
  confint(
    object = s3t6_prop,
    level = nivel_confianca
  )

# tratamento 
s3t6_prop <- s3t6_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "fx_etaria",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t6_ic <- s3t6_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t6 <- 
  cbind(
    s3t6_prop,
    s3t6_ic
  ) %>% 
  as.data.frame() %>% 
  filter(Categoria != "14 anos")

# proporção informalidade por idade ---------------------------------------
s3t6_prop_2 <-
  svyby(
    formula = ~formalidade,
    by = ~idade,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t6_ic_2 <- 
  confint(
    object = s3t6_prop_2,
    level = nivel_confianca
  )

# tratamento 
s3t6_prop_2 <- s3t6_prop_2 %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "idade",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t6_ic_2 <- s3t6_ic_2 %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t6_2 <- 
  cbind(
    s3t6_prop_2,
    s3t6_ic_2
  ) %>% 
  as.data.frame()

# proporção formalidade e informalidade instrução -------------------------
s3t7_prop <-
  svyby(
    formula = ~formalidade,
    by = ~VD3004,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s3t7_ic <- 
  confint(
    object = s3t7_prop,
    level = nivel_confianca
  )

# tratamento 
s3t7_prop <- s3t7_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "VD3004",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t7_ic <- s3t7_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t7 <- 
  cbind(
    s3t7_prop,
    s3t7_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = 
      case_when(
        Categoria == 1 ~ "Sem instrução",
        Categoria == 2 ~ "Fundamental incompleto",
        Categoria == 3 ~ "Fundamental completo",
        Categoria == 4 ~ "Médio incompleto",
        Categoria == 5 ~ "Médio completo",
        Categoria == 6 ~ "Superior incompleto",
        Categoria == 7 ~ "Superior completo",
        .default = NA
      )
  )


# proporção formalidade e informalidade ocupação --------------------------

s3t8_prop <-
  svyby(
    formula = ~formalidade,
    by = ~VD4008,
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

# base_final_tratada %>% 
#   filter(ocupacao_criativo == "Criativo") %>% 
#   group_by(formalidade, VD4008) %>% 
#   summarise(n= n()) %>% 
#   arrange(VD4008) %>% 
#   mutate(
#     VD4008 = 
#       case_when(
#         VD4008 == 1 ~ "Empregado no setor privado",
#         VD4008 == 2 ~ "Trabalhador doméstico",
#         VD4008 == 3 ~ "Empregado no setor público",
#         VD4008 == 4 ~ "Empregador",
#         VD4008 == 5 ~ "Conta-própria",
#         VD4008 == 6 ~ "Trabalhador familiar auxiliar",
#         .default = NA
#       )
#   )
# 
# base_final_tratada %>% 
#   filter(ocupacao_criativo == "Criativo") %>% 
#   select(VD4008) %>% 
#   mutate(
#     VD4008 = 
#       case_when(
#         VD4008 == 1 ~ "Empregado no setor privado",
#         VD4008 == 2 ~ "Trabalhador doméstico",
#         VD4008 == 3 ~ "Empregado no setor público",
#         VD4008 == 4 ~ "Empregador",
#         VD4008 == 5 ~ "Conta-própria",
#         VD4008 == 6 ~ "Trabalhador familiar auxiliar",
#         .default = NA
#       )
#   ) %>% 
#   table

s3t8_ic <- 
  confint(
    object = s3t8_prop,
    level = nivel_confianca
  )

# tratamento 
s3t8_prop <- s3t8_prop %>%
  pivot_longer(
    cols = c(formalidadeFormal,
             formalidadeInformal),
    names_to = "Tipo_Formalidade",
    values_to = "Proporção"
  ) %>% 
  rename(
    "Categoria" = "VD4008",
    "Erro padrão" = "se1",
    "Formalidade" = "Tipo_Formalidade"
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

s3t8_ic <- s3t8_ic %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  arrange(rowname) %>% 
  rename(
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  select(-rowname)

s3t8 <- 
  cbind(
    s3t8_prop,
    s3t8_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = 
      case_when(
        Categoria == 1 ~ "Empregado no setor privado",
        Categoria == 2 ~ "Trabalhador doméstico",
        Categoria == 3 ~ "Empregado no setor público",
        Categoria == 4 ~ "Empregador",
        Categoria == 5 ~ "Conta-própria",
        Categoria == 6 ~ "Trabalhador familiar auxiliar",
        .default = NA
      )
  )
