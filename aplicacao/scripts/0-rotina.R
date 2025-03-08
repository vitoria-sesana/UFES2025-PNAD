# Rotina de cálculo das estimativas de 2024 -------------------------------


# pacotes -----------------------------------------------------------------
library(PNADcIBGE) # pacote específico 

library(survey) 
library(srvyr)

library(data.table) # pactote para leitura e manipulacao de dados volumosos 
library(dplyr)
library(tidyverse)
library(openxlsx) # pacote para leitura e exportação 

# download da(s) base(s) ------------------------------------------------------
########################
# RODAR APENAS UMA VEZ #
# source(file = 'aplicacao/scripts/a-dowload.R', encoding = "UTF-8")
########################

# variaveis ---------------------------------------------------------------
nivel_confianca = 0.9


# rotina ------------------------------------------------------------------

# leitura e tratamento
source(file = 'aplicacao/scripts/b-leitura.R', encoding = "UTF-8")
source(file = 'aplicacao/scripts/c-tratamento.R', encoding = "UTF-8")


# estimativas
source(file = 'aplicacao/scripts/d-analises.R', encoding = "UTF-8")

# exportação
source(file = 'aplicacao/scripts/e-exportacao.R', encoding = "UTF-8")
