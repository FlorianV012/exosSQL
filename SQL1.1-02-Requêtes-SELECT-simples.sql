/* La liste des bureaux (adresse et ville) triés par pays décroissant puis par état */

SELECT addressLine1, city FROM offices ORDER BY Country DESC, state;

/* RESULTAT ==> 7 lignes / 100 Market Street */
