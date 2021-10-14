/************************************** Our Crypto Case Study ********************************************/

/******************************* checking individual table details ***************************************/



SELECT * FROM trading.members LIMIT 5;
SELECT * FROM trading.prices LIMIT 5;
SELECT * FROM trading.transactions LIMIT 5;



/****************************** Step 2 - Exploring The Members Data *************************************/



/*Question 1 - Show only the top 5 rows from the trading.members table*/


SELECT * FROM trading.members 
LIMIT 5;


/*Question 2 - Sort all the rows in the table by first_name in alphabetical order and show the top 3 rows*/


SELECT * FROM trading.members 
ORDER BY first_name 
LIMIT 3;


/*Question 3 - Which records from trading.members are from the United States region?*/


SELECT * FROM trading.members
WHERE region = 'United States';


/*Question 4 - Select only the member_id and first_name columns for members who are not from Australia*/


SELECT member_id,first_name 
FROM trading.members
WHERE region != 'Australia';


/*Question 5 - Return the unique region values from the trading.members table and sort the output by reverse alphabetical order*/


SELECT DISTINCT(region) 
FROM trading.members
ORDER BY region DESC;


/*Question 6 - How many mentors are there from Australia or the United States?*/


SELECT COUNT(*) AS mentor_count 
FROM trading.members
WHERE region IN ('Australia','United States');


/*Question 7 - How many mentors are not from Australia or the United States?*/


SELECT COUNT(*) AS mentor_count 
FROM trading.members
WHERE region NOT IN ('Australia','United States');


/*Question 8 - How many mentors are there per region? Sort the output by regions with the most mentors to the least*/


SELECT region,COUNT(*) AS mentor_count 
FROM trading.members
GROUP BY region
ORDER BY COUNT(region) DESC;


/*Question 9 - How many US mentors and non US mentors are there? */

SELECT
	CASE
		WHEN region != 'United States' THEN 'Non-US'
		ELSE region
	END AS mentor_region,
	COUNT(*) AS mentor_count
FROM trading.members
GROUP BY mentor_region
ORDER BY mentor_count DESC;


/*Question 10 - How many mentors have a first name starting with a letter before 'E'?*/


SELECT COUNT(*) AS mentor_count 
FROM trading.members
WHERE LEFT(first_name,1) < 'E';


/************************************* Step 3 - Daily Prices ******************************************/

/* for BTC */

SELECT *FROM trading.prices WHERE ticker = 'BTC' LIMIT 5;

/* for ETH */

SELECT *FROM trading.prices WHERE ticker = 'ETH' LIMIT 5;



/* Question 1 - How many total records do we have in the trading.prices table? */


SELECT COUNT(*) AS total_record 
FROM trading.prices;


/* Question 2 - How many records are there per ticker value? */


SELECT ticker,COUNT(*) AS total
FROM trading.prices
GROUP BY ticker;


/* Question 3 - What is the minimum and maximum market_date values? */


SELECT MIN(market_date) AS min_date,MAX(market_date) AS max_date
FROM trading.prices;


/* Question 4 - Are there differences in the minimum and maximum market_date values for each ticker? */


SELECT ticker,MIN(market_date) AS min_date,MAX(market_date) AS max_date
FROM trading.prices
GROUP BY ticker;


/* Question 5 - What is the average of the price column for Bitcoin records during the year 2020? */


SELECT AVG(price) AS average_price
FROM trading.prices
WHERE market_date BETWEEN '2020-01-01' AND '2020-12-31'
AND ticker = 'BTC';



/* Question 6 - What is the monthly average of the price column for Ethereum in 2020? Sort the output in chronological order and also round the average price value to 2 decimal places */


SELECT DATE_TRUNC('MON',market_date) AS month_start,
ROUND(AVG(price)::NUMERIC,2) AS average_price
FROM trading.prices
WHERE EXTRACT(YEAR FROM market_date) = 2020
GROUP BY month_start;


/* Question 7 - Are there any duplicate market_date values for any ticker value in our table? */


SELECT ticker,COUNT(*) AS total_count,
COUNT(DISTINCT(market_date)) AS unique_count
FROM trading.prices
GROUP BY ticker;


/*Question 8 - How many days from the trading.prices table exist where the high price of Bitcoin is over $30,000? */


SELECT COUNT(*) AS row_count
FROM trading.prices 
WHERE ticker = 'BTC' AND high > 30000;


/* Question 9 - How many "breakout" days were there in 2020 where the price column is greater than the open column for each ticker? */


SELECT ticker,COUNT(*) AS breakout_days
FROM trading.prices
WHERE EXTRACT(YEAR FROM market_date) = 2020
AND price > open
GROUP BY ticker;


/*Question 10 - How many "non_breakout" days were there in 2020 where the price column is less than the open column for each ticker?*/


SELECT ticker,COUNT(*) AS non_breakout
FROM trading.prices
WHERE EXTRACT(YEAR FROM market_date) = 2020
AND price < open
GROUP BY ticker;


/*Question 11 - What percentage of days in 2020 were breakout days vs non-breakout days? Round the percentages to 2 decimal places */

SELECT ticker,
		ROUND(SUM(CASE WHEN price > open THEN 1 ELSE 0 END)/COUNT(*)::NUMERIC,2)AS breakout,
		ROUND(SUM(CASE WHEN price < open THEN 1 ELSE 0 END)/COUNT(*)::NUMERIC,2)AS non_breakout
FROM trading.prices
WHERE market_date >= '2020-01-01' AND market_date <= '2020-12-31'
GROUP BY ticker;


/******************************* Step 4 - Transactions Table ***********************************/


/*Question 1 - How many records are there in the trading.transactions table? */


SELECT COUNT(*) AS total_records
FROM trading.transactions;


