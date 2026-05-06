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
