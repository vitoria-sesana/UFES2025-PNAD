# leitura

# unzip -------------------------------------------------------------------

unzip(
  zipfile = "aplicacao/bases/PNAD042024/Dicionario_e_input.zip",
  exdir = "aplicacao/bases/PNAD042024/Dicionario_e_input"
  )

# 4º trimestre ------------------------------------------------------------

b4 <- 
  PNADcIBGE::read_pnadc(
    microdata = "aplicacao/bases/PNAD042024/PNADC_042024.txt", 
    input_txt = "aplicacao/bases/PNAD042024/Dicionario_e_input/input_PNADC_trimestral.txt",
    vars = c("V4013", # Código da principal atividade desse negócio/empresa 	código	Ver "Composição dos Grupamentos de Atividade" e “Relação de Códigos de Atividades” da CNAE-Domiciliar  
             "V2007", # sexo
             "V2010", # cor/raça
             "V2009", # idade
             "VD3004", # nível de instrução
             "VD4008", # posição na ocupação
             "VD4016", # rendimento habitual
             "VD4002", # 1 pessoa ocupada 2 pessoa desocupada
             "VD4009", # formalidade
             "V4019", # previdencia
             "VD4012" # previdencia
    )
  )


