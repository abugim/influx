create table influx.prices_import
(
	symbol varchar(100),
	date date,
	open double precision,
	high double precision,
	low double precision,
	close double precision,
	volume integer,
	adj_close double precision
)
;

create table influx.prices
(
	symbol varchar(100),
	date date,
	open double precision,
	high double precision,
	low double precision,
	close double precision,
	volume integer,
	adj_close double precision,
	constraint uk_symbol_date
		unique (symbol, date)
)
;

create table influx.sector_symbol
(
	sector varchar(100),
	symbol varchar(100),
	constraint uk_sector_symbol
		unique (sector, symbol)
)
;
