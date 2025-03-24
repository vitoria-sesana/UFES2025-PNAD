library(DiagrammeR)
library(ggplot2)

graph <- grViz("digraph Estratificacao {

  // Configurações gerais do gráfico
  graph [layout = dot, rankdir = TB, bgcolor = 'white', fontname = 'Helvetica']

  // Configurações dos nós
  node [shape = box, style = filled, fillcolor = lightblue, fontname = Helvetica, color = 'gray20', fontcolor = 'gray20']

  // Nós principais
  UF [label = 'UF', fillcolor = '#4e79a7', fontcolor = 'white']
  Capital [label = 'Capital', fillcolor = '#f28e2b', fontcolor = 'white']
  Demais_RM_RIDE [label = 'Demais Municípios da RM ou RIDE', fillcolor = '#e15759', fontcolor = 'white']
  Demais_UF [label = 'Demais Municípios da UF', fillcolor = '#76b7b2', fontcolor = 'white']
  Municipios_RIDE [label = 'Municípios da RIDE com sede em outra UF', fillcolor = '#59a14f', fontcolor = 'white']

  // Subgrafo 1: Divisão Administrativa
  subgraph cluster_1 {
    label = 'Divisão Administrativa';
    style = filled;
    fillcolor = '#f0f0f0';
    fontcolor = 'gray20';
    color = 'gray50';
    UF -> {Capital Demais_RM_RIDE Municipios_RIDE Demais_UF}
  }

  // Subgrafo 2: Estratificação Geográfica e Espacial
  subgraph cluster_2 {
    label = 'Estratificação Geográfica e Espacial';
    style = filled;
    fillcolor = '#f0f0f0';
    fontcolor = 'gray20';
    color = 'gray50';
    Capital -> {Bairros Distritos Subdistritos}
    Demais_RM_RIDE -> {Microrregioes}
    Municipios_RIDE -> {Microrregioes_RIDE}
    Demais_UF -> {Microrregioes_UF}
  }

  // Subgrafo 3: Situação Domiciliar
  subgraph cluster_3 {
    label = 'Situação Domiciliar';
    style = filled;
    fillcolor = '#f0f0f0';
    fontcolor = 'gray20';
    color = 'gray50';
    Bairros -> {Urbano Rural}
    Distritos -> {Urbano Rural}
    Subdistritos -> {Urbano Rural}
    Microrregioes -> {Urbano Rural}
    Microrregioes_RIDE -> {Urbano Rural}
    Microrregioes_UF -> {Urbano Rural}
  }

  // Subgrafo 4: Estratificação Estatística
  subgraph cluster_4 {
    label = 'Estratificação Estatística';
    style = filled;
    fillcolor = '#f0f0f0';
    fontcolor = 'gray20';
    color = 'gray50';
    Urbano -> {Estrato_Homogeneo}
    Rural -> {Estrato_Homogeneo}
  }

  // Configurações dos nós finais
  Estrato_Homogeneo [label = 'Estratificação Estatística\nMinimiza a variância considerando rendimento\ndos domicílios e DPPs', fillcolor = '#edc948', fontcolor = 'gray20']
  Estrato_1 [fillcolor = '#b07aa1', fontcolor = 'white']
  Estrato_2 [fillcolor = '#ff9da7', fontcolor = 'gray20']
  Estrato_3 [fillcolor = '#9c755f', fontcolor = 'white']

  // Conexões finais
  Estrato_Homogeneo -> {Estrato_1 Estrato_2 Estrato_3}
  Estrato_1
  Estrato_2
  Estrato_3
}")

# Exibir o diagrama
graph