/*Question 2 - How many unique transactions are there? */


SELECT DISTINCT(COUNT(*)) AS count_unique
FROM trading.transactions;


/* Question 3 - How many buy and sell transactions are there for Bitcoin? */


SELECT txn_type,COUNT(*) AS count
FROM trading.transactions
WHERE ticker = 'BTC'
GROUP BY txn_type;


/* Question 4

For each year, calculate the following buy and sell metrics for Bitcoin:
total transaction count
total quantity
average quantity per transaction
Also round the quantity columns to 2 decimal places. */


SELECT EXTRACT(YEAR FROM txn_date) AS txn_year,txn_type,
COUNT(txn_id) AS transaction_count,
ROUND(SUM(quantity)::NUMERIC,2) AS total_quantity,
ROUND(AVG(quantity)::NUMERIC,2) AS average_quantity
FROM trading.transactions
GROUP BY txn_year,txn_type
ORDER BY txn_year,txn_type;


/*Question 5 - What was the monthly total quantity purchased and sold for Ethereum in 2020? */

SELECT DATE_TRUNC('MON', txn_date)::DATE AS calendar_month,
SUM(CASE WHEN txn_type = 'BUY' THEN quantity ELSE 0 END) AS buy_quantity,
SUM(CASE WHEN txn_type = 'SELL' THEN quantity ELSE 0 END) AS sell_quantity
FROM trading.transactions
WHERE txn_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY calendar_month
ORDER BY calendar_month;


/* Question 6

Summarise all buy and sell transactions for each member_id by generating 1 row for each member with the following additional columns:
Bitcoin buy quantity
Bitcoin sell quantity
Ethereum buy quantity
Ethereum sell quantity */

SELECT member_id,
	SUM(CASE WHEN txn_type = 'BUY' AND ticker = 'BTC' THEN quantity ELSE 0 END)  AS btc_buy_quantity,
	SUM(CASE WHEN txn_type = 'SELL' AND ticker = 'BTC' THEN quantity ELSE 0 END) AS btc_sell_quantity,
	SUM(CASE WHEN txn_type = 'BUY' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS eth_buy_quantity,
	SUM(CASE WHEN txn_type = 'SELL' AND ticker = 'ETH' THEN quantity ELSE 0 END) AS eth_sell_quantity
FROM trading.transactions
GROUP BY member_id;


/* Question 7
What was the final quantity holding of Bitcoin for each member? 
Sort the output from the highest BTC holding to lowest */

SELECT member_id,
	SUM(
		CASE 
		WHEN txn_type = 'BUY' THEN quantity
		WHEN txn_type = 'SELL' THEN -quantity
		ELSE
		0
	END) AS final_btc_holding
FROM trading.transactions
WHERE ticker = 'BTC'
GROUP BY member_id
ORDER BY final_btc_holding DESC;

/* Question 8 - Which members have sold less than 500 Bitcoin? Sort the output from the most BTC sold to least */

SELECT member_id,
	SUM(quantity) AS btc_sold_quantity
FROM trading.transactions
WHERE ticker = 'BTC' AND txn_type = 'SELL'
GROUP BY member_id
HAVING SUM(quantity) < 500
ORDER BY btc_sold_quantity DESC;


/* Question 8
What is the total Bitcoin quantity for each member_id owns after adding all of the BUY and SELL transactions 
from the transactions table? Sort the output by descending total quantity */


SELECT member_id,
	SUM(
		CASE 
		WHEN txn_type = 'BUY' THEN quantity
		WHEN txn_type = 'SELL' THEN -quantity
		END
	   ) AS total_quantity
FROM trading.transactions
WHERE ticker = 'BTC'
GROUP BY member_id
ORDER BY total_quantity DESC;


/* Question 10 - Which member_id has the highest buy to sell ratio by quantity? */

SELECT member_id,
	(SUM(CASE WHEN txn_type = 'BUY' THEN quantity END)/SUM(CASE WHEN txn_type = 'SELL' THEN quantity END)) AS buy_to_sell_ratio
FROM trading.transactions
GROUP BY member_id
ORDER BY buy_to_sell_ratio DESC;


/********************************** Step 5 - Let the Data Analysis Begin! ********************************/


/* Question 1 - What is the earliest and latest date of transactions for all members? */


SELECT MIN(txn_date) AS earliest_date,
MAX(txn_date) AS latest_date 
FROM trading.transactions; 


/* Question 2 - What is the range of market_date values available in the prices data? */


SELECT MIN(market_date) AS earliest_date,
	   MAX(market_date) AS recent_date
FROM trading.prices;


/* Question 3 - Which top 3 mentors have the most Bitcoin quantity as of the 29th of August? */


SELECT members.first_name,
SUM(CASE 
	WHEN transactions.txn_type = 'BUY' THEN transactions.quantity
   	WHEN transactions.txn_type = 'SELL' THEN -transactions.quantity
   END) AS total_quantity 
FROM trading.transactions
INNER JOIN trading.members
ON trading.members.member_id = trading.transactions.member_id
WHERE ticker = 'BTC'
GROUP BY members.first_name
ORDER BY total_quantity DESC LIMIT 3;


/* Question 4
What is total value of all Ethereum portfolios for each region at the end date of our analysis? 
Order the output by descending portfolio value */


SELECT members.region,
SUM(prices.price) AS etherum_value
FROM trading.prices
INNER JOIN trading.transactions
ON trading.prices.ticker = trading.transactions.ticker
INNER JOIN trading.members
ON trading.members.member_id = trading.transactions.member_id
WHERE transactions.ticker = 'ETH'
GROUP BY members.region
ORDER BY etherum_value DESC;


SELECT *FROM trading.members;
SELECT *FROM trading.transactions;
SELECT *FROM trading.prices;














