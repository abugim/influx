-- Gerar VAs
COPY (SELECT sector_symbol.sector, prices.date, sum(prices.close - prices.open) as sum_delta
			FROM influx.prices, influx.sector_symbol
			WHERE sector_symbol.symbol = prices.symbol and sector_symbol.sector NOTNULL
			GROUP BY  sector_symbol.sector, prices.date
			ORDER BY prices.date)
TO '/home/ryuga/git/influx/sector_variation.csv' WITH CSV DELIMITER ',';