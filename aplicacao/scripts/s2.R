# leitura -----------------------------------------------------------------

# unzip -------------------------------------------------------------------

unzip(
  zipfile = "aplicacao/bases/PNAD042024/Dicionario_e_input.zip",
  exdir = "aplicacao/bases/PNAD042024/Dicionario_e_input"
  )

# base ------------------------------------------------------------

b4 <- 
  PNADcIBGE::read_pnadc(
    microdata = "aplicacao/bases/PNAD042024/PNADC_042024.txt", 
    input_txt = "aplicacao/bases/PNAD042024/Dicionario_e_input/input_PNADC_trimestral.txt",
    vars = c(
      "V2007", # sexo
      "V2010", # cor/raca
      "V2009", # idade
      "VD3004", # nivel de instrucao
      "VD4016", # rendimento habitual
      "VD4002", # condicao de ocupacao
      "VD4009", # formalidade
      "V4019", # cadastro CNPJ
      "VD4012" # contribuinte 
      )
    )


