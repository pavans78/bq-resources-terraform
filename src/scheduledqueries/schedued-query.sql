INSERT `${project_id}.${dataset_id}.table-pf` (country_name, geo_id, population, longitude_centroid, latitude_centroid, alpha_3_code, last_updated) 
SELECT country_name, geo_id, population, longitude_centroid, latitude_centroid, alpha_3_code, last_updated FROM `${project_id}.${dataset_id}.table1` 
WHERE DATE(last_updated) >= "2020-05-12" LIMIT 10
