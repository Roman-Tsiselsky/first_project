//  id_browser -> id  table browser
//  id_user -> id

//  id_browser_users.id_user = users.id 





SELECT 
    u.us_id as id,
    u.us_name as user,
    br.brow_name as browser
FROM
    (
        SELECT
          us_id, us_name
          FROM users WHERE us_id IN (
            SELECT user_id FROM id_browser_user WHERE browser_id = 1
          )) AS u
          LEFT JOIN 
          (SELECT user_id, browser_id, brow_name FROM id_browser_user AS ubr
          JOIN browsers AS br
          ON (u.us_id = ubr.user_id)) AS br
          ON (u.us_id = br.id_brow);




   SELECT
    p.id            AS provider_id,
    p.name          AS provider_name,
    co.idcountry    AS country_id,
    co.country      AS country_name
FROM
    ( SELECT id, name FROM provider WHERE id IN 
    (SELECT idprov FROM provcountries WHERE idcountry = 1) )
     AS p
    LEFT JOIN
    ( SELECT idprov, idcountry, country FROM provcountries pco 
    JOIN provider_сountry co 
    ON (co.id = pco.idcountry)) AS co
    ON (p.id = co.idprov)








CREATE TABLE "provider"  ( 
"id"    int NOT NULL,
"name"  varchar(25) NOT NULL 
);
CREATE TABLE "provcountries"  ( 
    "idprov"    int NOT NULL,
    "idcountry" int NOT NULL 
    );
CREATE TABLE "provider_сountry"  ( 
    "id"        int NULL,
    "country"   varchar(25) NULL 
    );





  SELECT
    p.id            AS provider_id,
    p.name          AS provider_name,
    cur.idcurr      AS currency_id,
    cur.currency    AS currency_name,
    co.idcountry    AS country_id,
    co.country      AS country_name
FROM
    ( SELECT id, name FROM provider WHERE id IN 
    (SELECT idprov FROM provcountries WHERE idcountry = 1) ) AS p
    LEFT JOIN
    ( SELECT idprov, idcountry, country FROM provcountries pco 
    JOIN provider_сountry co 
    ON (co.id = pco.idcountry)) AS co
    ON (p.id = co.idprov)
    LEFT JOIN
    ( SELECT idprov, idcurr, currency FROM  provcurr pcr 
    JOIN provider_curr cr
     ON (cr.id = pcr.idcurr) ) AS cur
    ON (p.id = cur.idprov) 









select us_name, brow_name from users as u join id_browser_user as i
test_db-# on u.us_id=i.user_id
test_db-# join browsers as b
test_db-# on i.browser_id=b.brow_id;





 SELECT
    u.us_id as id,
    u.us_name as user,
    br.brow_id as id,
    br.brow_name as browser
FROM
    (
        SELECT
          us_id, us_name
          FROM users WHERE us_id IN (
            SELECT user_id FROM id_browser_user WHERE browser_id = 1
          )) AS u
          LEFT JOIN
          (SELECT user_id, browser_id, brow_name FROM id_browser_user ubr
          JOIN browsers  br
          ON (br.brow_id = ubr.browser_id)) AS br
          ON (u.us_id = br.id_brow);