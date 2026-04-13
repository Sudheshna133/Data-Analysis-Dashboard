create database Wind_turbine;
use Wind_turbine;

show tables;

CREATE TABLE Wind_turbine (
    date text,
    Wind_speed DOUBLE null,
    Power DOUBLE null,
    Nacelle_ambient_temperature DOUBLE null,
    Generator_bearing_temperature DOUBLE null,
    Gear_oil_temperature DOUBLE null,
    Ambient_temperature DOUBLE null,
    Rotor_Speed DOUBLE null,
    Nacelle_temperature DOUBLE null,
    Bearing_temperature DOUBLE null,
    Generator_speed DOUBLE null,
    Yaw_angle DOUBLE null,
    Wind_direction DOUBLE null,
    Wheel_hub_temperature DOUBLE null,
    Gear_box_inlet_temperature DOUBLE null,
    Failure_status TEXT null
);

describe wind_turbine;
drop table wind_turbine;

show variables like 'secure_file_priv';
show variables like '%local%';
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8/Uploads/Wind_turbine.csv"
INTO TABLE wind_turbine
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(date, @Wind_speed, @Power, @Nacelle_ambient_temperature, Generator_bearing_temperature, Gear_oil_temperature,
 Ambient_temperature, Rotor_Speed, @Nacelle_temperature, Bearing_temperature, @Generator_speed, @Yaw_angle, 
 Wind_direction, Wheel_hub_temperature, @Gear_box_inlet_temperature, Failure_status)
SET Wind_speed = NULLIF(@Wind_speed, ''),
Power = NULLIF(@Power, ''),
Nacelle_ambient_temperature = NULLIF(@Nacelle_ambient_temperature, ''),
Nacelle_temperature = NULLIF(@Nacelle_temperature, ''),
Generator_speed = NULLIF(@Generator_speed, ''),
Yaw_angle = NULLIF(@Yaw_angle, ''),
Gear_box_inlet_temperature = NULLIF(@Gear_box_inlet_temperature, '');

select * from wind_turbine;
select count(*) from wind_turbine;

######Before Processing######
#####UNIVARIANT ANALYSIS
#####1ST BUSINESS MOMENT DECISION
###MEAN
SELECT 'Wind_speed' AS parameter, AVG(Wind_speed) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Power' AS parameter, AVG(Power) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, AVG(Nacelle_ambient_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, AVG(Generator_bearing_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, AVG(Gear_oil_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter, AVG(Ambient_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter, AVG(Rotor_Speed) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, AVG(Nacelle_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter, AVG(Bearing_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Generator_speed' AS parameter, AVG(Generator_speed) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter, AVG(Yaw_angle) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Wind_direction' AS parameter, AVG(Wind_direction) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, AVG(Wheel_hub_temperature) AS average_value FROM Wind_Turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, AVG(Gear_box_inlet_temperature) AS average_value FROM Wind_Turbine;

