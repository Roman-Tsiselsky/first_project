//  id_browser -> id  table browser
//  id_user -> id

//  id_browser_users.id_user = users.id 





SELECT 
    u.id as id,
    u.name as name,
    b.name as browser
FROM
    users AS u
JOIN
    (
        SELECT
            browser.name
        FROM
            browsers
        WHERE 
            id  IN(
                SELECT
                    id_browser
                FROM
                    id_browser_users
                WHERE
                id_browser_users.id_user = u.id
            )
    ) AS b
ON 





   SELECT
    p.id            AS provider_id,
    p.name          AS provider_name,
    cur.idcurr      AS currency_id,
    cur.currency    AS currency_name,
    co.idcountry    AS country_id,
    co.country      AS country_name
FROM
    ( SELECT id, name FROM provider WHERE id IN (SELECT idprov FROM provcountries WHERE idcountry = 1) ) AS p
    LEFT JOIN
    ( SELECT idprov, idcountry, country FROM provcountries pco JOIN provider_сountry co ON (co.id = pco.idcountry)) AS co
    ON (p.id = co.idprov)
    LEFT JOIN
    ( SELECT idprov, idcurr, currency FROM  provcurr pcr JOIN provider_curr cr ON (cr.id = pcr.idcurr) ) AS cur
    ON (p.id = cur.idprov) 
