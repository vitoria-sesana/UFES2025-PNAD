# resultados seção formalidade --------------------------------------------
# estimativas: rendimento habitual no setor criativo por categorias 

# rendimento no ES em 2023 ------------------------------------------------

s2t1_media <-
  svymean(
    x = ~ VD4016, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    na.rm = TRUE
  )

s2t1_ic <- 
  confint(
    object = s2t1_media ,
    level = nivel_confianca
  )

s2t1_media <- as.data.frame(s2t1_media)


s2t1 <- 
  cbind(
    s2t1_media,
    s2t1_ic
  ) %>% 
  as.data.frame() %>% 
  mutate(
    Categoria = "ES em 2023"
  ) %>% 
  rename(
    "Rendimento médio" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  relocate(Categoria)

# rendimento entre criativos e não criativos no ES ------------------------

s2t2_media <-
  svyby(
    formula = ~VD4016, 
    by = ~ocupacao_criativo, 
    design = subset(
      base_design,
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t2_ic <- 
  confint(
    object = s2t2_media,
    level = nivel_confianca
  )

s2t2 <- 
  cbind(
    s2t2_media,
    s2t2_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "ocupacao_criativo",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 


# rendimento por segmento criativo ----------------------------------------

s2t3_media <-
  svyby(
    formula = ~VD4016, 
    by = ~Segmento_Criativo_Agrupado, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t3_ic <- 
  confint(
    object = s2t3_media,
    level = nivel_confianca
  )


s2t3 <- 
  cbind(
    s2t3_media,
    s2t3_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "Segmento_Criativo_Agrupado",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# rendimento por gênero ---------------------------------------------------

s2t4_media <-
  svyby(
    formula = ~VD4016, 
    by = ~V2007, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t4_ic <- 
  confint(
    object = s2t4_media,
    level = nivel_confianca
  )

s2t4 <- 
  cbind(
    s2t4_media,
    s2t4_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "V2007",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  mutate(
    Categoria = case_when(
      Categoria == 1 ~ "Homem",
      Categoria == 2 ~ "Mulher",
      .default = NA
    )
  )

# rendimento por cor/raça -------------------------------------------------
# ???????

s2t5_media <-
  svyby(
    formula = ~VD4016, 
    by = ~V2010, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1" & !is.na(VD4016) & !is.na(V2010) 
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t5_ic <- 
  confint(
    object = s2t5_media,
    level = nivel_confianca
  )

s2t5 <- 
  cbind(
    s2t5_media,
    s2t5_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "V2010",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  mutate(
    Categoria = case_when(
      Categoria == 1 ~ "Branca",
      Categoria == 2 ~ "Preta",
      Categoria == 3 ~ "Amarela",
      Categoria == 4 ~ "Parda",
      Categoria == 5 ~ "Indígena",
      Categoria == 9 ~ "Ignorado",
      .default = NA
    )
  )


# rendimento por faixa etária ---------------------------------------------

s2t6_media <-
  svyby(
    formula = ~VD4016, 
    by = ~fx_etaria, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" & VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t6_media

s2t6_ic <- 
  confint(
    object = s2t6_media,
    level = nivel_confianca
  )

s2t6 <- 
  cbind(
    s2t6_media,
    s2t6_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "fx_etaria",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 


# rendimento por idade ----------------------------------------------------

s2t6_media_2 <-
  svyby(
    formula = ~VD4016, 
    by = ~idade, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" & VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t6_media_2

s2t6_ic_2 <- 
  confint(
    object = s2t6_media_2,
    level = nivel_confianca
  )

s2t6_2 <- 
  cbind(
    s2t6_media_2,
    s2t6_ic_2
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "idade",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) 

# rendimento por nível de instrução ---------------------------------------

s2t7_media <-
  svyby(
    formula = ~VD4016, 
    by = ~VD3004, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1"
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t7_ic <- 
  confint(
    object = s2t7_media,
    level = nivel_confianca
  )

s2t7 <- 
  cbind(
    s2t7_media,
    s2t7_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "VD3004",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  mutate(
    Categoria = case_when(
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
# rendimento por posição na ocupação --------------------------------------
# ????

s2t8_media <-
  svyby(
    formula = ~VD4016, 
    by = ~VD4008, 
    design = subset(
      base_design,
      ocupacao_criativo == "Criativo" &
        VD4002 == "1" & !is.na(VD4016)
    ),
    FUN = svymean,
    na.rm = TRUE
  )

s2t8_ic <- 
  confint(
    object = s2t8_media,
    level = nivel_confianca
  )


s2t8 <- 
  cbind(
    s2t8_media,
    s2t8_ic
  ) %>%
  as.data.frame() %>%  
  rename(
    "Categoria" = "VD4008",
    "Rendimento médio" = "VD4016",
    "Erro padrão" = "se",
    "Limite inferior" = "5 %",
    "Limite superior" = "95 %"
  ) %>% 
  mutate(
    Categoria = case_when(
      Categoria == 1 ~ "Empregado no setor privado",
      Categoria == 2 ~ "Trabalhador doméstico",
      Categoria == 3 ~ "Empregado no setor público",
      Categoria == 4 ~ "Empregador",
      Categoria == 5 ~ "Conta-própria",
      Categoria == 6 ~ "Trabalhador familiar auxiliar",
        .default = NA
      )
  )
