-- Criando banco de Dados.
CREATE DATABASE  IF NOT EXISTS chocolate_sales; 

-- Criando tabelas.
CREATE TABLE IF NOT EXISTS SALES(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	sales_person VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    product VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    amount decimal(10, 2) NOT NULL,
    box_shipped INT NOT NULL
);



-- ----------------------------------------------------------------
-- ----------------------- ANÁLISE GERAL ---------------
-- ----------------------------------------------------------------
-- Quantas transaçôes foram feitas?
SELECT COUNT(*) FROM sales;

-- Qual é a média de vendas e a receita total?
SELECT
	SUM(amount) AS "receita_total",
	ROUND(AVG(amount), 2) AS "média_das_vendas" ,
	SUM(box_shipped) AS "caixas_vendidas",
	COUNT(*) AS "transação_total"
FROM sales;

-- Qual foi o maior e menor valor de venda registrado?
SELECT 
	MAX(amount) AS "Maior_valor",
    MIN(amount) AS "Menor_valor"
FROM sales;



-- ------------------------------------------------------------------
-- ----------------------- ANÁLISE DE PRODUTOS -----------------------
-- ------------------------------------------------------------------
-- Quais produtos geraram mais receita em cada país?
SELECT 
	country AS "País",
    product AS "Produto",
	SUM(AMOUNT) AS "Receita_total"
FROM chocolate_sales.sales 
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- Quais são os produtos mais vendidos em quantidade?
SELECT 
	product,
    SUM(box_shipped) AS "Quantidade_total"
FROM sales
GROUP BY product
ORDER BY SUM(box_shipped) DESC;

-- Qual é o preço médio de cada produto?
SELECT
	product AS "Produto",
	ROUND(AVG(amount), 2) AS "Média_das_vendas"
FROM sales
GROUP BY 1
ORDER BY 2 DESC;

-- Qual produto se destacou nesse ano de 2022?
SELECT
	product,
    SUM(amount) AS "Receita_total",
    rank() OVER(ORDER BY SUM(amount) DESC) AS "Rank"
FROM sales
GROUP BY product
LIMIT 10;

-- Ticket médio dos produtos por venda
SELECT
	product AS "Produto",
    SUM(amount) AS "Receita_total",
    SUM(box_shipped) AS "Caixas_enviadas",
    ROUND(SUM(amount)  / COUNT(*), 2) AS "Ticket_médio_por_venda",
    ROUND(SUM(amount)  / SUM(box_shipped), 2) AS "Ticket_médio_por_caixas_enviadas"
FROM sales
GROUP BY product
ORDER BY SUM(amount) DESC;

-- Qual a contribuição de cada produto para o total de vendas?
SELECT
	product AS "Produto",
    ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(),2 ) AS "Repesentação_das_vendas"
FROM sales
GROUP BY 1
ORDER BY 2 DESC;



-- ------------------------------------------------------------------
-- ----------------------- ANÁLISE DE VENDEDORES --------------------
-- ------------------------------------------------------------------
-- Quais vendedores tiveram um maior número de vendas
SELECT
	sales_person AS "Vendedor",
    COUNT(*) AS "Qiantdade_de_vendas"
FROM sales
GROUP BY sales_person
ORDER BY COUNT(*) DESC;

-- Quais vendedores geraram mais receita total?
SELECT 
	sales_person AS "Vendedor",
    SUM(amount) AS "Receita_total"
FROM sales
GROUP BY Vendedor
ORDER BY Receita_Total DESC;

-- Quais vendedores venderam mais caixas?
SELECT
	sales_person AS "Vendedor",
    SUM(box_shipped) AS "Quantidade_De_Caixas_Vendidas"
FROM sales
GROUP BY Vendedor
ORDER BY Quantidade_De_Caixas_Vendidas DESC
LIMIT 5;

-- Desempenho dos vendedores acima da média
SELECT
	sales_person AS "Vendedor",
	ROUND(AVG(amount), 2) AS "Média_da_receita_total"
FROM sales
GROUP BY sales_person
HAVING AVG(amount) > 
	(SELECT AVG(amount) FROM sales)
