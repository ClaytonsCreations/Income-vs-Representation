DROP TABLE IF EXISTS Income;
CREATE TABLE Income (
	id INT,
	State_name VARCHAR(40) NOT NULL,
	City VARCHAR(40) NOT NULL,
	Zip_code INT NOT NULL,
	Lat DEC NOT NULL,
	Long DEC NOT NULL,
	Mean DEC NOT NULL,
	Median DEC NOT NULL, 
	Stdev DEC NOT NULL
	);
select * from Income;

CREATE TABLE US_representation (
	id INT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	party VARCHAR (50) NOT NULL,
	zip INT NOT NULL
	);

select * from US_representation;

SELECT Income.State_name, Income.id, Income.Mean, Income.Median, Income.City, Income.Zip_code, Income.Lat, Income.Long, Income.stdev
FROM Income
INNER JOIN US_representation
ON Income.zip_code = US_representation.zip
ORDER BY Income.Mean ASC;

