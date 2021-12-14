DROP TABLE IF EXISTS Income;
CREATE TABLE Income (
	State_Name VARCHAR(40) NOT NULL,
	City VARCHAR(40) NOT NULL,
	Zip_Code INT NOT NULL,
	Lat DEC NOT NULL,
	Long DEC NOT NULL,
	Mean DEC NOT NULL,
	Median DEC NOT NULL, 
	Stdev DEC NOT NULL
);



DROP TABLE IF EXISTS US_representation;
CREATE TABLE US_representation (
	rep VARCHAR (100) NOT NULL,
	party VARCHAR (50) NOT NULL,
	zip INT NOT NULL
);

select * from US_representation;

ALTER TABLE Income
ADD PRIMARY KEY (Zip_Code);

ALTER TABLE US_representation
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT Income.state_name, AVG(Income.Mean), AVG(Income.Median), Income.City, US_representation.rep, US_representation.party
FROM Income
INNER JOIN US_representation
ON Income.zip_code = US_representation.zip
GROUP BY Income.state_name, Income.City, US_representation.rep, US_representation.party
ORDER BY Income.city;

SELECT AVG(Income.Mean), COUNT(US_representation.rep), US_representation.party, income.state_name
FROM Income
INNER JOIN US_representation
ON Income.zip_code = US_representation.zip
GROUP BY income.state_name, US_representation.party;


SELECT DISTINCT Income.State_name, AVG(Income.Mean), COUNT(US_representation.rep), US_representation.party
FROM Income
INNER JOIN US_representation
ON Income.zip_code = US_representation.zip
GROUP BY income.state_name, US_representation.party
ORDER BY income.state_name ASC, COUNT(US_representation.rep) DESC;


INNER JOIN US_representation
ON Income.zip_code = US_representation.zip
