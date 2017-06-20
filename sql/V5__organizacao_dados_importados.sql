-- Remoção simbolos não referenciados
DELETE FROM influx.prices
WHERE prices.symbol NOT IN (SELECT DISTINCT sector_symbol.symbol
														FROM influx.sector_symbol);
DELETE FROM influx.sector_symbol
WHERE sector_symbol.symbol NOT IN (SELECT DISTINCT prices.symbol
																	 FROM influx.prices);