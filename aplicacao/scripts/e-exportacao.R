# exportação das estimativas e seus intervalos de confiança

# ocupação ----------------------------------------------------------------

xlsx_ocupacao <- createWorkbook()

addWorksheet(
  xlsx_ocupacao,
  "Criativos e Não Criativos")
writeData(
  xlsx_ocupacao,
  "Criativos e Não Criativos",
  s1t1)

addWorksheet(
  xlsx_ocupacao,
  "Segmentos Criativos")
writeData(
  xlsx_ocupacao,
  "Segmentos Criativos",
  s1t2
  )

addWorksheet(
  xlsx_ocupacao,
  "Gênero")
writeData(
  xlsx_ocupacao,
  "Gênero",
  s1t3
)

addWorksheet(
  xlsx_ocupacao,
  "Cor ou raça")
writeData(
  xlsx_ocupacao,
  "Cor ou raça",
  s1t4
)

addWorksheet(
  xlsx_ocupacao,
  "Faixa etária")
writeData(
  xlsx_ocupacao,
  "Faixa etária",
  s1t5
)

addWorksheet(
  xlsx_ocupacao,
  "Sugestão faixa etária")
writeData(
  xlsx_ocupacao,
  "Sugestão faixa etária",
  s1t5_2
)

addWorksheet(
  xlsx_ocupacao,
  "Instrução")
writeData(
  xlsx_ocupacao,
  "Instrução",
  s1t6
)

addWorksheet(
  xlsx_ocupacao,
  "Posição na ocupação")
writeData(
  xlsx_ocupacao,
  "Posição na ocupação",
  s1t7
)

# saídas ------------------------------------------------------------------

saveWorkbook(
  xlsx_ocupacao,
  file = "2024/estimativas_2024/saidas/estimativas_1_proporcao_ocupacao.xlsx",
  overwrite = TRUE)

