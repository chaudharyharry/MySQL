USE Manufacture;

SELECT * FROM manufacturingdata;

DESC MANUFACTURINGDATA;

SELECT DISTINCT * FROM Manufacturingdata;


/*  KPI  */

/* Total Manufacturing Qty */
SELECT concat(round(sum(`Manufactured Qty`)/1000000, 2), ' M') AS "Total Manufactured Qty"
FROM Manufacturingdata;

/* Total Rejected Qty */
SELECT concat(round(sum(`Rejected Qty`)/10000, 2), ' K') AS "Total Rejected Qty"
FROM Manufacturingdata;

/* Total Processed Qty */
SELECT concat(round(sum(`Processed Qty`)/1000000, 2), ' M') AS "Total Processed Qty"
FROM manufacturingdata;

/* Total Produced Qty */
SELECT concat(round(sum(`Produced Qty`)/1000000, 2), ' M') AS "Total Produced Qty"
FROM manufacturingdata;

/* Total Quantity */
SELECT concat(round(sum(`TotalQty`)/1000000, 2), ' M') AS "Total Quantity"
FROM manufacturingdata;

/* Wastage Qty */
SELECT concat(round(sum(`Rejected Qty`)/10000, 2), ' K') AS "Wastage Qty"
FROM Manufacturingdata;

/* Manufactured % */
SELECT concat(round(sum(`Manufactured Qty`)/sum(`TotalQty`)*100 , 2), '%') AS "Manufactured %"
FROM manufacturingdata;

/* Rejected % */
SELECT concat(round(sum(`Rejected Qty`)/sum(`TotalQty`)*100 , 2), '%') AS "Rejected %"
FROM manufacturingdata;

/* Processed % */
SELECT concat(round(sum(`Processed Qty`)/sum(`TotalQty`)*100 , 2), '%') AS "Processed %"
FROM manufacturingdata;

/* Produced % */
SELECT concat(round(sum(`Produced Qty`)/sum(`TotalQty`)*100 , 2), '%') AS "Produced %"
FROM manufacturingdata;

/* Wastage % */
SELECT concat(round(sum(`Rejected Qty`)/sum(`Processed Qty`)*100 , 2), '%') AS "Wastage %"
FROM manufacturingdata;



/* Department-Wise Manufactured Vs Rejected */
SELECT `Department Name`,
       concat(round(sum(`Manufactured Qty`)/1000000, 2), ' M') AS "Total Manufactured Qty",
       concat(round(sum(`Rejected Qty`)/10000, 2), ' K') AS "Total Rejected Qty"
FROM manufacturingdata
GROUP BY `Department Name`;



/* EMP-Wise Rejected Qty */
SELECT `Emp Name`,concat(round(sum(`Rejected Qty`)/1000, 2), ' K') AS "Total Rejected Qty"
FROM manufacturingdata
GROUP BY `Emp Name`
ORDER BY "Total Rejected Qty" DESC;



/* Machine-Wise Rejected Qty */
SELECT `Machine Name`, concat(round(sum(`Rejected Qty`)/1000, 2), ' K') AS "Total Rejected Qty"
FROM manufacturingdata
GROUP BY `Machine Name`
ORDER BY "Total Rejected Qty" DESC;



/* Top 10 Machine wise Manufactured quantity */
SELECT `Machine Name`, concat(round(sum(`Manufactured Qty`)/1000000, 2), ' M') AS Manufactured_qty 
FROM manufacturingdata
GROUP BY `Machine Name`
ORDER BY Manufactured_qty DESC
LIMIT 10;



/*Top 10 Emp wise Rejected Qty*/
SELECT `Emp Name`,sum(`Rejected Qty`) AS "Total Rejected Qty"
FROM manufacturingdata
GROUP BY `Emp Name`
ORDER BY "Total Rejected Qty" DESC
LIMIT 10;



/* Top 5 Buyer */
SELECT Buyer as Buyers, 
       count(`WO Number`) AS Total_Orders,
       concat(round(sum(TotalValue)/1000000, 2), ' M') AS Total_amt
FROM manufacturingdata
GROUP BY Buyer
ORDER BY TOtal_Orders DESC
LIMIT 5;



/* Delivery period */
SELECT `Delivery Period`, 
       `Department Name`, 
       count(`WO Number`) AS total_Orders
FROM manufacturingdata
GROUP BY `Delivery Period`,`Department Name`;



/* Top 5 machine cost per operation */
SELECT `Operation Name`, 
	   concat(round(sum(`Per day Machine Cost made`)/1000000, 2), ' M') AS Machine_cost
FROM manufacturingdata
GROUP BY `Operation Name`
ORDER BY Machine_cost DESC
LIMIT 5;