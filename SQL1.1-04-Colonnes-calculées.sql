/* La liste des motos (nom, vendeur, quantité et marge) triés par marge décroissante */

SELECT productName, productVendor, quantityInStock, MSRP - buyPrice AS Margin FROM `products`
WHERE productLine="MotorCycles"
ORDER BY Margin DESC;

/* RESULTAT ==> 13 lignes / 2003 Harley-Davidson Eagle Drag Bike */



/* La liste des commandes (numéro, date de commande, date d'expédition, écart en jours entre les deux dates et statut) qui sont en cours de traitement ou qui ont été expédiées et ont un écart de plus de 10j triés par écart décroissant puis par date de commande */

SELECT orderNumber, orderDate, shippedDate, DATEDIFF(shippedDate, orderDate) AS gap, status FROM `orders`
WHERE DATEDIFF(shippedDate, orderDate) > 10 AND status IN("Shipped") OR status IN("In Process")
ORDER BY gap DESC, orderDate;

/* RESULTAT ==> 33 lignes / 10165 */



/*La liste des produits (nom et valeur du stock à la vente) des années 1960 */

SELECT productName, quantityInStock * MSRP AS stockValue FROM `products`
WHERE productName LIKE "%196_%";

/* RESULTAT ==> 16 lignes / 1969 Harley Davidson Ultimate Chopper */
