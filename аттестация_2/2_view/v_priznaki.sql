DROP VIEW IF EXISTS v_priznaki_prosrochki;
CREATE VIEW v_priznaki_prosrochki AS
SELECT
	v.vydacha_id,
	v.chitatel_id,
	c.fio,
	c.vozrast,
	c.lyubimyy_zhanr,
	c.lyubimaya_tema,
	k.kniga_id,
	k.nazvanie,
	k.avtor,
	k.zhanr,
	k.tema,
	v.data_vydachi,
	v.srok_sdachi,
	v.data_vozvrata,
	v.otsenka,
	(v.srok_sdachi - v.data_vydachi) AS srok_dney,
	CASE
		WHEN v.data_vozvrata IS NOT NULL AND v.data_vozvrata > v.srok_sdachi THEN 1
		WHEN v.data_vozvrata IS NULL AND v.srok_sdachi < CURRENT_DATE THEN 1
		ELSE 0
	END AS prosrochka,
	CASE
		WHEN v.data_vozvrata IS NULL THEN 1
		ELSE 0
	END AS na_rukah,
	CASE
		WHEN k.zhanr = c.lyubimyy_zhanr THEN 1
		ELSE 0
	END AS zhanr_sovpal,
	CASE
		WHEN k.tema = c.lyubimaya_tema THEN 1
		ELSE 0
	END AS tema_sovpala,
	COUNT(v.vydacha_id) OVER (PARTITION BY k.kniga_id) AS skok_brali,
	AVG(v.otsenka) OVER (PARTITION BY k.kniga_id) AS sred_ocenka_knigi
FROM vydacha AS v
JOIN chitatel AS c ON c.chitatel_id = v.chitatel_id
JOIN kniga AS k ON k.kniga_id = v.kniga_id;