ORDER BY AVG(amount) DESC;

-- Qual é o Ticket Médio por vendedor?
SELECT
	sales_person AS "Vendedor",
	SUM(amount) AS "Receita_Total",
	ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(), 2) AS "Representação_das_vendas",
	SUM(box_shipped) AS "Total_De_Caixas_Vendidas",
	COUNT(*) AS "Quantidade_De_Vendas",
	ROUND(SUM(amount) / COUNT(*), 2) AS "Ticket_Médio_Por_Venda",
	ROUND(SUM(amount) / SUM(box_shipped), 2) AS "Ticket_Médio_Por_Caixa",
	ROUND(AVG(box_shipped), 2) AS "Média_De_Caixas_Por_Venda"
FROM sales
GROUP BY Vendedor
ORDER BY Receita_Total DESC;



-- ------------------------------------------------------------------
-- ----------------------- ANÁLISE GEPGRÁFICA --------------------
-- ------------------------------------------------------------------
-- Quais são os 3 países que geram menos receita?
SELECT
	country AS "País",
    SUM(amount) AS "Receita_total"
FROM sales
GROUP BY country
ORDER BY SUM(amount)
LIMIT 3;

-- Qual o ticket médio por país?
SELECT
	country AS "País",
    SUM(amount) AS "Receita",
    ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(), 2) AS "Ticket_médio_por_receita"
FROM sales
GROUP BY country
ORDER BY SUM(amount) DESC;

-- Quais produtos são mais populares em cada país?
SELECT
	country AS "País",
    product AS "Produto",
    SUM(box_shipped) AS "total_caixas_vendidas"
FROM sales
GROUP BY country
ORDER BY 3;

    -- Quais paises apresentam um maior desempenho de vendas?.
SELECT 
	country AS "País",
    SUM(amount) AS "Receita_total",
    ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(), 2) AS "Representação_das_vendas",
    RANK() OVER(ORDER BY SUM(amount) DESC) AS "Rank"
FROM sales
GROUP BY country
ORDER BY SUM(amount) DESC;

-- ------------------------------------------------------------------
-- ----------------------- ANÁLISE DE SAZONALIDADE OU TENDÊNCIAS --------------------
-- ------------------------------------------------------------------
-- Quais meses tiveram o maior e o menor volume de vendas?
SELECT
	MONTH(date) AS "Número_do_Mês",
	MONTHNAME(date) AS "Mês",
    MAX(box_shipped) AS "Maior_volume_de_caixa_vendida",
    MIN(box_shipped) AS "Menor_volume_de_caixa_vendida"
FROM sales
GROUP BY MONTHNAME(date)
ORDER BY MONTH(date) ASC
;

-- Como estão as vendas por mês?
SELECT 
	MONTHNAME(date) AS "nome_mês",
    SUM(amount) AS "receita_total",
    ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(), 2) AS "representação_das_vendas"
FROM sales
GROUP BY MONTHNAME(date)
ORDER BY MONTH(date);

-- Como estão as vendas por trimestre
SELECT
	QUARTER(date) AS "Trimestre",
    SUM(amount) AS "Receita_total"
FROM sales
GROUP BY Trimestre
ORDER BY Trimestre;

-- Quais meses costumam ter maior faturamento?
SELECT
	MONTHNAME(date) AS "Meses",
    SUM(amount) AS "Receita_total",
    CASE 
		WHEN SUM(amount) > 700000 THEN "Bom"
        ELSE "Ruim"
	END AS "Status_Das_Vendas"
FROM sales
GROUP BY MONTH(date)
ORDER BY MONTH(date);

-- Avaliar o desempenho mensal das vendas de chocolate e identificar padrões sazonais e oportunidades de melhoria.
	SELECT 
		MONTH(date) AS "Número_do_mês",
		MONTHNAME(date) AS "Nome_do_mês",
		SUM(amount) AS "Receita_total",
		ROUND(SUM(amount) * 100 / SUM(SUM(amount)) OVER(), 2) AS "Representação_das_vendas"
	FROM sales
	GROUP BY MONTHNAME(date)
	ORDER BY MONTH(date);