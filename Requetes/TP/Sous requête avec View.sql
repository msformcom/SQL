-- La view ResumeCA est cr��e pr�c�dement
WITH Etape1 AS (
SELECT	E.NO_EMPLOYE,
		E.NOM,
		E.Prenom,
		(SELECT SUM(CA) FROM ResumeCA
			WHERE NO_EMPLOYE=E.NO_EMPLOYE AND YEAR(DATE_COMMANDE)=2012) AS CA2012,
		(SELECT SUM(CA) FROM ResumeCA
			WHERE NO_EMPLOYE=E.NO_EMPLOYE AND YEAR(DATE_COMMANDE)=2013)  AS CA2013
FROM EMPLOYES AS E)
SELECT * FROM Etape1
WHERE CA2012 > = CA2013