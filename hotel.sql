-- cas hotel--
--1--
SELECT  hot_nom, hot_ville 
from hotel 
--2--
select  cli_nom, cli_prenom, cli_adresse 
from client 
WHERE  cli_nom ='white'
--3--
select sta_nom
from station 
where sta_altitude between 1000 and 10000;
--4--
select cha_numero
from chambre 
where cha_capacite between 1 and 10;
--5--
select cli_nom, cli_prenom, cli_ville
from client
where cli_ville <> 'Londres';
--6--
select hot_nom, hot_categorie, hot_adresse, hot_ville
from hotel
where hot_ville='Bretou'
and hot_categorie between 3 and 10;
--7--
select distinct hot_sta_id, hot_nom, hot_categorie, hot_ville
from hotel, station;
--8--
select distinct hot_nom, hot_categorie, hot_ville, cha_numero
from hotel, chambre;
--9--
select distinct *
from hotel, chambre
where hot_ville='Bretou'
and cha_capacite between 2 and 10;
--10--
select distinct cli_nom, cli_prenom, hot_nom, res_date_debut,res_date_fin
from client, hotel, reservation;
--11--
select distinct sta_nom, hot_nom, cha_numero, cha_capacite
from chambre, hotel, station
--12--
select cli_nom, res_date_debut,
datediff (res_date_debut, res_date_fin), hot_nom
from client 
join reservation on res_cli_id=cli_id 
join chambre on cha_id=res_cha_id
join hotel on hot_id=cha_hot_id;
--13--
select sta_nom, count(*)
from hotel h
join station s on sta_id=hot_sta_id 
group by hot_sta_id
--14--
SELECT sta_nom, COUNT(cha_numero)
from chambre c 
join hotel h on hot_id=cha_hot_id
join station s on sta_id=hot_sta_id
GROUP by sta_id
--15--
SELECT sta_nom, COUNT(cha_numero)
from chambre c 
join hotel h on hot_id=cha_hot_id
join station s on sta_id=hot_sta_id
WHERE cha_capacite >1
GROUP by sta_id
--16--
SELECT hot_nom
from client c
join reservation r on res_cli_id=cli_id
join chambre c2 on cha_id=res_cha_id
join hotel h on hot_id=cha_hot_id
where cli_nom = 'Squire'
---17--
SELECT sta_id, AVG(DATEDIFF(res_date_debut, res_date_fin))
from reservation r 
join chambre c on  cha_id=res_cha_id
join hotel h on hot_id=cha_hot_id
join station s on sta_id=hot_sta_id
group by sta_id