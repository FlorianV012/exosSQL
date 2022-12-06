/* Le total des paiements effectués de chaque client (numéro, nom et pays) américain, allemand ou français de plus de 50000$ trié par pays puis par total des paiements décroissant */


/* RESULTAT ==> 38 lignes / 146 / 130305.35 */

SELECT payments.customerNumber, contactLastName, SUM(payments.amount) AS total, country FROM `payments`
JOIN customers
ON payments.customerNumber = customers.customerNumber
WHERE country IN ("France", "USA", "Germany")
GROUP BY payments.customerNumber
HAVING SUM(payments.amount)> 50000
ORDER BY country, SUM(payments.amount) DESC;

/* Le montant total de chaque commande (numéro et date) des clients New-Yorkais (nom) trié par nom du client puis par date de commande */

SELECT ROUND(SUM(orderdetails.quantityOrdered*orderdetails.priceEach),2) as amountTotal, orders.orderNumber, orders.orderDate, customerName FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE city LIKE "NYC"
GROUP BY orders.orderNumber
ORDER BY customers.customerName, orders.orderDate;

/* RESULTAT ==> 16 lignes / Classic Legends / 10115 / 21665.98 */
