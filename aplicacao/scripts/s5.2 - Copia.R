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

a2_media <- as.data.frame(a2_media)

a2 <- 
  cbind(
    a2_media,
    a2_ic
  ) %>% 
  as.data.frame() %>% 
  round(2) %>% 
  mutate(
    Categoria = "ES-2024"
  ) %>% 
  rename(
    "Rendimento médio" = "mean",
    "Erro padrão" = "SE",
    "Limite inferior" = "2.5 %",
    "Limite superior" = "97.5 %"
  ) %>% 
  relocate(Categoria)

