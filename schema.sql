-- Create PlayerStats table
CREATE TABLE PlayerStats (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    club VARCHAR(100),
    country VARCHAR(100),
    age INT,
    overall_rating INT
);

-- Create Positions table
CREATE TABLE Positions (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(10)
);

-- Create PlayerPositions table (bridge table)
CREATE TABLE PlayerPositions (
    player_id INT,
    position_id INT,
    PRIMARY KEY (player_id, position_id),
    FOREIGN KEY (player_id) REFERENCES PlayerStats(player_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);

--Top 5 players overall
SELECT name, club, overall_rating
FROM PlayerStats
ORDER BY overall_rating DESC
LIMIT 5;


--Top 3 players per position
SELECT *
FROM (
    SELECT 
        p.name, 
        pos.position_name, 
        p.overall_rating,
        RANK() OVER (PARTITION BY pos.position_name ORDER BY p.overall_rating DESC) AS rnk
    FROM PlayerStats p
    JOIN PlayerPositions pp ON p.player_id = pp.player_id
    JOIN Positions pos ON pp.position_id = pos.position_id
) ranked
WHERE rnk <= 3;


--Avg rating by country 
SELECT country, ROUND(AVG(overall_rating),2) AS avg_rating
FROM PlayerStats
GROUP BY country
ORDER BY avg_rating DESC;


--Avg rating by club 
SELECT club, ROUND(AVG(overall_rating),2) AS avg_rating
FROM PlayerStats
GROUP BY club
ORDER BY avg_rating DESC;


--Players with "ELITE" tag
SELECT 
    name, 
    overall_rating,
    CASE 
        WHEN overall_rating >= 90 THEN 'Elite'
        WHEN overall_rating >= 85 THEN 'Top Tier'
        ELSE 'Good'
    END AS player_level
FROM PlayerStats;
