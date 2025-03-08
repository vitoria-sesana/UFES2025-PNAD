# resultados seção ocupação -----------------------------------------------
# estimativas: proporção de ocupados no setor criativo por categoria

# proporção de ocupados no setor criativo no ES em 2023 ------------------
s1t1_prop <-
  svymean(
    x = ~ ocupacao_criativo, 
    design = subset(base_design,
                    VD4002 == "1"),
    na.rm = TRUE
  )  

s1t1_ic <- 
  confint(
    object = s1t1_prop,
    level = nivel_confianca
  )

s1t1_prop <- as.data.frame(s1t1_prop)

s1t1 <- 
  cbind(
    s1t1_prop,
    s1t1_ic
    ) %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "ocupacao_criativo")
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# proporção de ocupados no setor criativo por segmento criativo -----------

s1t2_prop <- 
  svymean(
    x = ~ Segmento_Criativo_Agrupado, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
      ),
    na.rm = TRUE
  )

s1t2_ic <- 
  confint(
    object = s1t2_prop,
    level = nivel_confianca
  )

s1t2_prop <- as.data.frame(s1t2_prop)

s1t2 <- 
  cbind(
    s1t2_prop,
    s1t2_ic
  ) %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "Segmento_Criativo_Agrupado")
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 
# gênero no setor criativo ------------------------------------------------

s1t3_prop <-
  svymean(
    x = ~ V2007, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
    )

s1t3_ic <- 
  confint(
    object = s1t3_prop,
    level = nivel_confianca
    )

s1t3_prop <- as.data.frame(s1t3_prop)

s1t3 <- 
  cbind(
    s1t3_prop,
    s1t3_ic
  ) %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "V2007"),
    rowname = case_when(
      rowname == 1 ~ "Homem",
      rowname == 2 ~ "Mulher",
      .default = NA
    )
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# cor/raça no setor criativo ----------------------------------------------

s1t4_prop <-
  svymean(
    x = ~ V2010, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )

s1t4_ic <- 
  confint(
    object = s1t4_prop,
    level = nivel_confianca
  )

s1t4_prop <- as.data.frame(s1t4_prop)

s1t4 <- 
  cbind(
    s1t4_prop,
    s1t4_ic
  ) %>% 
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "V2010"),
    rowname = case_when(
      rowname == 1 ~ "Branca",
      rowname == 2 ~ "Preta",
      rowname == 3 ~ "Amarela",
      rowname == 4 ~ "Parda",
      rowname == 5 ~ "Indígena",
      rowname == 9 ~ "Ignorado",
      .default = NA
    )
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# faixa etária no setor criativo ------------------------------------------
s1t5_prop <-
  svymean(
    x = ~ fx_etaria, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )

s1t5_ic <- 
  confint(
    object = s1t5_prop,
    level = nivel_confianca
  )

s1t5_prop <- as.data.frame(s1t5_prop)

s1t5 <- 
  cbind(
    s1t5_prop,
    s1t5_ic
  ) %>%
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "fx_etaria") 
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 


# idade no setor criativo -------------------------------------------------

s1t5_prop_2 <-
  svymean(
    x = ~ idade, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )

s1t5_ic_2 <- 
  confint(
    object = s1t5_prop_2,
    level = nivel_confianca
  )

s1t5_prop_2 <- as.data.frame(s1t5_prop_2)

s1t5_2 <- 
  cbind(
    s1t5_prop_2,
    s1t5_ic_2
  ) %>%
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "idade") 
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 


# nível de instrução no setor criativo ------------------------------------
s1t6_prop <-
  svymean(
    x = ~ VD3004, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )


s1t6_ic <- 
  confint(
    object = s1t6_prop,
    level = nivel_confianca
  )


s1t6_prop <- as.data.frame(s1t6_prop)

s1t6 <- 
  cbind(
    s1t6_prop,
    s1t6_ic
  ) %>%
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "VD3004"),
    rowname = case_when(
      rowname == 1 ~ "Sem instrução",
      rowname == 2 ~ "Fundamental incompleto",
      rowname == 3 ~ "Fundamental completo",
      rowname == 4 ~ "Médio incompleto",
      rowname == 5 ~ "Médio completo",
      rowname == 6 ~ "Superior incompleto",
      rowname == 7 ~ "Superior completo",
      .default = NA
    )
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# posições ocupadas -------------------------------------------------------
s1t7_prop <-
  svymean(
    x = ~ VD4008, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )

s1t7_ic <- 
  confint(
    object = s1t7_prop,
    level = nivel_confianca
  )

s1t7_prop <- as.data.frame(s1t7_prop)

s1t7 <- 
  cbind(
    s1t7_prop,
    s1t7_ic
  ) %>%
  as.data.frame() %>% 
  rownames_to_column() %>% 
  mutate(
    rowname = 
      stringr::str_remove(
        string = rowname, 
        pattern = "VD4008"),
    rowname = case_when(
      rowname == 1 ~ "Empregado no setor privado",
      rowname == 2 ~ "Trabalhador doméstico",
      rowname == 3 ~ "Empregado no setor público",
      rowname == 4 ~ "Empregador",
      rowname == 5 ~ "Conta-própria",
      rowname == 6 ~ "Trabalhador familiar auxiliar",
      .default = NA
    )
  ) %>% 
  rename(
    "Categoria" = "rowname",
    "Proporção" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

