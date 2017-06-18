INSERT INTO influx.prices (SELECT prices_import."symbol" AS "symbol",
																	prices_import."date" AS "date",
																		AVG(prices_import."open") AS "open",
																		AVG(prices_import."high") AS "high",
																		AVG(prices_import."low") AS "low",
																		AVG(prices_import."close") AS "close",
																		AVG(prices_import."volume") AS "volume",
																		AVG(prices_import."adj_close") AS "adj_close"
														 FROM influx.prices_import
														 GROUP BY prices_import."symbol", prices_import."date");