###MEDIAN
SELECT 'Wind_speed' AS parameter, Wind_speed AS median
FROM (
    SELECT Wind_speed, ROW_NUMBER() OVER (ORDER BY Wind_speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_wind_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Power' AS parameter, Power AS median
FROM (
    SELECT Power, ROW_NUMBER() OVER (ORDER BY Power) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_power
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Nacelle_ambient_temperature' AS parameter, Nacelle_ambient_temperature AS median
FROM (
    SELECT Nacelle_ambient_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_ambient_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_nacelle_ambient_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Generator_bearing_temperature' AS parameter, Generator_bearing_temperature AS median
FROM (
    SELECT Generator_bearing_temperature, ROW_NUMBER() OVER (ORDER BY Generator_bearing_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_generator_bearing_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Gear_oil_temperature' AS parameter, Gear_oil_temperature AS median
FROM (
    SELECT Gear_oil_temperature, ROW_NUMBER() OVER (ORDER BY Gear_oil_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_gear_oil_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Ambient_temperature' AS parameter, Ambient_temperature AS median
FROM (
    SELECT Ambient_temperature, ROW_NUMBER() OVER (ORDER BY Ambient_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_ambient_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Rotor_Speed' AS parameter, Rotor_Speed AS median
FROM (
    SELECT Rotor_Speed, ROW_NUMBER() OVER (ORDER BY Rotor_Speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_rotor_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, Nacelle_temperature AS median
FROM (
    SELECT Nacelle_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_nacelle_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Bearing_temperature' AS parameter, Bearing_temperature AS median
FROM (
    SELECT Bearing_temperature, ROW_NUMBER() OVER (ORDER BY Bearing_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_bearing_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Generator_speed' AS parameter, Generator_speed AS median
FROM (
    SELECT Generator_speed, ROW_NUMBER() OVER (ORDER BY Generator_speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_generator_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Yaw_angle' AS parameter, Yaw_angle AS median
FROM (
    SELECT Yaw_angle, ROW_NUMBER() OVER (ORDER BY Yaw_angle) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_yaw_angle
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Wind_direction' AS parameter, Wind_direction AS median
FROM (
    SELECT Wind_direction, ROW_NUMBER() OVER (ORDER BY Wind_direction) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_wind_direction
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Wheel_hub_temperature' AS parameter, Wheel_hub_temperature AS median
FROM (
    SELECT Wheel_hub_temperature, ROW_NUMBER() OVER (ORDER BY Wheel_hub_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_wheel_hub_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Gear_box_inlet_temperature' AS parameter, Gear_box_inlet_temperature AS median
FROM (
    SELECT Gear_box_inlet_temperature, ROW_NUMBER() OVER (ORDER BY Gear_box_inlet_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM Wind_turbine
) AS median_gear_box_inlet_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

###MODE
(SELECT 'Wind_speed' AS parameter, Wind_speed AS mode, COUNT(Wind_speed) AS frequency
FROM Wind_turbine
GROUP BY Wind_speed
ORDER BY frequency DESC
LIMIT 1)
UNION
(SELECT 'Power' AS parameter, Power AS mode, COUNT(Power) AS frequency
FROM Wind_turbine
GROUP BY Power
ORDER BY frequency DESC
LIMIT 1)
UNION 
(SELECT 'Nacelle_ambient_temperature' AS parameter, Nacelle_ambient_temperature AS mode, COUNT(Nacelle_ambient_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Nacelle_ambient_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION 
(SELECT 'Generator_bearing_temperature' AS parameter, Generator_bearing_temperature AS mode, COUNT(Generator_bearing_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Generator_bearing_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Gear_oil_temperature' AS parameter, Gear_oil_temperature AS mode, COUNT(Gear_oil_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Gear_oil_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Ambient_temperature' AS parameter, Ambient_temperature AS mode, COUNT(Ambient_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Ambient_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Rotor_Speed' AS parameter, Rotor_Speed AS mode, COUNT(Rotor_Speed) AS frequency 
FROM Wind_turbine 
GROUP BY Rotor_Speed 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Nacelle_temperature' AS columns, Nacelle_temperature AS mode, COUNT(Nacelle_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Nacelle_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Bearing_temperature' AS parameter, Bearing_temperature AS mode, COUNT(Bearing_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Bearing_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Generator_speed' AS parameter, Generator_speed AS mode, COUNT(Generator_speed) AS frequency 
FROM Wind_turbine 
GROUP BY Generator_speed 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Yaw_angle' AS parameter, Yaw_angle AS mode, COUNT(Yaw_angle) AS frequency 
FROM Wind_turbine 
GROUP BY Yaw_angle 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Wind_direction' AS parameter, Wind_direction AS mode, COUNT(Wind_direction) AS frequency 
FROM Wind_turbine 
GROUP BY Wind_direction 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Wheel_hub_temperature' AS parameter, Wheel_hub_temperature AS mode, COUNT(Wheel_hub_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Wheel_hub_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Gear_box_inlet_temperature' AS parameter, Gear_box_inlet_temperature AS mode, COUNT(Gear_box_inlet_temperature) AS frequency 
FROM Wind_turbine 
GROUP BY Gear_box_inlet_temperature 
ORDER BY frequency DESC 
LIMIT 1
);

#####2ND BUSINESS MOMENT DECISION
###VARIANCE
SELECT 'Wind_speed' AS parameter, VARIANCE(Wind_speed) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Power' AS parameter, VARIANCE(Power) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, VARIANCE(Nacelle_ambient_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, VARIANCE(Generator_bearing_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, VARIANCE(Gear_oil_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter, VARIANCE(Ambient_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter, VARIANCE(Rotor_Speed) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, VARIANCE(Nacelle_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter, VARIANCE(Bearing_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Generator_speed' AS parameter, VARIANCE(Generator_speed) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter, VARIANCE(Yaw_angle) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Wind_direction' AS parameter, VARIANCE(Wind_direction) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, VARIANCE(Wheel_hub_temperature) AS variance_value
FROM Wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, VARIANCE(Gear_box_inlet_temperature) AS variance_value
FROM Wind_turbine;

###STANDARD DEVIATION
SELECT 'Wind_speed' AS parameter, STDDEV(Wind_speed) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Power' AS parameter, STDDEV(Power) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, STDDEV(Nacelle_ambient_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, STDDEV(Generator_bearing_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, STDDEV(Gear_oil_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter, STDDEV(Ambient_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter, STDDEV(Rotor_Speed) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, STDDEV(Nacelle_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter, STDDEV(Bearing_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Generator_speed' AS parameter, STDDEV(Generator_speed) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter, STDDEV(Yaw_angle) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Wind_direction' AS parameter, STDDEV(Wind_direction) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, STDDEV(Wheel_hub_temperature) AS standard_deviation
FROM Wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, STDDEV(Gear_box_inlet_temperature) AS standard_deviation
FROM Wind_turbine;

###RANGE
SELECT 
    parameter,
    MAX(CASE WHEN attribute = 'max_value' THEN value END) AS max_value,
    MAX(CASE WHEN attribute = 'min_value' THEN value END) AS min_value,
    MAX(CASE WHEN attribute = 'range_value' THEN value END) AS range_value
FROM (
    SELECT 'Wind_speed' AS parameter, 'max_value' AS attribute, MAX(Wind_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wind_speed' AS parameter, 'min_value' AS attribute, MIN(Wind_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wind_speed' AS parameter, 'range_value' AS attribute, MAX(Wind_speed) - MIN(Wind_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Power' AS parameter, 'max_value' AS attribute, MAX(Power) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Power' AS parameter, 'min_value' AS attribute, MIN(Power) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Power' AS parameter, 'range_value' AS attribute, MAX(Power) - MIN(Power) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'max_value' AS attribute, MAX(Nacelle_ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'min_value' AS attribute, MIN(Nacelle_ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'range_value' AS attribute, MAX(Nacelle_ambient_temperature) - MIN(Nacelle_ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'max_value' AS attribute, MAX(Generator_bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'min_value' AS attribute, MIN(Generator_bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'range_value' AS attribute, MAX(Generator_bearing_temperature) - MIN(Generator_bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'max_value' AS attribute, MAX(Gear_oil_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'min_value' AS attribute, MIN(Gear_oil_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'range_value' AS attribute, MAX(Gear_oil_temperature) - MIN(Gear_oil_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'max_value' AS attribute, MAX(Ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'min_value' AS attribute, MIN(Ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'range_value' AS attribute, MAX(Ambient_temperature) - MIN(Ambient_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'max_value' AS attribute, MAX(Rotor_Speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'min_value' AS attribute, MIN(Rotor_Speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'range_value' AS attribute, MAX(Rotor_Speed) - MIN(Rotor_Speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'max_value' AS attribute, MAX(Nacelle_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'min_value' AS attribute, MIN(Nacelle_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'range_value' AS attribute, MAX(Nacelle_temperature) - MIN(Nacelle_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'max_value' AS attribute, MAX(Bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'min_value' AS attribute, MIN(Bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'range_value' AS attribute, MAX(Bearing_temperature) - MIN(Bearing_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'max_value' AS attribute, MAX(Generator_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'min_value' AS attribute, MIN(Generator_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'range_value' AS attribute, MAX(Generator_speed) - MIN(Generator_speed) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'max_value' AS attribute, MAX(Yaw_angle) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'min_value' AS attribute, MIN(Yaw_angle) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'range_value' AS attribute, MAX(Yaw_angle) - MIN(Yaw_angle) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'max_value' AS attribute, MAX(Wind_direction) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'min_value' AS attribute, MIN(Wind_direction) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'range_value' AS attribute, MAX(Wind_direction) - MIN(Wind_direction) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'max_value' AS attribute, MAX(Wheel_hub_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'min_value' AS attribute, MIN(Wheel_hub_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'range_value' AS attribute, MAX(Wheel_hub_temperature) - MIN(Wheel_hub_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'max_value' AS attribute, MAX(Gear_box_inlet_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'min_value' AS attribute, MIN(Gear_box_inlet_temperature) AS value FROM Wind_turbine
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'range_value' AS attribute, MAX(Gear_box_inlet_temperature) - MIN(Gear_box_inlet_temperature) AS value FROM Wind_turbine
) AS subquery
GROUP BY parameter;

#####THIRD BUSINESS MOMENT DECISION
###SKEWNESS
SELECT 'Wind_speed' AS parameter,
    (SUM(POWER(Wind_speed - (SELECT AVG(Wind_speed) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_speed) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Power' AS parameter,
    (SUM(POWER(Power - (SELECT AVG(Power) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Power) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter,
    (SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter,
    (SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter,
    (SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter,
    (SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter,
    (SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter,
    (SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter,
    (SUM(POWER(Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Bearing_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Generator_speed' AS parameter,
    (SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter,
    (SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Wind_direction' AS parameter,
    (SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    (SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    (SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 3))) AS skewness_value
FROM wind_turbine;

#####4TH BUSINESS MOMENT DECISION
###KURTOSIS
SELECT 'Wind_speed' AS parameter, 
    ((SUM(POWER(Wind_speed - (SELECT AVG(Wind_speed) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_speed) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Power' AS parameter, 
    ((SUM(POWER(Power - (SELECT AVG(Power) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Power) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, 
    ((SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, 
    ((SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, 
    ((SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter, 
    ((SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter, 
    ((SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, 
    ((SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter, 
    ((SUM(POWER(Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Bearing_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Generator_speed' AS parameter, 
    ((SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter, 
    ((SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Wind_direction' AS parameter,
    ((SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    ((SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    ((SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 4))) - 3) AS kurtosis_value
FROM wind_turbine;

######BIVARIANT ANALYSIS 
###CORRELATION COEFFICIENT
-- Calculate correlation coefficient between Wind_speed and Power
SELECT
  (COUNT(*) * SUM(Wind_speed * Power) - SUM(Wind_speed) * SUM(Power)) /
  SQRT((COUNT(*) * SUM(Wind_speed * Wind_speed) - POW(SUM(Wind_speed), 2)) *
       (COUNT(*) * SUM(Power * Power) - POW(SUM(Power), 2))) AS correlation_coefficient
FROM
  Wind_turbine;
-- Calculate correlation coefficient between Wind_speed and Nacelle_ambient_temperature
select (count(*) * sum(Wind_speed * Nacelle_ambient_temperature) - sum(Wind_speed) * sum(Nacelle_ambient_temperature)) /
        sqrt((count(*) * sum(Wind_speed * Wind_speed) - pow(sum(Wind_speed),2)) *
            (count(*) * sum(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - pow(sum(Nacelle_ambient_temperature),2))) as correlation_coefficient
from wind_turbine;
-- Calculate correlation coefficient between  Nacelle_ambient_temperature and Generator_bearing_temperature
select (count(*) * sum(Nacelle_ambient_temperature * Generator_bearing_temperature) - sum(Nacelle_ambient_temperature) * sum(Generator_bearing_temperature)) /
        sqrt((count(*) * sum(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - pow(sum(Nacelle_ambient_temperature),2)) *
            (count(*) * sum(Generator_bearing_temperature * Generator_bearing_temperature) - pow(sum(Generator_bearing_temperature),2))) as correlation_coefficient
from wind_turbine;
-- Calculate correlation coefficient between Nacelle_ambient_temperature and Power
SELECT
  (COUNT(*) * SUM(Nacelle_ambient_temperature * Power) - SUM(Nacelle_ambient_temperature) * SUM(Power)) /
  SQRT((COUNT(*) * SUM(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - POW(SUM(Nacelle_ambient_temperature), 2)) *
       (COUNT(*) * SUM(Power * Power) - POW(SUM(Power), 2))) AS correlation_coefficient
FROM
  Wind_turbine;
-- Calculate correlation coefficient between Wind_direction and Wind_speed
SELECT
  (COUNT(*) * SUM(Wind_direction * Failure_status) - SUM(Wind_direction) * SUM(Wind_speed)) /
  SQRT((COUNT(*) * SUM(Wind_direction * Wind_direction) - POW(SUM(Wind_direction), 2)) *
       (COUNT(*) * SUM(Wind_speed *Wind_speed) - POW(SUM(Wind_speed), 2))) AS correlation_coefficient
FROM
  Wind_turbine;
#-- Calculate correlation coefficient between Generator_bearing_temperature and Gear_oil_temperature
SELECT
  (COUNT(*) * SUM(Generator_bearing_temperature  * Gear_oil_temperature) - SUM(Generator_bearing_temperature) * SUM(Gear_oil_temperature)) /
  SQRT((COUNT(*) * SUM(Generator_bearing_temperature * Generator_bearing_temperature) - POW(SUM(Generator_bearing_temperature), 2)) *
       (COUNT(*) * SUM(Gear_oil_temperature *Gear_oil_temperature) - POW(SUM(Gear_oil_temperature), 2))) AS correlation_coefficient
FROM
  Wind_turbine;
 #-- Calculate correlation coefficient between  Gear_oil_temperature and Rotor_speed
select (count(*) * sum(Gear_oil_temperature * Rotor_Speed) - sum(Gear_oil_temperature) * sum(Rotor_Speed)) /
        sqrt((count(*) * sum(Gear_oil_temperature * Gear_oil_temperature) - pow(sum(Gear_oil_temperature),2)) *
            (count(*) * sum(Rotor_Speed * Rotor_Speed) - pow(sum(Rotor_Speed),2))) as correlation_coefficient
from wind_turbine;
  
###COVARIANCE 
#-- Calculate covariance between Wind_speed and Power
SELECT 
  AVG((Wind_speed - avg_Wind_speed) * (Power - avg_Power)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Wind_speed) AS avg_Wind_speed, AVG(Power) AS avg_Power
  FROM Wind_turbine) AS subquery;
-- Calculate  covariance between Wind_speed and Nacelle_ambient_temperature
SELECT 
  AVG((Wind_speed - avg_Wind_speed) * (Nacelle_ambient_temperature - avg_Nacelle_ambient_temperature)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Wind_speed) AS avg_Wind_speed, AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature
  FROM Wind_turbine) AS subquery;
-- Calculate  covariance between  Nacelle_ambient_temperature and Generator_bearing_temperature
SELECT 
  AVG(( Nacelle_ambient_temperature- avg_Nacelle_ambient_temperature) * (Generator_bearing_temperature- avg_Generator_bearing_temperature)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature, AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature
  FROM Wind_turbine) AS subquery;
#-- Calculate covariance between Nacelle_ambient_temperature and Power
SELECT
  AVG((Nacelle_ambient_temperature - avg_Nacelle_ambient_temperature) * (Power - avg_Power)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature, AVG(Power) AS avg_Power
  FROM Wind_turbine) AS subquery;
  
#-- Calculate covariance between  Wind_direction and Wind_speed
SELECT
  AVG((Wind_direction - avg_Wind_direction) * ( Wind_speed - avg_Wind_speed)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Wind_direction) AS avg_Wind_direction, AVG( Wind_speed) AS avg_Wind_speed
  FROM Wind_turbine) AS subquery;

#-- Calculate covariance between Generator_bearing_temperature and Gear_oil_temperature
SELECT
  AVG((Generator_bearing_temperature - avg_Generator_bearing_temperature) * (Gear_oil_temperature - avg_Gear_oil_temperature)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature, AVG(Gear_oil_temperature) AS avg_Gear_oil_temperature
  FROM Wind_turbine) AS subquery;
  
#-- Calculate covariance between Generator_bearing_temperature and Rotor_speed
SELECT
  AVG((Generator_bearing_temperature - avg_Generator_bearing_temperature) * (Rotor_speed - avg_Rotor_speed)) AS covariance
FROM
  Wind_turbine,
  (SELECT AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature, AVG(Rotor_speed) AS avg_Rotor_speed
  FROM Wind_turbine) AS subquery;
  
#####NULL VALUES COUNT
SELECT 'total_rows' AS parameter, COUNT(*) AS null_count FROM Wind_turbine
UNION ALL
SELECT 'Wind_speed', SUM(CASE WHEN Wind_speed IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Power', SUM(CASE WHEN Power IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature', SUM(CASE WHEN Nacelle_ambient_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, SUM(CASE WHEN Generator_bearing_temperature IS NULL THEN 1 ELSE 0 END) AS null_count FROM Wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature', SUM(CASE WHEN Gear_oil_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Ambient_temperature', SUM(CASE WHEN Ambient_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Rotor_Speed', SUM(CASE WHEN Rotor_Speed IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_temperature', SUM(CASE WHEN Nacelle_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter, SUM(CASE WHEN Bearing_temperature IS NULL THEN 1 ELSE 0 END) AS null_count FROM Wind_turbine
UNION ALL
SELECT 'Generator_speed', SUM(CASE WHEN Generator_speed IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Yaw_angle', SUM(CASE WHEN Yaw_angle IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Wind_direction', SUM(CASE WHEN Wind_direction IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature', SUM(CASE WHEN Wheel_hub_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature', SUM(CASE WHEN Gear_box_inlet_temperature IS NULL THEN 1 ELSE 0 END) FROM Wind_turbine;

#####DUPLICATES COUNT
select COUNT(*) from wind_turbine
group by date,Wind_speed,Power,Nacelle_ambient_temperature,Generator_bearing_temperature,Gear_oil_temperature,Ambient_temperature,
Rotor_Speed,Nacelle_temperature,Bearing_temperature,Generator_speed,Yaw_angle,Wind_direction,Wheel_hub_temperature,
Gear_box_inlet_temperature,Failure_status
having COUNT(*) > 1;

#####OUTLIERS COUNT
SELECT 'Wind_speed' AS parameter,
    COUNT(CASE WHEN ABS((Wind_speed - (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value
    FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wind_speed) AS std_dev FROM Wind_turbine) 
    AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Power' AS parameter,
    COUNT(CASE WHEN ABS((Power - (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value
    FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Power) AS std_dev FROM Wind_turbine) 
    AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Nacelle_ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Nacelle_ambient_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Generator_bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Generator_bearing_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Gear_oil_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_oil_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Gear_oil_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Ambient_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Ambient_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Ambient_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Rotor_Speed' AS parameter,
    COUNT(CASE WHEN ABS((Rotor_Speed - (SELECT mean_value FROM (SELECT AVG(Rotor_Speed) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Rotor_Speed) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Nacelle_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Nacelle_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Nacelle_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Bearing_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Bearing_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Bearing_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Generator_speed' AS parameter,
    COUNT(CASE WHEN ABS((Generator_speed - (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Generator_speed) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Yaw_angle' AS parameter,
    COUNT(CASE WHEN ABS((Yaw_angle - (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Yaw_angle) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Wind_direction' AS parameter,
    COUNT(CASE WHEN ABS((Wind_direction - (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Wind_direction) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Wheel_hub_temperature - (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Wheel_hub_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Gear_box_inlet_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Gear_box_inlet_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM Wind_turbine;

######AFTER PREPROCESSING######
#-------------------------------------------------------DATA CLEANING PROCESS----------------------------------------------------------#
create table wind_turbine_clean as select * from Wind_turbine;
select * from wind_turbine_clean;

#-------MEAN IMPUTATION FOR MISSING VALUES
SET sql_safe_updates = 0;

#Wind_speed
#Mean imputing for Wind_speed column
-- Calculating the average of the non-null values in Wind_speed
select avg(Wind_speed) as mean_value
from wind_turbine_clean
where Wind_speed is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Wind_speed) as mean_speed
from wind_turbine_clean
where Wind_speed is not null;
-- Updating null values in Wind_speed with the calculated mean
update wind_turbine_clean
set Wind_speed = ifnull(Wind_speed, (select mean_speed from tmp_mean));
drop temporary table if exists tmp_mean;

#Power
###Mean imputation for power colummn
#Mean imputing for power column
select avg(Power) as mean_value
from wind_turbine_clean
where Power is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Power) as mean_Power
from wind_turbine_clean
where Power is not null;
-- Updating null values in power with the calculated mean
update wind_turbine_clean
set Power = ifnull(Power, (select mean_Power from tmp_mean));
drop temporary table if exists tmp_mean;

#Nacelle_ambient_temperature 
###Mean imputation for Nacelle_ambient_temperature 
#Mean imputing for power column
select avg(Nacelle_ambient_temperature) as mean_value
from wind_turbine_clean
where Nacelle_ambient_temperature is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Nacelle_ambient_temperature) as mean_Nacelle_ambient_temperature
from wind_turbine_clean
where Nacelle_ambient_temperature is not null;
-- Updating null values in Nacelle_ambient_temperature with the calculated mean
update wind_turbine_clean
set Nacelle_ambient_temperature = ifnull(Nacelle_ambient_temperature, (select mean_Nacelle_ambient_temperature from tmp_mean));
drop temporary table if exists tmp_mean;

#Nacelle_temperature
###Mean imputation for Nacelle_temperature
#Mean imputing for Nacelle_temperature column
select avg(Nacelle_temperature) as mean_value
from wind_turbine_clean
where Nacelle_temperature is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Nacelle_temperature) as mean_Nacelle_temperature
from wind_turbine_clean
where Nacelle_temperature is not null;
-- Updating null values in Nacelle_temperature with the calculated mean
update wind_turbine_clean
set Nacelle_temperature = ifnull(Nacelle_temperature, (select mean_Nacelle_temperature from tmp_mean));
drop temporary table if exists tmp_mean;

#Generator_speed
###Mean imputation for Generator_speed
#Mean imputing for Generator_speed column
select avg(Generator_speed) as mean_value
from wind_turbine_clean
where Generator_speed is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Generator_speed) as mean_Generator_speed
from wind_turbine_clean
where Generator_speed is not null;
-- Updating null values in Generator_speed with the calculated mean
update wind_turbine_clean
set Generator_speed = ifnull(Generator_speed, (select mean_Generator_speed from tmp_mean));
drop temporary table if exists tmp_mean;

#Yaw_angle
###Mean imputation for Yaw_angle
#Mean imputing for Yaw_angle column
select avg(Yaw_angle) as mean_value
from wind_turbine_clean
where Yaw_angle is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Yaw_angle) as mean_Yaw_angle
from wind_turbine_clean
where Yaw_angle is not null;
-- Updating null values in Yaw_angle with the calculated mean
update wind_turbine_clean
set Yaw_angle = ifnull(Yaw_angle, (select mean_Yaw_angle from tmp_mean));
drop temporary table if exists tmp_mean;

#Gear_box_inlet_temperature
###Mean imputation for Gear_box_inlet_temperature
#Mean imputing for Gear_box_inlet_temperature column
select avg(Gear_box_inlet_temperature) as mean_value
from wind_turbine_clean
where Gear_box_inlet_temperature is not null;
-- Creating a temporary table to store the mean value
create temporary table tmp_mean as
select avg(Gear_box_inlet_temperature) as mean_Gear_box_inlet_temperature
from wind_turbine_clean
where Gear_box_inlet_temperature is not null;
-- Updating null values in Gear_box_inlet_temperature with the calculated mean
update wind_turbine_clean
set Gear_box_inlet_temperature = ifnull(Gear_box_inlet_temperature, (select mean_Gear_box_inlet_temperature from tmp_mean));
drop temporary table if exists tmp_mean;

-- drop table wind_turbine_clean;

##### OUTLIER  HANDLING USING Z-SCORE METHOD
###Wind_speed  
-- Calculate the mean and standard deviation
SELECT
  AVG(Wind_speed) AS mean_value,
  STDDEV(Wind_speed) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Wind_speed = (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Wind_speed - (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wind_speed) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;  

###Power
-- Calculate the mean and standard deviation
SELECT
  AVG(Power) AS mean_value,
  STDDEV(Power) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Power = (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Power - (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Power) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
###Nacelle_ambient_temperature    
-- Calculate the mean and standard deviation
SELECT
  AVG(Nacelle_ambient_temperature) AS mean_value,
  STDDEV(Nacelle_ambient_temperature) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Nacelle_ambient_temperature = (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Nacelle_ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Nacelle_ambient_temperature) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
###Generator_bearing_temperature
-- Calculate the mean and standard deviation
SELECT
  AVG(Generator_bearing_temperature) AS mean_value,
  STDDEV(Generator_bearing_temperature) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Generator_bearing_temperature = (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Generator_bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Generator_bearing_temperature) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
###Nacelle_temperature
-- Calculate the mean and standard deviation
SELECT
  AVG(Nacelle_temperature) AS mean_value,
  STDDEV(Nacelle_temperature) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Nacelle_temperature = (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Nacelle_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Nacelle_temperature) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
###Generator_speed
-- Calculate the mean and standard deviation
SELECT
  AVG(Generator_speed) AS mean_value,
  STDDEV(Generator_speed) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Generator_speed = (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Generator_speed - (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Generator_speed) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
 
### Yaw_angle
-- Calculate the mean and standard deviation
SELECT
  AVG(Yaw_angle) AS mean_value,
  STDDEV(Yaw_angle) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Yaw_angle = (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Yaw_angle - (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Yaw_angle) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
 ###Wind_direction
-- Calculate the mean and standard deviation
SELECT
  AVG(Wind_direction) AS mean_value,
  STDDEV(Wind_direction) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Wind_direction = (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Wind_direction - (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wind_direction) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
 
 ###Wheel_hub_temperature
-- Calculate the mean and standard deviation
SELECT
  AVG(Wheel_hub_temperature) AS mean_value,
  STDDEV(Wheel_hub_temperature) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Wheel_hub_temperature = (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Wheel_hub_temperature - (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wheel_hub_temperature) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
 ##Gear_box_inlet_temperature 
-- Calculate the mean and standard deviation
SELECT
  AVG(Gear_box_inlet_temperature) AS mean_value,
  STDDEV(Gear_box_inlet_temperature) AS std_dev
FROM
  wind_turbine_clean;
-- Update outliers with the mean value
UPDATE wind_turbine_clean
SET Gear_box_inlet_temperature = (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value
FROM wind_turbine_clean) AS mean_stats)
WHERE
  ABS((Gear_box_inlet_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value
  FROM wind_turbine_clean) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Gear_box_inlet_temperature) AS std_dev FROM wind_turbine_clean) 
  AS std_dev_stats))>3;
  
#####NULL VALUES COUNT AFTER CLEANED
SELECT 'total_rows' AS parameter, COUNT(*) AS null_count FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_speed', SUM(CASE WHEN Wind_speed IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Power', SUM(CASE WHEN Power IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature', SUM(CASE WHEN Nacelle_ambient_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, SUM(CASE WHEN Generator_bearing_temperature IS NULL THEN 1 ELSE 0 END) AS null_count FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature', SUM(CASE WHEN Gear_oil_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature', SUM(CASE WHEN Ambient_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed', SUM(CASE WHEN Rotor_Speed IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature', SUM(CASE WHEN Nacelle_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter, SUM(CASE WHEN Bearing_temperature IS NULL THEN 1 ELSE 0 END) AS null_count FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed', SUM(CASE WHEN Generator_speed IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle', SUM(CASE WHEN Yaw_angle IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction', SUM(CASE WHEN Wind_direction IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature', SUM(CASE WHEN Wheel_hub_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature', SUM(CASE WHEN Gear_box_inlet_temperature IS NULL THEN 1 ELSE 0 END) FROM wind_turbine_clean;
  
#####OUTLIERS COUNT AFTER CLEANED 
SELECT 'Wind_speed' AS parameter,
    COUNT(CASE WHEN ABS((Wind_speed - (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Wind_speed) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter,
    COUNT(CASE WHEN ABS((Power - (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Power) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Nacelle_ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Nacelle_ambient_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Generator_bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Generator_bearing_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Gear_oil_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_oil_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Gear_oil_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Ambient_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Ambient_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter,
    COUNT(CASE WHEN ABS((Rotor_Speed - (SELECT mean_value FROM (SELECT AVG(Rotor_Speed) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Rotor_Speed) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Nacelle_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Nacelle_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Bearing_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Bearing_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter,
    COUNT(CASE WHEN ABS((Generator_speed - (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Generator_speed) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter,
    COUNT(CASE WHEN ABS((Yaw_angle - (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Yaw_angle) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter,
    COUNT(CASE WHEN ABS((Wind_direction - (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Wind_direction) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Wheel_hub_temperature - (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Wheel_hub_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    COUNT(CASE WHEN ABS((Gear_box_inlet_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM wind_turbine_clean) AS mean_stats)) / 
    (SELECT std_dev FROM (SELECT STDDEV(Gear_box_inlet_temperature) AS std_dev FROM wind_turbine_clean) AS std_dev_stats)) > 3 THEN 1 END) AS outlier_count
FROM wind_turbine_clean;

#####UNIVARIANT ANALYSIS
#####1ST BUSINESS MOMENT DECISION
###MEAN
SELECT 'Wind_speed' AS parameter, AVG(Wind_speed) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter, AVG(Power) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, AVG(Nacelle_ambient_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, AVG(Generator_bearing_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, AVG(Gear_oil_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature' AS parameter, AVG(Ambient_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter, AVG(Rotor_Speed) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, AVG(Nacelle_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter, AVG(Bearing_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter, AVG(Generator_speed) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter, AVG(Yaw_angle) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter, AVG(Wind_direction) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, AVG(Wheel_hub_temperature) AS average_value FROM Wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, AVG(Gear_box_inlet_temperature) AS average_value FROM Wind_turbine_clean;

###MEDIAN
SELECT 'Wind_speed' AS parameter, Wind_speed AS median
FROM (
    SELECT Wind_speed, ROW_NUMBER() OVER (ORDER BY Wind_speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_wind_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Power' AS parameter, Power AS median
FROM (
    SELECT Power, ROW_NUMBER() OVER (ORDER BY Power) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_power
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, Nacelle_ambient_temperature AS median
FROM (
    SELECT Nacelle_ambient_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_ambient_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_nacelle_ambient_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Generator_bearing_temperature' AS parameter, Generator_bearing_temperature AS median
FROM (
    SELECT Generator_bearing_temperature, ROW_NUMBER() OVER (ORDER BY Generator_bearing_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_generator_bearing_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Gear_oil_temperature' AS parameter, Gear_oil_temperature AS median
FROM (
    SELECT Gear_oil_temperature, ROW_NUMBER() OVER (ORDER BY Gear_oil_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_gear_oil_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Ambient_temperature' AS parameter, Ambient_temperature AS median
FROM (
    SELECT Ambient_temperature, ROW_NUMBER() OVER (ORDER BY Ambient_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_ambient_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Rotor_Speed' AS parameter, Rotor_Speed AS median
FROM (
    SELECT Rotor_Speed, ROW_NUMBER() OVER (ORDER BY Rotor_Speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_rotor_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Nacelle_temperature' AS parameter, Nacelle_temperature AS median
FROM (
    SELECT Nacelle_temperature, ROW_NUMBER() OVER (ORDER BY Nacelle_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_nacelle_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION ALL
SELECT 'Bearing_temperature' AS parameter, Bearing_temperature AS median
FROM (
    SELECT Bearing_temperature, ROW_NUMBER() OVER (ORDER BY Bearing_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_bearing_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Generator_speed' AS parameter, Generator_speed AS median
FROM (
    SELECT Generator_speed, ROW_NUMBER() OVER (ORDER BY Generator_speed) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_generator_speed
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Yaw_angle' AS parameter, Yaw_angle AS median
FROM (
    SELECT Yaw_angle, ROW_NUMBER() OVER (ORDER BY Yaw_angle) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_yaw_angle
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Wind_direction' AS parameter, Wind_direction AS median
FROM (
    SELECT Wind_direction, ROW_NUMBER() OVER (ORDER BY Wind_direction) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_wind_direction
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Wheel_hub_temperature' AS parameter, Wheel_hub_temperature AS median
FROM (
    SELECT Wheel_hub_temperature, ROW_NUMBER() OVER (ORDER BY Wheel_hub_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_wheel_hub_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2
UNION
SELECT 'Gear_box_inlet_temperature' AS parameter, Gear_box_inlet_temperature AS median
FROM (
    SELECT Gear_box_inlet_temperature, ROW_NUMBER() OVER (ORDER BY Gear_box_inlet_temperature) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM wind_turbine_clean
) AS median_gear_box_inlet_temp
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

###MODE
(SELECT 'Wind_speed' AS parameter, Wind_speed AS mode, COUNT(Wind_speed) AS frequency
FROM wind_turbine_clean
GROUP BY Wind_speed
ORDER BY frequency DESC
LIMIT 1)
UNION
(SELECT 'Power' AS parameter, Power AS mode, COUNT(Power) AS frequency
FROM wind_turbine_clean
GROUP BY Power
ORDER BY frequency DESC
LIMIT 1)
UNION 
(SELECT 'Nacelle_ambient_temperature' AS parameter, Nacelle_ambient_temperature AS mode, COUNT(Nacelle_ambient_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Nacelle_ambient_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION 
(SELECT 'Generator_bearing_temperature' AS parameter, Generator_bearing_temperature AS mode, COUNT(Generator_bearing_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Generator_bearing_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Gear_oil_temperature' AS parameter, Gear_oil_temperature AS mode, COUNT(Gear_oil_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Gear_oil_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Ambient_temperature' AS parameter, Ambient_temperature AS mode, COUNT(Ambient_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Ambient_temperature 
ORDER BY frequency DESC 
LIMIT 1)
UNION ALL
(SELECT 'Rotor_Speed' AS parameter, Rotor_Speed AS mode, COUNT(Rotor_Speed) AS frequency 
FROM wind_turbine_clean 
GROUP BY Rotor_Speed 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Nacelle_temperature' AS columns, Nacelle_temperature AS mode, COUNT(Nacelle_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Nacelle_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Bearing_temperature' AS parameter, Bearing_temperature AS mode, COUNT(Bearing_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Bearing_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Generator_speed' AS parameter, Generator_speed AS mode, COUNT(Generator_speed) AS frequency 
FROM wind_turbine_clean 
GROUP BY Generator_speed 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Yaw_angle' AS parameter, Yaw_angle AS mode, COUNT(Yaw_angle) AS frequency 
FROM wind_turbine_clean 
GROUP BY Yaw_angle 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Wind_direction' AS parameter, Wind_direction AS mode, COUNT(Wind_direction) AS frequency 
FROM wind_turbine_clean 
GROUP BY Wind_direction 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Wheel_hub_temperature' AS parameter, Wheel_hub_temperature AS mode, COUNT(Wheel_hub_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Wheel_hub_temperature 
ORDER BY frequency DESC 
LIMIT 1
)
UNION ALL
(SELECT 'Gear_box_inlet_temperature' AS parameter, Gear_box_inlet_temperature AS mode, COUNT(Gear_box_inlet_temperature) AS frequency 
FROM wind_turbine_clean 
GROUP BY Gear_box_inlet_temperature 
ORDER BY frequency DESC 
LIMIT 1
);

#####2ND BUSINESS MOMENT DECISION
###VARIANCE
SELECT 'Wind_speed' AS parameter, VARIANCE(Wind_speed) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter, VARIANCE(Power) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, VARIANCE(Nacelle_ambient_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, VARIANCE(Generator_bearing_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, VARIANCE(Gear_oil_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature' AS parameter, VARIANCE(Ambient_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter, VARIANCE(Rotor_Speed) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, VARIANCE(Nacelle_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter, VARIANCE(Bearing_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter, VARIANCE(Generator_speed) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter, VARIANCE(Yaw_angle) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter, VARIANCE(Wind_direction) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, VARIANCE(Wheel_hub_temperature) AS variance_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, VARIANCE(Gear_box_inlet_temperature) AS variance_value
FROM wind_turbine_clean;

###STANDARD DEVIATION
SELECT 'Wind_speed' AS parameter, STDDEV(Wind_speed) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter, STDDEV(Power) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, STDDEV(Nacelle_ambient_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, STDDEV(Generator_bearing_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, STDDEV(Gear_oil_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature' AS parameter, STDDEV(Ambient_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter, STDDEV(Rotor_Speed) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, STDDEV(Nacelle_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter, STDDEV(Bearing_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter, STDDEV(Generator_speed) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter, STDDEV(Yaw_angle) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter, STDDEV(Wind_direction) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter, STDDEV(Wheel_hub_temperature) AS standard_deviation
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter, STDDEV(Gear_box_inlet_temperature) AS standard_deviation
FROM wind_turbine_clean;

###RANGE
SELECT 
    parameter,
    MAX(CASE WHEN attribute = 'max_value' THEN value END) AS max_value,
    MAX(CASE WHEN attribute = 'min_value' THEN value END) AS min_value,
    MAX(CASE WHEN attribute = 'range_value' THEN value END) AS range_value
FROM (
    SELECT 'Wind_speed' AS parameter, 'max_value' AS attribute, MAX(Wind_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wind_speed' AS parameter, 'min_value' AS attribute, MIN(Wind_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wind_speed' AS parameter, 'range_value' AS attribute, MAX(Wind_speed) - MIN(Wind_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Power' AS parameter, 'max_value' AS attribute, MAX(Power) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Power' AS parameter, 'min_value' AS attribute, MIN(Power) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Power' AS parameter, 'range_value' AS attribute, MAX(Power) - MIN(Power) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'max_value' AS attribute, MAX(Nacelle_ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'min_value' AS attribute, MIN(Nacelle_ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_ambient_temperature' AS parameter, 'range_value' AS attribute, MAX(Nacelle_ambient_temperature) - MIN(Nacelle_ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'max_value' AS attribute, MAX(Generator_bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'min_value' AS attribute, MIN(Generator_bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_bearing_temperature' AS parameter, 'range_value' AS attribute, MAX(Generator_bearing_temperature) - MIN(Generator_bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'max_value' AS attribute, MAX(Gear_oil_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'min_value' AS attribute, MIN(Gear_oil_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_oil_temperature' AS parameter, 'range_value' AS attribute, MAX(Gear_oil_temperature) - MIN(Gear_oil_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'max_value' AS attribute, MAX(Ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'min_value' AS attribute, MIN(Ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Ambient_temperature' AS parameter, 'range_value' AS attribute, MAX(Ambient_temperature) - MIN(Ambient_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'max_value' AS attribute, MAX(Rotor_Speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'min_value' AS attribute, MIN(Rotor_Speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Rotor_Speed' AS parameter, 'range_value' AS attribute, MAX(Rotor_Speed) - MIN(Rotor_Speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'max_value' AS attribute, MAX(Nacelle_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'min_value' AS attribute, MIN(Nacelle_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Nacelle_temperature' AS parameter, 'range_value' AS attribute, MAX(Nacelle_temperature) - MIN(Nacelle_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'max_value' AS attribute, MAX(Bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'min_value' AS attribute, MIN(Bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Bearing_temperature' AS parameter, 'range_value' AS attribute, MAX(Bearing_temperature) - MIN(Bearing_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'max_value' AS attribute, MAX(Generator_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'min_value' AS attribute, MIN(Generator_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Generator_speed' AS parameter, 'range_value' AS attribute, MAX(Generator_speed) - MIN(Generator_speed) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'max_value' AS attribute, MAX(Yaw_angle) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'min_value' AS attribute, MIN(Yaw_angle) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Yaw_angle' AS parameter, 'range_value' AS attribute, MAX(Yaw_angle) - MIN(Yaw_angle) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'max_value' AS attribute, MAX(Wind_direction) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'min_value' AS attribute, MIN(Wind_direction) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wind_direction' AS parameter, 'range_value' AS attribute, MAX(Wind_direction) - MIN(Wind_direction) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'max_value' AS attribute, MAX(Wheel_hub_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'min_value' AS attribute, MIN(Wheel_hub_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Wheel_hub_temperature' AS parameter, 'range_value' AS attribute, MAX(Wheel_hub_temperature) - MIN(Wheel_hub_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'max_value' AS attribute, MAX(Gear_box_inlet_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'min_value' AS attribute, MIN(Gear_box_inlet_temperature) AS value FROM wind_turbine_clean
    UNION ALL
    SELECT 'Gear_box_inlet_temperature' AS parameter, 'range_value' AS attribute, MAX(Gear_box_inlet_temperature) - MIN(Gear_box_inlet_temperature) AS value FROM wind_turbine_clean
) AS subquery
GROUP BY parameter;

#####THIRD BUSINESS MOMENT DECISION
###SKEWNESS
SELECT 'Wind_speed' AS parameter,
    (SUM(POWER(Wind_speed - (SELECT AVG(Wind_speed) FROM wind_turbine_clean ), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_speed) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter,
    (SUM(POWER(Power - (SELECT AVG(Power) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Power) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter,
    (SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter,
    (SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter,
    (SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Ambient_temperature' AS parameter,
    (SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter,
    (SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter,
    (SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter,
    (SUM(POWER(Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Bearing_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter,
    (SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter,
    (SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter,
    (SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    (SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    (SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine_clean), 3)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine_clean), 3))) AS skewness_value
FROM wind_turbine_clean;

#####4TH BUSINESS MOMENT DECISION
###KURTOSIS
SELECT 'Wind_speed' AS parameter, 
    ((SUM(POWER(Wind_speed - (SELECT AVG(Wind_speed) FROM Wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Wind_speed) FROM Wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM Wind_turbine_clean
UNION ALL
SELECT 'Power' AS parameter, 
    ((SUM(POWER(Power - (SELECT AVG(Power) FROM Wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Power) FROM Wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM Wind_turbine_clean
UNION ALL
SELECT 'Nacelle_ambient_temperature' AS parameter, 
    ((SUM(POWER(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_bearing_temperature' AS parameter, 
    ((SUM(POWER(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_oil_temperature' AS parameter, 
    ((SUM(POWER(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL

SELECT 'Ambient_temperature' AS parameter, 
    ((SUM(POWER(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Ambient_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Rotor_Speed' AS parameter, 
    ((SUM(POWER(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Rotor_Speed) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Nacelle_temperature' AS parameter, 
    ((SUM(POWER(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Nacelle_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Bearing_temperature' AS parameter, 
    ((SUM(POWER(Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Bearing_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Generator_speed' AS parameter, 
    ((SUM(POWER(Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Generator_speed) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Yaw_angle' AS parameter, 
    ((SUM(POWER(Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine_clean), 4)) / 
    (COUNT(*) * POWER((SELECT STDDEV(Yaw_angle) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wind_direction' AS parameter,
    ((SUM(POWER(Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine_clean), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Wind_direction) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Wheel_hub_temperature' AS parameter,
    ((SUM(POWER(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine_clean), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean
UNION ALL
SELECT 'Gear_box_inlet_temperature' AS parameter,
    ((SUM(POWER(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine_clean), 4)) /
    (COUNT(*) * POWER((SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine_clean), 4))) - 3) AS kurtosis_value
FROM wind_turbine_clean;


######BIVARIANT ANALYSIS AFTER CLEANED
##CORRELATION COEFFICIENT
-- Calculate correlation coefficient between Wind_speed and Power
SELECT
  (COUNT(*) * SUM(Wind_speed * Power) - SUM(Wind_speed) * SUM(Power)) /
  SQRT((COUNT(*) * SUM(Wind_speed * Wind_speed) - POW(SUM(Wind_speed), 2)) *
       (COUNT(*) * SUM(Power * Power) - POW(SUM(Power), 2))) AS correlation_coefficient
FROM
  Wind_turbine_clean;
-- Calculate correlation coefficient between Wind_speed and Nacelle_ambient_temperature
select (count(*) * sum(Wind_speed * Nacelle_ambient_temperature) - sum(Wind_speed) * sum(Nacelle_ambient_temperature)) /
        sqrt((count(*) * sum(Wind_speed * Wind_speed) - pow(sum(Wind_speed),2)) *
            (count(*) * sum(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - pow(sum(Nacelle_ambient_temperature),2))) as correlation_coefficient
from Wind_turbine_clean;
-- Calculate correlation coefficient between  Nacelle_ambient_temperature and Generator_bearing_temperature
select (count(*) * sum(Nacelle_ambient_temperature * Generator_bearing_temperature) - sum(Nacelle_ambient_temperature) * sum(Generator_bearing_temperature)) /
        sqrt((count(*) * sum(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - pow(sum(Nacelle_ambient_temperature),2)) *
            (count(*) * sum(Generator_bearing_temperature * Generator_bearing_temperature) - pow(sum(Generator_bearing_temperature),2))) as correlation_coefficient
from Wind_turbine_clean;
-- Calculate correlation coefficient between Nacelle_ambient_temperature and Power
SELECT
  (COUNT(*) * SUM(Nacelle_ambient_temperature * Power) - SUM(Nacelle_ambient_temperature) * SUM(Power)) /
  SQRT((COUNT(*) * SUM(Nacelle_ambient_temperature * Nacelle_ambient_temperature) - POW(SUM(Nacelle_ambient_temperature), 2)) *
       (COUNT(*) * SUM(Power * Power) - POW(SUM(Power), 2))) AS correlation_coefficient
FROM
  Wind_turbine_clean;
-- Calculate correlation coefficient between Wind_direction and Wind_speed
SELECT
  (COUNT(*) * SUM(Wind_direction * Failure_status) - SUM(Wind_direction) * SUM(Wind_speed)) /
  SQRT((COUNT(*) * SUM(Wind_direction * Wind_direction) - POW(SUM(Wind_direction), 2)) *
       (COUNT(*) * SUM(Wind_speed *Wind_speed) - POW(SUM(Wind_speed), 2))) AS correlation_coefficient
FROM
  Wind_turbine_clean;
#-- Calculate correlation coefficient between Generator_bearing_temperature and Gear_oil_temperature
SELECT
  (COUNT(*) * SUM(Generator_bearing_temperature  * Gear_oil_temperature) - SUM(Generator_bearing_temperature) * SUM(Gear_oil_temperature)) /
  SQRT((COUNT(*) * SUM(Generator_bearing_temperature * Generator_bearing_temperature) - POW(SUM(Generator_bearing_temperature), 2)) *
       (COUNT(*) * SUM(Gear_oil_temperature *Gear_oil_temperature) - POW(SUM(Gear_oil_temperature), 2))) AS correlation_coefficient
FROM
  Wind_turbine_clean;
 #-- Calculate correlation coefficient between  Gear_oil_temperature and Rotor_speed
select (count(*) * sum(Gear_oil_temperature * Rotor_Speed) - sum(Gear_oil_temperature) * sum(Rotor_Speed)) /
        sqrt((count(*) * sum(Gear_oil_temperature * Gear_oil_temperature) - pow(sum(Gear_oil_temperature),2)) *
            (count(*) * sum(Rotor_Speed * Rotor_Speed) - pow(sum(Rotor_Speed),2))) as correlation_coefficient
from Wind_turbine_clean;
  
#####COVARIANCE 
#-- Calculate covariance between Wind_speed and Power
SELECT 
  AVG((Wind_speed - avg_Wind_speed) * (Power - avg_Power)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Wind_speed) AS avg_Wind_speed, AVG(Power) AS avg_Power
  FROM Wind_turbine_clean) AS subquery;
-- Calculate  covariance between Wind_speed and Nacelle_ambient_temperature
SELECT 
  AVG((Wind_speed - avg_Wind_speed) * (Nacelle_ambient_temperature - avg_Nacelle_ambient_temperature)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Wind_speed) AS avg_Wind_speed, AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature
  FROM Wind_turbine_clean) AS subquery;
-- Calculate  covariance between  Nacelle_ambient_temperature and Generator_bearing_temperature
SELECT 
  AVG(( Nacelle_ambient_temperature- avg_Nacelle_ambient_temperature) * (Generator_bearing_temperature- avg_Generator_bearing_temperature)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature, AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature
  FROM Wind_turbine_clean) AS subquery;
#-- Calculate covariance between Nacelle_ambient_temperature and Power
SELECT
  AVG((Nacelle_ambient_temperature - avg_Nacelle_ambient_temperature) * (Power - avg_Power)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Nacelle_ambient_temperature) AS avg_Nacelle_ambient_temperature, AVG(Power) AS avg_Power
  FROM Wind_turbine_clean) AS subquery;
  
#-- Calculate covariance between  Wind_direction and Wind_speed
SELECT
  AVG((Wind_direction - avg_Wind_direction) * ( Wind_speed - avg_Wind_speed)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Wind_direction) AS avg_Wind_direction, AVG( Wind_speed) AS avg_Wind_speed
  FROM Wind_turbine_clean) AS subquery;

#-- Calculate covariance between Generator_bearing_temperature and Gear_oil_temperature
SELECT
  AVG((Generator_bearing_temperature - avg_Generator_bearing_temperature) * (Gear_oil_temperature - avg_Gear_oil_temperature)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature, AVG(Gear_oil_temperature) AS avg_Gear_oil_temperature
  FROM Wind_turbine_clean) AS subquery;
  
#-- Calculate covariance between Generator_bearing_temperature and Rotor_speed
SELECT
  AVG((Generator_bearing_temperature - avg_Generator_bearing_temperature) * (Rotor_speed - avg_Rotor_speed)) AS covariance
FROM
  Wind_turbine_clean,
  (SELECT AVG(Generator_bearing_temperature) AS avg_Generator_bearing_temperature, AVG(Rotor_speed) AS avg_Rotor_speed
  FROM Wind_turbine_clean) AS subquery;
  
