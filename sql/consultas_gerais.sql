-- Quantidade de datas nos registros
SELECT COUNT(DISTINCT date) FROM influx.prices_import;

-- Quantidade de resgistros de preços de ações
SELECT count(*) FROM influx.prices;

-- Quantidade de dias em prices
SELECT count(DISTINCT prices.date)
FROM influx.prices, influx.sector_symbol
WHERE sector_symbol.symbol = prices.symbol and sector_symbol.sector NOTNULL;

-- Quantidade de dias de cada setor
SELECT sector_symbol.sector, count(DISTINCT prices.date) as cnt_by_d
FROM influx.prices, influx.sector_symbol
WHERE sector_symbol.symbol = prices.symbol and sector_symbol.sector NOTNULL
GROUP BY sector_symbol.sector
ORDER BY sector_symbol.sector;

-- Dias com menos de 12 setores
SELECT count(DISTINCT sector_symbol.sector), prices.date
FROM influx.prices, influx.sector_symbol
WHERE sector_symbol.symbol = prices.symbol and sector_symbol.sector NOTNULL
GROUP BY prices.date
HAVING count(DISTINCT sector_symbol.sector) < 12
ORDER BY prices.date;

-- Remover dias que não contém dados dos 12 setores
DELETE FROM influx.prices
WHERE prices.date IN (SELECT prices.date
											FROM influx.prices, influx.sector_symbol
											WHERE sector_symbol.symbol = prices.symbol and sector_symbol.sector NOTNULL
											GROUP BY prices.date
											HAVING count(DISTINCT sector_symbol.sector) < 12);

-- Simbolos em prices que não tem setores
SELECT DISTINCT prices.symbol
FROM influx.prices
WHERE prices.symbol NOT IN (SELECT DISTINCT sector_symbol.symbol
														FROM influx.sector_symbol)
ORDER BY prices.symbol;

-- Contagem de simbolos
SELECT count(*) FROM influx.sector_symbol;
SELECT count(DISTINCT symbol) FROM influx.prices;