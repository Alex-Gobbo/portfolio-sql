# 🍫 Projeto de Análise de Vendas de Chocolate com SQL (MySQL)

Este projeto utiliza SQL (MySQL) para realizar uma análise exploratória em um conjunto de dados de vendas de chocolate, com foco no desenvolvimento de habilidades em análise de dados e geração de insights para tomada de decisão.

## 🎯 Objetivo

Desenvolver habilidades em análise de dados com SQL, explorando padrões de vendas por mês, país e ticket médio para gerar insights de negócio.

## 📖 Sobre

Este projeto utiliza a base de dados [**Chocolate Sales**](https://www.kaggle.com/datasets/atharvasoundankar/chocolate-sales), disponível no Kaggle. Ela simula transações de vendas de produtos de chocolate em diversos países, com dados úteis para análises comerciais.

### 🧾 Descrição das colunas

| **Coluna**         | **Descrição**                                                           |
|--------------------|-------------------------------------------------------------------------|
| `Sales Person`     | Nome do(a) vendedor(a) responsável pela venda                           |
| `Country`          | País onde a venda foi realizada                                         |
| `Product`          | Nome do produto de chocolate vendido                                    |
| `Date`             | Data da venda                                                           |
| `Amount`           | Valor total da venda                                                    |
| `Boxes Shipped`    | Quantidade de caixas enviadas                                           |

## 📊 Tópicos de Análise

Este projeto foi estruturado em diferentes blocos de análise. Abaixo, estão os tópicos abordados:

### 🔹 Análises Gerais
Análises iniciais para entender o panorama geral das vendas.

### 🍫 Análise de Produtos
Examina quais produtos de chocolate são mais vendidos.

### 🧑‍💼 Análise de Vendedores
Investiga o desempenho individual dos vendedores.

### 🌍 Análise Geográfica
Foca nos países onde ocorrem as vendas.

### 📈 Análise de Tendências e Sazonalidade
Explora o comportamento das vendas ao longo do tempo.

## ❓ Questões de Negócio Respondidas

Durante a análise da base de dados, algumas perguntas foram formuladas para obter insights relevantes. Abaixo estão as principais questões organizadas por tipo de análise:

### 🔹 Análise Geral
- Quantas transações foram realizadas?
- Qual é a média de vendas e a receita total?
- Qual foi o maior e o menor valor de venda registrado?

### 🍫 Análise de Produtos
- Quais produtos geraram mais receita em cada país?
- Quais são os produtos mais vendidos em quantidade?
- Qual é o preço médio de cada produto?
- Qual produto se destacou no ano de 2022?
- Qual o ticket médio dos produtos por venda?
- Qual a contribuição de cada produto para o total de vendas?

### 🧑‍💼 Análise de Vendedores
- Quais vendedores realizaram mais vendas?
- Quais vendedores geraram mais receita?
- Quais vendedores venderam mais caixas?
- Quais vendedores tiveram desempenho acima da média?
- Qual o ticket médio por vendedor?

### 🌍 Análise Geográfica
- Quais são os 3 países com menor receita?
- Qual é o ticket médio por país?
- Quais produtos são mais populares em cada país?
- Quais países apresentam maior desempenho de vendas?

### 📈 Análise de Tendências e Sazonalidade
- Quais meses tiveram o maior e o menor volume de vendas?
- Como estão as vendas por mês?
- Como estão as vendas por trimestre?
- Quais meses costumam ter maior faturamento?
- Quais são os padrões sazonais nas vendas de chocolate?

## 📌 Etapas do Projeto

1. Tratar os dados  
2. Importar o dataset no MySQL  
3. Criar a tabela e inserir os dados  
4. Realizar consultas SQL para análise descritiva  
5. Gerar insights relevantes  

## 🔍 Principais Queries (arquivo: `queries_chocolate_sales.sql`)

- Total de vendas por mês  
- Ticket médio por vendedor  
- Representação dos produtos que geraram mais receitas  
- Comparativo de desempenho entre países  

## 📁 Estrutura dos Arquivos

- `Chocolate-Sales.csv`: dados de vendas  
- `queries_chocolate_sales.sql`: todas as queries SQL usadas no projeto  

## 📊 Exemplos de Insights

- O mês com maior receita foi **Janeiro**, representando **14.49%** do total.
- Os países com maior receita foram: **Austrália (18.39%)**, **Reino Unido (17.01%)** e **Índia (16.91%)**.
- Os vendedores com maior ticket médio por venda foram:  
  • **Madelene Upcott** – $7024.42  
  • **Ches Bonnell** – $6685.44  
  • **Oby Sorrel** – $6462.14  
- Os produtos que mais geraram receita foram:  
  • **Smooth Sliky Salty** – 5.66%  
  • **50% Dark Bites** – 5.53%  
  • **White Choc** – 5.32%

---

🔙 Voltar para o [https://github.com/Alex-Gobbo/portfolio-sql]
