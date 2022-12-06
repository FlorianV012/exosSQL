/* La liste des employés (nom, prénom et fonction) et des bureaux (adresse et ville) dans lequel ils travaillent */

SELECT firstName, lastName, addressLine1, city FROM `employees`
JOIN offices
ON employees.officeCode = offices.officeCode;

/* RESULTAT ==> 23 lignes / Diane Murphy */



/* La liste des clients français ou américains (nom du client, nom, prénom du contact et pays) et de leur commercial dédié (nom et prénom) triés par nom et prénom du contact */

SELECT customerName, contactFirstName, contactLastName, country, lastName , firstName FROM `customers`
JOIN employees
ON customers.salesRepEmployeeNumber =  employees.employeeNumber
WHERE country IN("France", "USA")
ORDER BY contactLastName, contactFirstName;

/* RESULTAT ==> 48 lignes / Miguel Barajas */



/* La liste des lignes de commande (numéro de commande, code, nom et ligne de produit) et la remise appliquée aux voitures ou motos commandées triées par numéro de commande puis par remise décroissante */

SELECT orderNumber, orderdetails.productCode, products.productName, productline, MSRP - priceEach AS discount FROM `orderdetails` JOIN products ON products.productCode = orderdetails.productCode WHERE productline LIKE "Motorcycles" OR productline LIKE "%Car%" ORDER BY orderNumber, `discount` DESC;

/* RESULTAT ==> 2026 lignes / 34 */
